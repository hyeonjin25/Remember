package cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import cart.CartBean;

public class CartDAO {
	// 데이터베이스에 접근하게 해주는 하나의 객체
		private Connection conn;
		private PreparedStatement pstmt;
		// 어떠한 정보를 담을 수 있는 하나의 객체
		private ResultSet rs;

		public CartDAO() {
			// 실제로 mysql에 접속할 수 있게 해주는 부분
			try {
				String dbURL = "jdbc:mysql://localhost:3306/remember";
				String dbID = "root";
				String dbPW = "jindb";
				Class.forName("com.mysql.jdbc.Driver"); // mysql driver를 찾을 수 있도록 함
				conn = DriverManager.getConnection(dbURL, dbID, dbPW); // conn에 접속된 정보가 담김
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		//
		// 장바구니 올리기 기능
		//
		public int add(String userID, int prodID, int prodNumber) {
			String sql = "INSERT INTO CARTS VALUES (NULL,?,?,?,1)"; // cartID 값은 auto_increment이기 때문에 null
			try {	
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userID);
				pstmt.setInt(2, prodID);
				pstmt.setInt(3, prodNumber);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // db 오류
		}

		//
		// 해당하는 user의 전체 장바구니 가져오기 기능
		//
		public ArrayList<CartBean> getList(String userID) {
			String sql = "SELECT * FROM CARTS WHERE userID = ? AND cartAvailable = 1 ORDER BY cartID";
			ArrayList<CartBean> list = new ArrayList<CartBean>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userID);
				rs = pstmt.executeQuery();
				while (rs.next()) { //db에서 받아온 데이터들 객체에 담기
					CartBean cart = new CartBean();
					cart.setCartID(rs.getInt(1));
					cart.setUserID(rs.getString(2));
					cart.setProdID(rs.getInt(3));
					cart.setProdNumber(rs.getInt(4));
					cart.setCartAvailable(rs.getInt(5));
					list.add(cart);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list; //리스트 리턴
		}
		
		//
		// 해당 cart 내용 불러오기
		//
		public CartBean getCart(int cartID) {
			String sql = "SELECT * FROM CARTS WHERE cartID = ?"; //해당하는 cartID에 맞는 cart내용 전체 가져오기
			ArrayList<CartBean> list = new ArrayList<CartBean>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cartID);
				rs = pstmt.executeQuery();
				if (rs.next()) { //db에서 받아온 데이터 객체에 담기
					CartBean cart = new CartBean();
					cart.setCartID(rs.getInt(1));
					cart.setUserID(rs.getString(2));
					cart.setProdID(rs.getInt(3));
					cart.setProdNumber(rs.getInt(4));
					cart.setCartAvailable(rs.getInt(5));
					return cart;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null; //해당 cart가 존재하지 않는 경우
		}
		
		//
		// 장바구니에서 특정 상품 삭제하기 기능
		//
		public int delete(String userID, int cartID) {
			String sql = "UPDATE CARTS SET cartAvailable = 0 WHERE userID = ? AND cartID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userID);
				pstmt.setInt(2, cartID);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // db 오류
		}
		
		//
		// 장바구니에서 전체 상품 삭제하기 기능
		//
		public int deleteAll(String userID) {
			String sql = "UPDATE CARTS SET cartAvailable = 0 WHERE userID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userID);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // db 오류
		}
}
