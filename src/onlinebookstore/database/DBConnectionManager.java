/**
 *
 */
package onlinebookstore.database;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;
import java.util.StringTokenizer;
import java.util.Vector;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 *
 */
public class DBConnectionManager {
	private static Logger log = LogManager.getLogger(DBConnectionManager.class
			.getName());
	private static DBConnectionManager instance;

	static private int clients;

	private Vector<Driver> drivers = new Vector<Driver>(); // Driver
	// connection pool
	private Hashtable<String, DBConnectionPool> pools = new Hashtable<String, DBConnectionPool>();

	/**
	 * Create a static method to get instance.
	 */
	static synchronized public DBConnectionManager getInstance() {
		if (instance == null) {
			instance = new DBConnectionManager();
		}
		clients++;
		return instance;
	}

	private DBConnectionManager() {
		init();
	}

	public void freeConnection(String name, Connection con) {
		DBConnectionPool pool = pools.get(name);
		if (pool != null) {
			pool.freeConnection(con);
		}
	}

	public Connection getConnection(String name) {
		DBConnectionPool pool = pools.get(name);
		if (pool != null) {
			return pool.getConnection();
		}
		return null;
	}

	/**
	 * get a idle connection.
	 */
	public Connection getConnection(String name, long time) {
		DBConnectionPool pool = pools.get(name);
		if (pool != null) {
			return pool.getConnection(time);
		}
		return null;
	}

	/**
	 * release all connection
	 */
	public synchronized void release() {
		if (--clients != 0) {
			return;
		}

		Enumeration<DBConnectionPool> allPools = pools.elements();
		while (allPools.hasMoreElements()) {
			DBConnectionPool pool = allPools.nextElement();
			pool.release();
		}

		Enumeration<Driver> allDrivers = drivers.elements();
		while (allDrivers.hasMoreElements()) {
			Driver driver = allDrivers.nextElement();
			try {
				DriverManager.deregisterDriver(driver);
				log.info("Release the JDBC driver: "
						+ driver.getClass().getName());
			} catch (SQLException e) {
				log.error(" Can not release the JDBC driver "
						+ driver.getClass().getName() + ",Detail:"
						+ e.toString());
			}
		}
	}

	private void createPools(Properties props) {
		Enumeration<?> propNames = props.propertyNames();
		while (propNames.hasMoreElements()) {
			String name = (String) propNames.nextElement();
			if (name.endsWith(".url")) {
				String poolName = name.substring(0, name.lastIndexOf("."));
				String url = props.getProperty(poolName + ".url");
				if (url == null) {
					log.error("There is no url for " + poolName);
					continue;
				}
				String user = props.getProperty(poolName + ".user");
				String password = props.getProperty(poolName + ".password");
				String maxconn = props.getProperty(poolName + ".maxconn", "0");
				int max;
				try {
					max = Integer.valueOf(maxconn).intValue();
				} catch (NumberFormatException e) {
					log.error("The max connection is error of : " + maxconn
							+ " for: " + poolName);
					max = 0;
				}
				DBConnectionPool pool = new DBConnectionPool(poolName, url,
						user, password, max);
				pools.put(poolName, pool);
				log.info("Create pool success:" + poolName);
			}
		}
	}

	private void init() {
		InputStream is = getClass().getResourceAsStream("/DBConfig.properties");
		Properties dbProps = new Properties();
		try {
			dbProps.load(is);
		} catch (Exception e) {
			log.error(" Can not load the DBConfig.propertie. "
					+ " please make sure the exists in CLASSPATH" + ",Detail:"
					+ e.toString());
			return;
		}

		loadDrivers(dbProps);
		createPools(dbProps);
	}

	private void loadDrivers(Properties props) {
		String driverClasses = props.getProperty("drivers");
		StringTokenizer st = new StringTokenizer(driverClasses);
		while (st.hasMoreElements()) {
			String driverClassName = st.nextToken().trim();
			try {
				Driver driver = (Driver) Class.forName(driverClassName)
						.newInstance();
				DriverManager.registerDriver(driver);
				drivers.addElement(driver);
				log.info("Registered the JDBC:" + driverClassName);
			} catch (Exception e) {
				log.error("Can not register the JDBC driver" + driverClassName
						+ ",Detail:" + e.toString());
			}
		}
	}

	class DBConnectionPool {
		private int checkedOut;
		private Vector<Connection> freeConnections = new Vector<Connection>();
		private int maxConn;
		private String name;
		private String password;
		private String URL;
		private String user;

		public DBConnectionPool(String name, String URL, String user,
				String password, int maxConn) {
			this.name = name;
			this.URL = URL;
			this.user = user;
			this.password = password;
			this.maxConn = maxConn;
		}

		public synchronized void freeConnection(Connection con) {
			freeConnections.addElement(con);
			checkedOut--;
			notifyAll();
		}

		public synchronized Connection getConnection() {
			Connection con = null;
			if (freeConnections.size() > 0) {

				con = freeConnections.firstElement();
				freeConnections.removeElementAt(0);
				try {
					if (con.isClosed()) {
						log.info("Delete a invalid connection:" + name);
						con = getConnection();
					}
				} catch (SQLException e) {
					log.error("Can not get connection,Detail:" + e.toString());
				}
			} else if (maxConn == 0 || checkedOut < maxConn) {
				con = newConnection();
			}
			if (con != null) {
				checkedOut++;
			}
			return con;
		}

		public synchronized Connection getConnection(long timeout) {
			long startTime = new Date().getTime();
			Connection con;
			while ((con = getConnection()) == null) {
				try {
					wait(timeout);
				} catch (InterruptedException e) {
				}
				if (new Date().getTime() - startTime >= timeout) {

					return null;
				}
			}
			return con;
		}

		public synchronized void release() {
			Enumeration<Connection> allConnections = freeConnections.elements();
			while (allConnections.hasMoreElements()) {
				Connection con = allConnections.nextElement();
				try {
					con.close();
					log.info("Closed a connection of :" + name);
				} catch (SQLException e) {
					log.error("Can not closed connection in :" + name
							+ ",Detail:" + e.toString());
				}
			}
			freeConnections.removeAllElements();
		}

		private Connection newConnection() {
			Connection con = null;
			try {
				if (user == null) {
					con = DriverManager.getConnection(URL);
				} else {
					con = DriverManager.getConnection(URL, user, password);
				}
				log.info("Created a connection of pool:" + name);
			} catch (SQLException e) {
				log.error("Can not create connection of the URL :" + URL
						+ ",Detail:" + e.toString());
				return null;
			}
			return con;
		}
	}
}