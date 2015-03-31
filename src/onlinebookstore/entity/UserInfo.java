/*
 *
 */
package onlinebookstore.entity;

import java.io.Serializable;

public class UserInfo implements Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = -3016286917871450522L;
	private int userID;
	private String userName;
	private String password;
	private int userRole;
	private String address;
	private String email;
	private int status;
	private int newsLetter;

	public UserInfo() {
		status = -1;
		userID = -1;
		userRole = 1;
	}

	public UserInfo(String strUserName, String strPassword, String strAddress,
			String strEmail, int iNewsletter) {
		super();
		status = 0;
		userID = -1;
		userRole = 1;
		userName = strUserName;
		password = strPassword;
		address = strAddress;
		email = strEmail;
		newsLetter = iNewsletter;

	}

	public UserInfo(int iUserID, String strUserName, String strPassword,
			String strAddress, String strEmail, int iUserRole, int iNewsletter) {
		super();
		status = 1;
		userRole = iUserRole;
		userID = iUserID;
		userName = strUserName;
		password = strPassword;
		address = strAddress;
		email = strEmail;
		newsLetter = iNewsletter;
	}

	/**
	 * @return the userID
	 */
	public int getUserID() {
		return userID;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @return the password, encrypt use MD5
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @return the userRole
	 */
	public int getUserRole() {
		return userRole;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @return the newsletter
	 */
	public int getNewsletter() {
		return newsLetter;
	}

	/**
	 * @return the status, -1 stands for invalid. 0 stands for new. 1 stands for
	 *         LoginOk
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param userName
	 *            the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @param newsLetter
	 *            the newsLetter to set
	 */
	public void setNewsLetter(int newsLetter) {
		this.newsLetter = newsLetter;
	}
}
