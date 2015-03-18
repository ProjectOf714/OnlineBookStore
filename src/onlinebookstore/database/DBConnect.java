/*
 *
 */
package onlinebookstore.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect {
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement prepstmt = null;
	private DBConnectionManager dcm = null;

	void init() {
		dcm = DBConnectionManager.getInstance();
		conn = dcm.getConnection("mysql");
	}

	public DBConnect() throws Exception {
		init();
		stmt = conn.createStatement();
	}

	public DBConnect(int resultSetType, int resultSetConcurrency)
			throws Exception {
		init();
		stmt = conn.createStatement(resultSetType, resultSetConcurrency);
	}

	public DBConnect(String sql) throws Exception {
		init();
		this.prepareStatement(sql);
	}

	public DBConnect(String sql, int resultSetType, int resultSetConcurrency)
			throws Exception {
		init();
		this.prepareStatement(sql, resultSetType, resultSetConcurrency);
	}

	// ∑µªÿ¡¨Ω”
	public Connection getConnection() {
		return conn;
	}

	public void close() throws Exception {
		if (stmt != null) {
			stmt.close();
			stmt = null;
		}
		if (prepstmt != null) {
			prepstmt.close();
			prepstmt = null;
		}
		if (conn != null) {
			dcm.freeConnection("mysql", conn);
		}
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

	public Statement getStatement() {
		return stmt;
	}

	public ResultSet executeQuery(String sql) throws SQLException {
		if (stmt != null) {
			return stmt.executeQuery(sql);
		} else
			return null;
	}

	public ResultSet executeQuery() throws SQLException {
		if (prepstmt != null) {
			return prepstmt.executeQuery();
		} else
			return null;
	}

	public int executeUpdate(String sql) throws SQLException {
		if (stmt != null)
			return stmt.executeUpdate(sql);
		else
			return -1;
	}

	public int executeUpdate() throws SQLException {
		if (prepstmt != null)
			return prepstmt.executeUpdate();
		else
			return -1;
	}

}
