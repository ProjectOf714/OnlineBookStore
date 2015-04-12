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
	private String username;
	private String password;
	private int userRole;
	private String address;
	private String email;
	private int status;
	private int newsletter;

	public UserInfo() {
		status = -1;
		userID = -1;
		userRole = 1;
	}

	/**
	 * @return the status, -1 stands for invalid. 0 stands for new. 1 stands for
	 *         LoginOk
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            : -1 stands for invalid. 0 stands for new. 1 stands for
	 *            LoginOk
	 */
	public void setStatus(int status) {
		this.status = status;
	}

	/**
	 * @return the userID
	 */
	public int getUserID() {
		return userID;
	}

	/**
	 * @param userID
	 *            the userID to set
	 */
	public void setUserID(int userID) {
		this.userID = userID;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the userRole:0 for admin.
	 */
	public int getUserRole() {
		return userRole;
	}

	/**
	 * @param userRole
	 *            the userRole to set
	 */
	public void setUserRole(int userRole) {
		this.userRole = userRole;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the newsletter
	 */
	public int getNewsletter() {
		return newsletter;
	}

	/**
	 * @param newsletter
	 *            the newsletter to set
	 */
	public void setNewsletter(int newsletter) {
		this.newsletter = newsletter;
	}

}
