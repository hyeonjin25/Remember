package cart;

public class CartBean {
	private Integer cartID;
	private String userID;
	private Integer prodID;
	private Integer prodNumber;
	private Integer cartAvailable;
	
	public Integer getCartID() {
		return cartID;
	}
	public void setCartID(Integer cartID) {
		this.cartID = cartID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public Integer getProdID() {
		return prodID;
	}
	public void setProdID(Integer prodID) {
		this.prodID = prodID;
	}
	public Integer getProdNumber() {
		return prodNumber;
	}
	public void setProdNumber(Integer prodNumber) {
		this.prodNumber = prodNumber;
	}
	public Integer getCartAvailable() {
		return cartAvailable;
	}
	public void setCartAvailable(Integer cartAvailable) {
		this.cartAvailable = cartAvailable;
	}
}
