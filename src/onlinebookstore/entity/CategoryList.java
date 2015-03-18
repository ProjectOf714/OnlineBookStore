/*
 *
 */
package onlinebookstore.entity;

import java.util.ArrayList;
import java.util.List;

public class CategoryList {
	private List<Category> lstCategory = new ArrayList<Category>();

	public void addCategory(Category categoryIns) {
		this.lstCategory.add(categoryIns);
	}

	public List<Category> getLstCategory() {
		return this.lstCategory;
	}
}
