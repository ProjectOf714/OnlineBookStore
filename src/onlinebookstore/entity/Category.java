/*
 *
 */
package onlinebookstore.entity;

import java.io.Serializable;

public class Category implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 2596202700457364883L;
	private int categoryID;
	private String categoryName;

	public Category() {
		super();
	}

	public Category(int categoryID, String categoryName) {
		super();
		this.categoryID = categoryID;
		this.categoryName = categoryName;
	}

	/**
	 * @return the categoryID
	 */
	public int getCategoryID() {
		return categoryID;
	}

	/**
	 * @return the categoryName
	 */
	public String getCategoryName() {
		return categoryName;
	}

	/**
	 * @param categoryID
	 *            the categoryID to set
	 */
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	/**
	 * @param categoryName
	 *            the categoryName to set
	 */
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "Category [CategoryID=" + categoryID + ", CategoryName="
				+ categoryName + "]";
	}

}
