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
	private int iSBN;
	private int subCategoryID;
	private String title, author, language;
	private float price;
	private String paperback, publisher, productDimensions;
	private String shippingWeight;
	private int rating, stockQuantity;
	private String description_P1, description_P2, description_P3;
	private String description_P4, description_P5;
	private String productImage, image1Large, image1Thumb;
	private String image2Large, image2Thumb;

	public BookInfo() {
		iSBN = 0;
		subCategoryID = 0;
		title = "";
		author = "";
		language = "";
		paperback = "";
		publisher = "";
		productDimensions = "";
		shippingWeight = "";
		rating = 0;
		description_P1 = "";
		description_P2 = "";
		description_P3 = "";
		description_P4 = "";
		description_P5 = "";
		productImage = "";
		image1Large = "";
		image1Thumb = "";
		image2Large = "";
		image2Thumb = "";
		stockQuantity = 0;
	}

	/**
	 * @return the iSBN
	 */
	public int getISBN() {
		return iSBN;
	}

	/**
	 * @param iSBN
	 *            the iSBN to set
	 */
	public void setISBN(int iSBN) {
		this.iSBN = iSBN;
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
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title
	 *            the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}

	/**
	 * @param author
	 *            the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
	}

	/**
	 * @return the language
	 */
	public String getLanguage() {
		return language;
	}

	/**
	 * @param language
	 *            the language to set
	 */
	public void setLanguage(String language) {
		this.language = language;
	}

	/**
	 * @return the price
	 */
	public float getPrice() {
		return price;
	}

	/**
	 * @param price
	 *            the price to set
	 */
	public void setPrice(float price) {
		this.price = price;
	}

	/**
	 * @return the paperback
	 */
	public String getPaperback() {
		return paperback;
	}

	/**
	 * @param paperback
	 *            the paperback to set
	 */
	public void setPaperback(String paperback) {
		this.paperback = paperback;
	}

	/**
	 * @return the publisher
	 */
	public String getPublisher() {
		return publisher;
	}

	/**
	 * @param publisher
	 *            the publisher to set
	 */
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	/**
	 * @return the productDimensions
	 */
	public String getProductDimensions() {
		return productDimensions;
	}

	/**
	 * @param productDimensions
	 *            the productDimensions to set
	 */
	public void setProductDimensions(String productDimensions) {
		this.productDimensions = productDimensions;
	}

	/**
	 * @return the shippingWeight
	 */
	public String getShippingWeight() {
		return shippingWeight;
	}

	/**
	 * @param shippingWeight
	 *            the shippingWeight to set
	 */
	public void setShippingWeight(String shippingWeight) {
		this.shippingWeight = shippingWeight;
	}

	/**
	 * @return the rating
	 */
	public int getRating() {
		return rating;
	}

	/**
	 * @param rating
	 *            the rating to set
	 */
	public void setRating(int rating) {
		this.rating = rating;
	}

	/**
	 * @return the stockQuantity
	 */
	public int getStockQuantity() {
		return stockQuantity;
	}

	/**
	 * @param stockQuantity
	 *            the stockQuantity to set
	 */
	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

	/**
	 * @return the description_P1
	 */
	public String getDescription_P1() {
		return description_P1;
	}

	/**
	 * @param description_P1
	 *            the description_P1 to set
	 */
	public void setDescription_P1(String description_P1) {
		this.description_P1 = description_P1;
	}

	/**
	 * @return the description_P2
	 */
	public String getDescription_P2() {
		return description_P2;
	}

	/**
	 * @param description_P2
	 *            the description_P2 to set
	 */
	public void setDescription_P2(String description_P2) {
		this.description_P2 = description_P2;
	}

	/**
	 * @return the description_P3
	 */
	public String getDescription_P3() {
		return description_P3;
	}

	/**
	 * @param description_P3
	 *            the description_P3 to set
	 */
	public void setDescription_P3(String description_P3) {
		this.description_P3 = description_P3;
	}

	/**
	 * @return the description_P4
	 */
	public String getDescription_P4() {
		return description_P4;
	}

	/**
	 * @param description_P4
	 *            the description_P4 to set
	 */
	public void setDescription_P4(String description_P4) {
		this.description_P4 = description_P4;
	}

	/**
	 * @return the description_P5
	 */
	public String getDescription_P5() {
		return description_P5;
	}

	/**
	 * @param description_P5
	 *            the description_P5 to set
	 */
	public void setDescription_P5(String description_P5) {
		this.description_P5 = description_P5;
	}

	/**
	 * @return the productImage
	 */
	public String getProductImage() {
		return productImage;
	}

	/**
	 * @param productImage
	 *            the productImage to set
	 */
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	/**
	 * @return the image1Large
	 */
	public String getImage1Large() {
		return image1Large;
	}

	/**
	 * @param image1Large
	 *            the image1Large to set
	 */
	public void setImage1Large(String image1Large) {
		this.image1Large = image1Large;
	}

	/**
	 * @return the image1Thumb
	 */
	public String getImage1Thumb() {
		return image1Thumb;
	}

	/**
	 * @param image1Thumb
	 *            the image1Thumb to set
	 */
	public void setImage1Thumb(String image1Thumb) {
		this.image1Thumb = image1Thumb;
	}

	/**
	 * @return the image2Large
	 */
	public String getImage2Large() {
		return image2Large;
	}

	/**
	 * @param image2Large
	 *            the image2Large to set
	 */
	public void setImage2Large(String image2Large) {
		this.image2Large = image2Large;
	}

	/**
	 * @return the image2Thumb
	 */
	public String getImage2Thumb() {
		return image2Thumb;
	}

	/**
	 * @param image2Thumb
	 *            the image2Thumb to set
	 */
	public void setImage2Thumb(String image2Thumb) {
		this.image2Thumb = image2Thumb;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "BookInfo [iSBN=" + iSBN + ", subCategoryID=" + subCategoryID
				+ ", title=" + title + ", author=" + author + ", language="
				+ language + ", price=" + price + ", paperback=" + paperback
				+ ", publisher=" + publisher + ", productDimensions="
				+ productDimensions + ", shippingWeight=" + shippingWeight
				+ ", rating=" + rating + ", stockQuantity=" + stockQuantity
				+ ", description_P1=" + description_P1 + ", description_P2="
				+ description_P2 + ", description_P3=" + description_P3
				+ ", description_P4=" + description_P4 + ", description_P5="
				+ description_P5 + ", productImage=" + productImage
				+ ", image1Large=" + image1Large + ", image1Thumb="
				+ image1Thumb + ", image2Large=" + image2Large
				+ ", image2Thumb=" + image2Thumb + "]";
	}

}
