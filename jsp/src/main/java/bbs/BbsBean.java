package bbs;

public class BbsBean {
	private Integer bbsID;
	private String bbsTitle;
	private String userID;
	private String bbsContent;
	private Integer bbsAvailable;
	
	public Integer getBbsID() {
		return bbsID;
	}
	public void setBbsID(Integer bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public Integer getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(Integer bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}	
}
