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

	public Subcategory() {
		super();
	}

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
	 * @param subCategoryID
	 *            the subCategoryID to set
	 */
	public void setSubCategoryID(int subCategoryID) {
		this.subCategoryID = subCategoryID;
	}

	/**
	 * @return the categoryID
	 */
	public int getCategoryID() {
		return categoryID;
	}

	/**
	 * @param categoryID
	 *            the categoryID to set
	 */
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	/**
	 * @return the subCategoryName
	 */
	public String getSubCategoryName() {
		return subCategoryName;
	}

	/**
	 * @param subCategoryName
	 *            the subCategoryName to set
	 */
	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
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
