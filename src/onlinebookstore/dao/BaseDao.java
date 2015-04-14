/*
 * This class will handle the DataSource Pool, the other should extend from this
 */
package onlinebookstore.dao;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class BaseDao {
	protected DataSource pool;
	protected static final Logger log = LogManager.getLogger(BaseDao.class);

	/**
	 * construct: retrieve the datasource from context.
	 */
	public BaseDao() {
		try {
			// Create a JNDI Initial context to be able to lookup the DataSource
			InitialContext ctx = new InitialContext();
			// Lookup the DataSource, which will be backed by a pool
			// that the application server provides.
			pool = (DataSource) ctx.lookup("java:comp/env/jdbc/OBS");
			if (pool == null)
				throw new Exception("Unknown DataSource 'jdbc/OBS'");
		} catch (Exception ex) {
			log.error("InitDatabaseConnectionPool", ex);
		}
	}
}
