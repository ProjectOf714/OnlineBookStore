/*
 *
 */
package onlinebookstore.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class DBConnect {
	protected static final Logger log = LogManager.getLogger(DBConnect.class);
	protected Connection conn = null;
	protected Statement stmt = null;
	protected PreparedStatement prepstmt = null;

	public DBConnect(DataSource pool) throws Exception {
		// Get a connection from the pool
		conn = pool.getConnection();
	}

	public void close() throws Exception {
		try {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}

			if (prepstmt != null) {
				prepstmt.close();
				prepstmt = null;
			}

			// Close the Connection to return it to the pool
			if (conn != null)
				conn.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @return current connection
	 */
	public Connection getConnection() {
		return conn;
	}

	public void prepareStatement(String sql) throws SQLException {
		prepstmt = conn.prepareStatement(sql);
	}

	public void prepareStatement(String sql, int resultSetType,
			int resultSetConcurrency) throws SQLException {
		prepstmt = conn.prepareStatement(sql, resultSetType,
				resultSetConcurrency);
	}

	public void setString(int index, String value) throws SQLException {
		prepstmt.setString(index, value);
	}

	public void setInt(int index, int value) throws SQLException {
		prepstmt.setInt(index, value);
	}

	public void setBoolean(int index, boolean value) throws SQLException {
		prepstmt.setBoolean(index, value);
	}

	public void setDate(int index, Date value) throws SQLException {
		prepstmt.setDate(index, value);
	}

	public void setLong(int index, long value) throws SQLException {
		prepstmt.setLong(index, value);
	}

	public void setFloat(int index, float value) throws SQLException {
		prepstmt.setFloat(index, value);
	}

	public void setBytes(int index, byte[] value) throws SQLException {
		prepstmt.setBytes(index, value);
	}

	public void clearParameters() throws SQLException {
		prepstmt.clearParameters();
		prepstmt = null;
	}

	public PreparedStatement getPreparedStatement() {
		return prepstmt;
	}

	public ResultSet executeQuery() throws SQLException {
		if (prepstmt != null) {
			return prepstmt.executeQuery();
		} else
			return null;
	}

	public int executeUpdate() throws SQLException {
		if (prepstmt != null)
			return prepstmt.executeUpdate();
		else
			return -1;
	}

	public Object executeScalar() throws SQLException {
		Object obj = null;
		if (prepstmt != null) {
			try {
				ResultSet rs = executeQuery();
				obj = rs.getObject(1);
			} catch (SQLException e) {
				log.error("", e);
			}
		}

		return obj;
	}

	public void SetStatement(int resultSetType, int resultSetConcurrency)
			throws SQLException {
		stmt = conn.createStatement(resultSetType, resultSetConcurrency);
	}

	public ResultSet executeQuery(String sql) throws SQLException {
		if (stmt == null) {
			stmt = conn.createStatement();
		}

		return stmt.executeQuery(sql);
	}

	public int executeUpdate(String sql) throws SQLException {
		if (stmt == null) {
			stmt = conn.createStatement();
		}

		return stmt.executeUpdate(sql);
	}

	public Object executeScalar(String sql) throws SQLException {
		Object obj = null;
		if (stmt == null) {
			stmt = conn.createStatement();
		}

		try {
			ResultSet rs = stmt.executeQuery(sql);
			obj = rs.getObject(1);
		} catch (SQLException e) {
			log.error("", e);
		}

		return obj;
	}
}