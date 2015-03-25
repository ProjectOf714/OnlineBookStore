/*
 *
 */
package onlinebookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import onlinebookstore.entity.Category;

public class CategoryDao extends BaseDao {

	public CategoryDao() {
		super();
	}

	private List<Category> lstCategory = new ArrayList<Category>();

	public void RetrieveFromDB() {
		String sql = "SELECT * FROM category;";
		try {
			ResultSet rset = dbConn.executeQuery(sql);
			while (rset.next()) {
				Category cat = new Category(rset.getInt(1), rset.getString(2));
				lstCategory.add(cat);
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
}
