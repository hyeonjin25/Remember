package user;

public class Users {
	
	private String userID;
	private String userName;
	private String userPW;
	private String userBirth;
	private Integer userAdmin;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String id) {
		this.userID = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String name) {
		this.userName = name;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String pw) {
		this.userPW = pw;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String birth) {
		this.userBirth = birth;
	}
	public Integer getUserAdmin() {
		return userAdmin;
	}
	public void setUserAdmin(Integer admin) {
		this.userAdmin = admin;
	}
	
}
