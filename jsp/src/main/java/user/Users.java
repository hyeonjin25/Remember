package user;

public class Users {
	private String userID;
	private String userName;
	private String userPW;
	private String birth;
	private Boolean admin;
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
	public void setuserPW(String pw) {
		this.userPW = pw;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public Boolean getAdmin() {
		return admin;
	}
	public void setAdmin(Boolean admin) {
		this.admin = admin;
	}
	
}
