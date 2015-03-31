/*
 *
 */
package onlinebookstore.entity;

import java.io.Serializable;

public class Subcategory implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 532268149928212152L;
	private int subCategoryID;
	private int categoryID;
	private String subCategoryName;

	/**
	 * @param subCategoryID
	 * @param categoryID
	 * @param subCategoryName
	 */
	public Subcategory(int subCategoryID, int categoryID, String subCategoryName) {
		super();
		this.subCategoryID = subCategoryID;
		this.categoryID = categoryID;
		this.subCategoryName = subCategoryName;
	}

	/**
	 * @return the subCategoryID
	 */
	public int getSubCategoryID() {
		return subCategoryID;
	}

	/**
	 * @return the categoryID
	 */
	public int getCategoryID() {
		return categoryID;
	}

	/**
	 * @return the subCategoryName
	 */
	public String getSubCategoryName() {
		return subCategoryName;
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Subcategory [subCategoryID=" + subCategoryID + ", categoryID="
				+ categoryID + ", subCategoryName=" + subCategoryName + "]";
	}
}
