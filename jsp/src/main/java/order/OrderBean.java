package order;

public class OrderBean {
	private Integer orderID;
	private String userID;
	private String cartIDs;
	private String address;
	
	public Integer getOrderID() {
		return orderID;
	}
	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getCartIDs() {
		return cartIDs;
	}
	public void setCartIDs(String cartIDs) {
		this.cartIDs = cartIDs;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
