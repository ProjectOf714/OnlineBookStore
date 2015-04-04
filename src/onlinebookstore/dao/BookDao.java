/*
 *
 */
package onlinebookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;

import onlinebookstore.entity.BookInfo;
import onlinebookstore.entity.Subcategory;
import onlinebookstore.util.DBConnect;
import onlinebookstore.util.EntityHelper;

import org.dom4j.Element;
import org.dom4j.io.SAXReader;

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
			lstResult = EntityHelper.getListFromRS(BookInfo.class, rset);
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
			lstResult = EntityHelper.getListFromRS(BookInfo.class, rset);

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
			List<BookInfo> lstResult = EntityHelper.getListFromRS(
					BookInfo.class, rset, true);
			if (!lstResult.isEmpty()) {
				bookResult = lstResult.get(0);
			}

			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}

		return bookResult;
	}

	public List<BookInfo> parseFromXML(String xmlFileName) {
		List<BookInfo> lstResult = new LinkedList<BookInfo>();

		try {
			CategoryDao cateDao = new CategoryDao();
			List<Subcategory> lstSubCate = cateDao.getSubCategory();
			Optional<Subcategory> findSub = lstSubCate.stream()
					.filter(ss -> ss.getSubCategoryID() == 3).findFirst();

			int currID = 1;
			org.dom4j.io.SAXReader reader = new SAXReader();
			org.dom4j.Document document = reader.read(xmlFileName);
			org.dom4j.Element root = document.getRootElement();
			Iterator<?> it = root.elementIterator();
			while (it.hasNext()) {
				Element row = (Element) it.next();
				BookInfo bookItem = new BookInfo();
				bookItem.setISBN(elementToInt(row, "ISBN-10", currID++));

				lstResult.add(bookItem);
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("", e);
		}

		return lstResult;
	}

	private int elementToInt(Element row, String column, int defaultValue) {
		if (row.element(column) == null || row.element(column).getText() == "")
			return defaultValue;
		return Integer.valueOf(row.element(column).getText());
	}

	private String elementToString(Element row, String column) {
		if (row.element(column) == null || row.element(column).getText() == "")
			return "";
		return row.element(column).getText();
	}

}
