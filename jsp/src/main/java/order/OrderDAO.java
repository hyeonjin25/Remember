package order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import order.OrderBean;

public class OrderDAO {
	// 데이터베이스에 접근하게 해주는 하나의 객체
		private Connection conn;
		private PreparedStatement pstmt;
		// 어떠한 정보를 담을 수 있는 하나의 객체
		private ResultSet rs;

		public OrderDAO() {
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
		// 주문서 올리기 기능
		//
		public int add(String userID, String cartIDs, String address) {
			String sql = "INSERT INTO ORDERS VALUES (NULL,?,?,?)"; // orderID 값은 auto_increment이기 때문에 null
			try {	
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userID);
				pstmt.setString(2, cartIDs);
				pstmt.setString(3, address);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // db 오류
		}

		//
		// 전체 주문들 가져오기 기능
		//
		public ArrayList<OrderBean> getList() {
			String sql = "SELECT * FROM ORDERS ORDER BY orderID";
			ArrayList<OrderBean> list = new ArrayList<OrderBean>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) { //db에서 받아온 데이터들 객체에 담기
					OrderBean order = new OrderBean();
					order.setOrderID(rs.getInt(1));
					order.setUserID(rs.getString(2));
					order.setCartIDs(rs.getString(3));
					order.setAddress(rs.getString(4));
					list.add(order);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list; //리스트 리턴
		}
}
