/*
 * For handle books with database or XML.
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

/**
 * The Class BookDao.
 */
public class BookDao extends BaseDao {

	/** The List book info. */
	private List<BookInfo> lstBookInfo = new ArrayList<BookInfo>();

	/**
	 * Instantiates a new book dao.
	 */
	public BookDao() {
		super();
	}

	/**
	 * Gets the list of book info.
	 *
	 * @return the lstBookInfo
	 */
	public List<BookInfo> getLstBookInfo() {
		return lstBookInfo;
	}

	/**
	 * Gets the book by SubCategory.
	 *
	 * @param subcategoryID
	 *            the subcategory id
	 * @return the book by subcategory
	 */
	public List<BookInfo> getBookBySubcategory(int subcategoryID) {
		return getBookBySubcategory(subcategoryID, "");
	}

	/**
	 * Gets the book by subcategory.
	 *
	 * @param subcategoryID
	 *            the subcategory id
	 * @param sortItem
	 *            the sort item
	 * @return the book by subcategory
	 */
	public List<BookInfo> getBookBySubcategory(int subcategoryID,
			String sortItem) {
		List<BookInfo> lstResult = new ArrayList<BookInfo>();

		String sql = "select * from books where SubCategoryID = ?";
		if (sortItem != null && sortItem != "") {
			if (sortItem.equals("PriceASC"))
				sql += " order by Price ASC";
			else if (sortItem.equals("PriceDESC"))
				sql += " order by Price DESC";
			else if (sortItem.equals("Popular"))
				sql += " order by Rating DESC";
		}

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

	/**
	 * Gets the book by keyword.
	 *
	 * @param Keyword
	 *            the keyword
	 * @return the book by keyword
	 */
	public void getBookByKeyword(String strKeyword) {
		lstBookInfo.clear();
		String sql = "select * from books where Title like ? or Author like ?;";
		try {
			DBConnect dbConn = new DBConnect(pool);
			dbConn.prepareStatement(sql);
			dbConn.setString(1, "%" + strKeyword + "%");
			dbConn.setString(2, "%" + strKeyword + "%");
			ResultSet rset = dbConn.executeQuery();
			lstBookInfo = EntityHelper.getListFromRS(BookInfo.class, rset);

			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}
	}

	/**
	 * Gets the book by rate.
	 *
	 * @return the book by rate
	 */
	public void getBookByRate() {
		lstBookInfo.clear();

		String sql = "select * from books order by rating desc limit 0,6;";

		try {
			DBConnect dbConn = new DBConnect(pool);
			ResultSet rset = dbConn.executeQuery(sql);
			lstBookInfo = EntityHelper.getListFromRS(BookInfo.class, rset);
			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}
	}

	/**
	 * Gets the book by ISBN.
	 *
	 * @param ISBN
	 *            the ISBN
	 * @return the book by ISBN
	 */
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

	/**
	 * Save the book to database.
	 *
	 * @param bookinfo
	 *            instance the bookinfo
	 * @return true, if successful
	 */
	public boolean Add(BookInfo bi) {
		boolean result = false;

		// delete before insert
		DeleteByISBN(bi.getISBN());
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
			dbConn.setInt(11, bi.getRating());

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

	/**
	 * Delete book from database by isbn.
	 *
	 * @param isbn
	 *            the isbn
	 * @return true, if successful
	 */
	public boolean DeleteByISBN(int isbn) {
		boolean result = false;

		String sql = "delete from books where ISBN = ?;";
		try {
			DBConnect dbConn = new DBConnect(pool);
			dbConn.prepareStatement(sql);
			dbConn.setInt(1, isbn);
			result = dbConn.executeUpdate() == 1;
			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}

		return result;
	}

	/**
	 * Parses the from xml.
	 *
	 * @param xmlFileName
	 *            the xml file name
	 * @return the list
	 */
	public List<BookInfo> parseFromXML(String xmlFileName) {
		List<BookInfo> lstResult = new LinkedList<BookInfo>();

		try {
			CategoryDao cateDao = new CategoryDao(true);
			List<Subcategory> lstSubCate = cateDao.getLstSubCateoory();

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
					bookItem.setSubCategoryID(findSub.get().getSubCategoryID());

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
				bookItem.setRating(elementToInt(row, "Rating", 0));
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

	/**
	 * Element to int.
	 *
	 * @param row
	 *            the row
	 * @param column
	 *            the column
	 * @param defaultValue
	 *            the default value
	 * @return the int
	 */
	private int elementToInt(Element row, String column, int defaultValue) {
		if (row.element(column) == null || row.element(column).getText() == "")
			return defaultValue;
		return Integer.valueOf(row.element(column).getText());
	}

	/**
	 * Element to float.
	 *
	 * @param row
	 *            the row
	 * @param column
	 *            the column
	 * @param defaultValue
	 *            the default value
	 * @return the float
	 */
	private float elementToFloat(Element row, String column, float defaultValue) {
		if (row.element(column) == null || row.element(column).getText() == "")
			return defaultValue;
		return Float.valueOf(row.element(column).getText().trim()).floatValue();
	}

	/**
	 * Element to string.
	 *
	 * @param row
	 *            the row
	 * @param column
	 *            the column
	 * @return the string
	 */
	private String elementToString(Element row, String column) {
		if (row.element(column) == null || row.element(column).getText() == "")
			return "";
		return row.element(column).getText();
	}

}
