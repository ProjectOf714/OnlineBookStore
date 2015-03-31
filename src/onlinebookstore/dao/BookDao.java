/*
 *
 */
package onlinebookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import onlinebookstore.entity.BookInfo;
import onlinebookstore.util.DBConnect;

public class BookDao extends BaseDao {

	public BookDao() {
		super();
	}

	public List<BookInfo> getBookBySubcategory(int subcategoryID) {
		List<BookInfo> lstResult = new ArrayList<BookInfo>();

		String sql = "select * from books where SubCategoryID = ?;";
		try {
			DBConnect dbConn = new DBConnect(pool);
			dbConn.prepareStatement(sql);
			dbConn.setInt(1, subcategoryID);
			ResultSet rset = dbConn.executeQuery();
			while (rset.next()) {
				lstResult.add(new BookInfo(rset.getInt(1), rset.getInt(2), rset
						.getString(3), rset.getString(4), rset.getFloat(5),
						rset.getString(6), rset.getInt(7), rset.getString(8)));
			}

			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}

		return lstResult;
	}

	public List<BookInfo> getBookByKeyword(String strKeyword) {
		List<BookInfo> lstResult = new ArrayList<BookInfo>();

		String sql = "select * from books where Title like ? or Description like ?;";
		try {
			DBConnect dbConn = new DBConnect(pool);
			dbConn.prepareStatement(sql);
			dbConn.setString(1, "%" + strKeyword + "%");
			dbConn.setString(2, "%" + strKeyword + "%");
			ResultSet rset = dbConn.executeQuery();
			while (rset.next()) {
				lstResult.add(new BookInfo(rset.getInt(1), rset.getInt(2), rset
						.getString(3), rset.getString(4), rset.getFloat(5),
						rset.getString(6), rset.getInt(7), rset.getString(8)));
			}

			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}

		return lstResult;
	}

	public BookInfo getBookByISBN(int isbn) {
		BookInfo bookResult = null;

		String sql = "select * from books where ISBN = ?;";
		try {
			DBConnect dbConn = new DBConnect(pool);
			dbConn.prepareStatement(sql);
			dbConn.setInt(1, isbn);
			ResultSet rset = dbConn.executeQuery();
			if (rset.next()) {
				bookResult = new BookInfo(rset.getInt(1), rset.getInt(2),
						rset.getString(3), rset.getString(4), rset.getFloat(5),
						rset.getString(6), rset.getInt(7), rset.getString(8));
			}

			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}

		return bookResult;
	}
}
