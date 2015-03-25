/*
 *
 */
package onlinebookstore.entity;

public class UserInfo {
	private int userID;
	private String userName;
	private String password;
	private int userRole;
	private String address;
	private int status;

	public UserInfo() {
		status = -1;
	}

	/**
	 * @param userName
	 * @param password
	 * @param address
	 */
	public UserInfo(String userName, String password, String address) {
		super();
		status = 0;
		userID = -1;
		this.userName = userName;
		this.password = password;
		userRole = 1;
		this.address = address;
	}

	/**
	 * @param userID
	 * @param userName
	 * @param password
	 * @param address
	 */
	public UserInfo(int userID, String userName, String password, String address) {
		super();
		status = 1;
		this.userID = userID;
		this.userName = userName;
		this.password = password;
		this.address = address;
		userRole = 1;
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
	 * @return the status, -1 stands for invalid. 0 stands for new. 1 stands for
	 *         LoginOk
	 */
	public int getStatus() {
		return status;
	}
}
