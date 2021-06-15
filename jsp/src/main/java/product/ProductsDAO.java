package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductsDAO {
	// 데이터베이스에 접근하게 해주는 하나의 객체
	private Connection conn;
	private PreparedStatement pstmt;
	// 어떠한 정보를 담을 수 있는 하나의 객체
	private ResultSet rs;

	public ProductsDAO() {
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
	// 상품 올리기 기능
	//
	public int write(String prodName, int prodPrice, String prodThumbnail, String prodComment) {
		String sql = "INSERT INTO PRODUCTS VALUES (NULL,?,?,?,?,1)"; // pordID 값은 auto_increment이기 때문에 null
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prodName);
			pstmt.setInt(2, prodPrice);
			pstmt.setString(3, prodThumbnail);
			pstmt.setString(4, prodComment);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db 오류
	}

	//
	// 상품 개수 가져오기
	//
	public int getListNum() {
		String sql = "SELECT COUNT(*) FROM PRODUCTS"; // 상품 개수
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db 오류
	}

	//
	// 상품들 가져오기 기능
	//
	public ArrayList<ProductsBean> getList(int pageNum, String kate) {
		String sql = "";
		if(kate.equals("All")) sql = "SELECT * FROM PRODUCTS WHERE prodID <= ? AND prodAvailable = 1 ORDER BY prodID DESC LIMIT 10";
		else sql = "SELECT * FROM PRODUCTS WHERE prodID <= ? AND prodKategorie = ? AND prodAvailable = 1 ORDER BY prodID DESC LIMIT 10";
		ArrayList<ProductsBean> list = new ArrayList<ProductsBean>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getListNum() - (pageNum - 1) * 10);
			//카테고리가 all일 경우에는 카테고리 조건 없음 
			if(!kate.equals("All")) pstmt.setString(2, kate);
			rs = pstmt.executeQuery();
			while (rs.next()) { //db에서 받아온 데이터들 객체에 담기
				ProductsBean prod = new ProductsBean();
				prod.setProdID(rs.getInt(1));
				prod.setProdName(rs.getString(2));
				prod.setProdPrice(rs.getInt(3));
				prod.setProdThumbnail(rs.getString(4));
				prod.setProdComment(rs.getString(5));
				prod.setProdKategorie(rs.getString(6));
				prod.setProdAvailable(rs.getInt(7));
				list.add(prod);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; //리스트 리턴
	}
	
	//
	// 다음 페이지가 있는지 여부 리턴
	//
	public boolean isNextPage(int NextpageNum) {
		String sql = "SELECT * FROM PRODUCTS WHERE prodID <= ? AND prodAvailable = 1 ORDER BY prodID DESC LIMIT 10";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getListNum() - (NextpageNum - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) { //db에서 받아온 데이터들 객체에 담기
				return true; //다음페이지에 들어갈 결과가 있다면 true
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; //다음페이지에 들어갈 결과가 없다면 false
	}
	
	//
	// 상품 상세내용 불러오기
	//
	public ProductsBean getProd(int prodID) {
		String sql = "SELECT * FROM PRODUCTS WHERE prodID = ?"; //해당하는 prodID에 맞는 상품내용 전체 가져오기
		ArrayList<ProductsBean> list = new ArrayList<ProductsBean>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prodID);
			rs = pstmt.executeQuery();
			if (rs.next()) { //db에서 받아온 데이터 객체에 담기
				ProductsBean prod = new ProductsBean();
				prod.setProdID(rs.getInt(1));
				prod.setProdName(rs.getString(2));
				prod.setProdPrice(rs.getInt(3));
				prod.setProdThumbnail(rs.getString(4));
				prod.setProdComment(rs.getString(5));
				prod.setProdKategorie(rs.getString(6));
				prod.setProdAvailable(rs.getInt(7));
				return prod;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; //해당 글이 존재하지 않는 경우
	}
	
	//
	// 상품 수정하기 기능
	//
	public int modify(int prodID, String prodName, int prodPrice, String prodComment) {
		String sql = "UPDATE PRODUCTS SET prodName = ?, prodPrice = ?, prodComment = ? WHERE prodID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prodName);
			pstmt.setInt(2, prodPrice);
			pstmt.setString(3, prodComment);
			pstmt.setInt(4, prodID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db 오류
	}
	
	//
	// 상품 삭제하기 기능
	//
	public int delete(int prodID) {
		String sql = "UPDATE PRODUCTS SET prodAvailable = 0 WHERE prodID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prodID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db 오류
	}

}
