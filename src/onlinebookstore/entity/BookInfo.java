/*
 *
 */
package onlinebookstore.entity;

import java.io.Serializable;

public class BookInfo implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = -1503132610991508497L;
	private int isbn;
	private int subCategoryID;
	private String title;
	private String author;
	private float price;
	private String rating;
	private int stockQuantity;
	private String description;

	public BookInfo() {
	}

	/**
	 * @param isbn
	 * @param subCategoryID
	 * @param title
	 * @param author
	 * @param price
	 * @param stockQuantity
	 */
	public BookInfo(int isbn, int subCategoryID, String title, String author,
			float price, int stockQuantity) {
		super();
		this.isbn = isbn;
		this.subCategoryID = subCategoryID;
		this.title = title;
		this.author = author;
		this.price = price;
		this.stockQuantity = stockQuantity;
	}

	public BookInfo(int isbn, int subCategoryID, String title, String author,
			float price, String rating, int stockQuantity, String description) {
		super();
		this.isbn = isbn;
		this.subCategoryID = subCategoryID;
		this.title = title;
		this.author = author;
		this.price = price;
		this.rating = rating;
		this.stockQuantity = stockQuantity;
		this.description = description;
	}

	/**
	 * @return the rating
	 */
	public String getRating() {
		return rating;
	}

	/**
	 * @param rating
	 *            the rating to set
	 */
	public void setRating(String rating) {
		this.rating = rating;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the isbn
	 */
	public int getIsbn() {
		return isbn;
	}

	/**
	 * @return the subCategoryID
	 */
	public int getSubCategoryID() {
		return subCategoryID;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}

	/**
	 * @return the price
	 */
	public float getPrice() {
		return price;
	}

	/**
	 * @return the stockQuantity
	 */
	public int getStockQuantity() {
		return stockQuantity;
	}
}
