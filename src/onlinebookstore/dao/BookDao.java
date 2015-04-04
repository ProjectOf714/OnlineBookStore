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

	public boolean Add(BookInfo bi) {
		boolean result = false;

		String sql = "INSERT INTO books"
				+ " (ISBN,SubCategoryID,Title,Author,Language,"
				+ " Price,Paperback,Publisher,ProductDimensions,"
				+ " ShippingWeight,Rating,StockQuantity,"
				+ " Description_P1,Description_P2,Description_P3,Description_P4,Description_P5,"
				+ " ProductImage,Image1Large,Image1Thumb,Image2Large,Image2Thumb)"
				+ " VALUES" + " (?,?,?,?,?," + " ?,?,?,?," + " ?,?,10,"
				+ " ?,?,?,?,?," + " ?,?,?,?,?);";
		try {
			DBConnect dbConn = new DBConnect(pool);
			dbConn.prepareStatement(sql);
			dbConn.setInt(1, bi.getISBN());
			dbConn.setInt(2, bi.getSubCategoryID());
			dbConn.setString(3, bi.getTitle());
			dbConn.setString(4, bi.getAuthor());
			dbConn.setString(5, bi.getLanguage());

			dbConn.setFloat(6, bi.getPrice());
			dbConn.setString(7, bi.getPaperback());
			dbConn.setString(8, bi.getPublisher());
			dbConn.setString(9, bi.getProductDimensions());

			dbConn.setString(10, bi.getShippingWeight());
			dbConn.setString(11, bi.getRating());

			dbConn.setString(12, bi.getDescription_P1());
			dbConn.setString(13, bi.getDescription_P2());
			dbConn.setString(14, bi.getDescription_P3());
			dbConn.setString(15, bi.getDescription_P4());
			dbConn.setString(16, bi.getDescription_P5());

			dbConn.setString(17, bi.getProductImage());
			dbConn.setString(18, bi.getImage1Large());
			dbConn.setString(19, bi.getImage1Thumb());
			dbConn.setString(20, bi.getImage2Large());
			dbConn.setString(21, bi.getImage2Thumb());

			result = dbConn.executeUpdate() == 1;
			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}

		return result;
	}

	public List<BookInfo> parseFromXML(String xmlFileName) {
		List<BookInfo> lstResult = new LinkedList<BookInfo>();

		try {
			CategoryDao cateDao = new CategoryDao(false);
			List<Subcategory> lstSubCate = cateDao.getSubCategory();

			int currID = 1;
			org.dom4j.io.SAXReader reader = new SAXReader();
			org.dom4j.Document document = reader.read(xmlFileName);
			org.dom4j.Element root = document.getRootElement();
			Iterator<?> it = root.elementIterator();
			while (it.hasNext()) {
				Element row = (Element) it.next();
				BookInfo bookItem = new BookInfo();
				bookItem.setISBN(elementToInt(row, "ISBN-10", currID++));
				String cat = elementToString(row, "Category");
				Optional<Subcategory> findSub = lstSubCate.stream()
						.filter(ss -> ss.getSubCategoryName().equals(cat))
						.findFirst();
				if (findSub.isPresent())
					bookItem.setSubCategoryID(findSub.get().getCategoryID());

				bookItem.setTitle(elementToString(row, "Title"));
				bookItem.setAuthor(elementToString(row, "Author"));
				bookItem.setLanguage(elementToString(row, "Language"));
				bookItem.setPrice(elementToFloat(row, "Price", 0));
				bookItem.setPaperback(elementToString(row, "Paperback"));
				bookItem.setPublisher(elementToString(row, "Publisher"));
				bookItem.setProductDimensions(elementToString(row,
						"ProductDimensions"));
				bookItem.setShippingWeight(elementToString(row,
						"ShippingWeight"));
				bookItem.setRating(elementToString(row, "Rating"));
				bookItem.setDescription_P1(elementToString(row,
						"Description_P1"));
				bookItem.setDescription_P2(elementToString(row,
						"Description_P2"));
				bookItem.setDescription_P3(elementToString(row,
						"Description_P3"));
				bookItem.setDescription_P4(elementToString(row,
						"Description_P4"));
				bookItem.setDescription_P5(elementToString(row,
						"Description_P5"));
				bookItem.setProductImage(elementToString(row, "ProductImage"));
				bookItem.setImage1Large(elementToString(row, "Image1Large"));
				bookItem.setImage1Thumb(elementToString(row, "Image1Thumb"));
				bookItem.setImage2Large(elementToString(row, "Image2Large"));
				bookItem.setImage2Thumb(elementToString(row, "Image2Thumb"));
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

	private float elementToFloat(Element row, String column, float defaultValue) {
		if (row.element(column) == null || row.element(column).getText() == "")
			return defaultValue;
		return Float.valueOf(row.element(column).getText().trim()).floatValue();
	}

	private String elementToString(Element row, String column) {
		if (row.element(column) == null || row.element(column).getText() == "")
			return "";
		return row.element(column).getText();
	}

}
