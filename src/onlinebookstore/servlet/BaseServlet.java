/*
 *
 */
package onlinebookstore.servlet;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * This servlet will provide the common object, like log4j2, DatabaseConnection
 * Pool Other servlet should be extends from this.
 */
// @WebServlet("/BaseServlet")
public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static final Logger log = LogManager.getLogger(BaseServlet.class);
	protected DataSource pool; // Database connection pool

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BaseServlet() {
		super();
		log.debug("BaseServlet constructor called.");
	}

	@Override
	public void init() throws ServletException {
		try {
			// Create a JNDI Initial context to be able to lookup the DataSource
			InitialContext ctx = new InitialContext();
			// Lookup the DataSource, which will be backed by a pool
			// that the application server provides.
			pool = (DataSource) ctx.lookup("java:comp/env/jdbc/OBS");
			if (pool == null)
				throw new ServletException("Unknown DataSource 'jdbc/OBS'");
		} catch (NamingException ex) {
			ex.printStackTrace();
			log.error("InitDatabaseConnectionPool", ex);
		}
	}
}
