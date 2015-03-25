/*
 *
 */
package onlinebookstore.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import onlinebookstore.entity.UserInfo;
import onlinebookstore.util.Encrypt;

public class UserDao extends BaseDao {

	public UserDao() {
		super();
	}

	public Boolean CheckUserName(String strUserName) {
		boolean checkRslt = false;
		String sql = "select count(1) from userinfo where Username = ?;";
		try {
			dbConn.prepareStatement(sql);
			dbConn.setString(1, strUserName);
			checkRslt = ((Integer) dbConn.executeScalar()).intValue() == 1;
			dbConn.close();
		} catch (SQLException e) {
			log.error("", e);
		} catch (Exception e) {
			log.error(e.toString());
		}

		return checkRslt;

	}

	public UserInfo Login(String strUserName, String strUserPwd) {
		UserInfo user = new UserInfo();
		if (CheckUserName(strUserName)) {
			String sql = "select * from userinfo where Username = ? and Password=?;";
			try {
				dbConn.prepareStatement(sql);
				dbConn.setString(1, strUserName);
				dbConn.setString(2, Encrypt.EncryptByMD5(strUserPwd));
				ResultSet rset = dbConn.executeQuery();
				if (rset.next()) {
					user = new UserInfo(rset.getInt("UserID"),
							rset.getString("Username"),
							rset.getString("Password"),
							rset.getString("Address"));
				}

				dbConn.close();
			} catch (SQLException e) {
				log.error("", e);
			} catch (Exception e) {
				log.error(e.toString());
			}
		}

		return user;
	}

	public Boolean Register(UserInfo puser) {
		boolean checkRslt = false;
		if (!CheckUserName(puser.getUserName())) {
			String sql = "INSERT INTO `userinfo`(`Username`,`Password`,`UserRole`,`Address`)VALUES(?,?,1,?);";
			try {
				dbConn.prepareStatement(sql);
				dbConn.setString(1, puser.getUserName());
				dbConn.setString(2, Encrypt.EncryptByMD5(puser.getPassword()));
				dbConn.setString(3, puser.getAddress());
				checkRslt = ((Integer) dbConn.executeScalar()).intValue() == 1;
				dbConn.close();
			} catch (SQLException e) {
				log.error("", e);
			} catch (Exception e) {
				log.error(e.toString());
			}
		}
		return checkRslt;
	}
}
