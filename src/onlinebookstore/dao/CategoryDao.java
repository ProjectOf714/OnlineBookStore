/*
 *
 */
package onlinebookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Dictionary;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import onlinebookstore.entity.Category;
import onlinebookstore.entity.Subcategory;
import onlinebookstore.util.DBConnect;
import onlinebookstore.util.EntityHelper;

import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class CategoryDao extends BaseDao {
	private List<Category> lstCategory = new ArrayList<Category>();
	private Dictionary<Category, List<Subcategory>> dicCateoory = new Hashtable<Category, List<Subcategory>>();

	public CategoryDao() {
		super();
	}

	public CategoryDao(Boolean initFromDB) {
		super();
		if (initFromDB) {
			RetrieveFromDB();
		}
	}

	public void RetrieveFromDB() {
		String sql = "SELECT * FROM category;";
		try {
			DBConnect dbConn = new DBConnect(pool);
			ResultSet rset = dbConn.executeQuery(sql);
			lstCategory = EntityHelper.getListFromRS(Category.class, rset);
			Iterator<Category> iterator = lstCategory.iterator();
			while (iterator.hasNext()) {
				Category catItem = iterator.next();
				dicCateoory.put(catItem,
						getSubCategory(catItem.getCategoryID()));
			}

			dbConn.close();
		} catch (SQLException ex) {
			log.error(ex.toString());
		} catch (Exception e) {
			log.error(e.toString());
		}
	}

	public void addCategory(Category categoryIns) {
		lstCategory.add(categoryIns);
	}

	public List<Category> getLstCategory() {
		return lstCategory;
	}

	public List<Subcategory> getSubCategory(int categoryID) {
		List<Subcategory> lstSubCat = new ArrayList<Subcategory>();

		String sql = "select * from subcategory where categoryID = ?;";
		try {
			DBConnect dbConn = new DBConnect(pool);
			dbConn.prepareStatement(sql);
			dbConn.setInt(1, categoryID);
			ResultSet rset = dbConn.executeQuery();
			lstSubCat = EntityHelper.getListFromRS(Subcategory.class, rset);
			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}

		return lstSubCat;
	}

	public List<Subcategory> getSubCategory() {
		List<Subcategory> lstSubCat = new ArrayList<Subcategory>();

		String sql = "select * from subcategory;";
		try {
			DBConnect dbConn = new DBConnect(pool);
			ResultSet rset = dbConn.executeQuery(sql);
			lstSubCat = EntityHelper.getListFromRS(Subcategory.class, rset);
			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}

		return lstSubCat;
	}

	public Dictionary<Category, List<Subcategory>> getDicCateoory() {
		return dicCateoory;
	}

	public List<Category> readFromXML(String xmlFileName) {
		List<Category> lstCat = new LinkedList<Category>();
		try {
			int currID = 1;
			org.dom4j.io.SAXReader reader = new SAXReader();
			org.dom4j.Document document = reader.read(xmlFileName);
			org.dom4j.Element root = document.getRootElement();
			Iterator<?> it = root.elementIterator();
			while (it.hasNext()) {
				Element row = (Element) it.next();
				int id = elementToInt(row, "id", currID++);
				String name = elementToString(row, "name");
				Category cat = new Category(id, name);

				lstCat.add(cat);
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("", e);
		}

		return lstCat;
	}

	public Dictionary<Category, List<Subcategory>> parseFromXML(
			String xmlFileName) {
		Dictionary<Category, List<Subcategory>> dicResult = new Hashtable<Category, List<Subcategory>>();

		try {
			int currID = 1;
			org.dom4j.io.SAXReader reader = new SAXReader();
			org.dom4j.Document document = reader.read(xmlFileName);
			org.dom4j.Element root = document.getRootElement();
			Iterator<?> it = root.elementIterator();
			while (it.hasNext()) {
				Element row = (Element) it.next();
				int cateID = elementToInt(row, "id", currID++);
				String name = elementToString(row, "name");
				Category catItem = new Category(cateID, name);
				List<Subcategory> lstSubCat = new LinkedList<Subcategory>();
				int subCateID = 1;

				Iterator<?> itChild = row.element("subcategorys")
						.elementIterator();
				while (itChild.hasNext()) {
					Element rowChild = (Element) itChild.next();
					int subCatID = elementToInt(rowChild, "id", subCateID++);

					String subCatName = elementToString(rowChild, "name");
					lstSubCat
							.add(new Subcategory(subCatID, cateID, subCatName));
				}

				dicResult.put(catItem, lstSubCat);
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("", e);
		}

		return dicResult;
	}

	private int elementToInt(Element row, String column, int defaultValue) {
		if (row.element(column) == null || row.element(column).getText() == "")
			return defaultValue;
		return Integer.valueOf(row.element(column).getText());
	}

	private String elementToString(Element row, String column) {
		return row.element(column).getText();
	}

}
