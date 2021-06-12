package product;

public class ProductsBean {
	private Integer prodID;
	private String prodName;
	private Integer prodPrice;
	private String prodThumbnail;
	private String prodComment;
	private Integer prodAvailable;
	
	public Integer getProdID() {
		return prodID;
	}
	public void setProdID(Integer prodID) {
		this.prodID = prodID;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public Integer getProdPrice() {
		return prodPrice;
	}
	public void setProdPrice(Integer prodPrice) {
		this.prodPrice = prodPrice;
	}
	public String getProdThumbnail() {
		return prodThumbnail;
	}
	public void setProdThumbnail(String prodThumbnail) {
		this.prodThumbnail = prodThumbnail;
	}
	public String getProdComment() {
		return prodComment;
	}
	public void setProdComment(String prodComment) {
		this.prodComment = prodComment;
	}
	public Integer getProdAvailable() {
		return prodAvailable;
	}
	public void setProdAvailable(Integer prodAvailable) {
		this.prodAvailable = prodAvailable;
	}
}
