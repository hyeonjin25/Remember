package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	// 데이터베이스에 접근하게 해주는 하나의 객체
	private Connection conn;
	private PreparedStatement pstmt;
	// 어떠한 정보를 담을 수 있는 하나의 객체
	private ResultSet rs;

	public BbsDAO() {
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
	// 게시글 올리기 기능
	//
	public int write(String bbsTitle, String userID, String bbsContent) {
		String sql = "INSERT INTO BBS VALUES (NULL,?,?,?,1)"; // bbsID 값은 auto_increment이기 때문에 null
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, userID);
			pstmt.setString(3, bbsContent);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db 오류
	}

	//
	// 게시글 개수 가져오기
	//
	public int getListNum() {
		String sql = "SELECT COUNT(*) FROM BBS"; // 게시글의 개수
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
	// 게시글 가져오기 기능
	//
	public ArrayList<BbsBean> getList(int pageNum) {
		String sql = "SELECT * FROM BBS WHERE bbsID <= ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<BbsBean> list = new ArrayList<BbsBean>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getListNum() - (pageNum - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) { //db에서 받아온 데이터들 객체에 담기
				BbsBean bbs = new BbsBean();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsContent(rs.getString(4));
				bbs.setBbsAvailable(rs.getInt(5));
				list.add(bbs);
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
		String sql = "SELECT * FROM BBS WHERE bbsID <= ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
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
	// 글 상세내용 불러오기
	//
	public BbsBean getBbs(int bbsID) {
		String sql = "SELECT * FROM BBS WHERE bbsID = ?"; //해당하는 bbsID에 맞는 bbs전체 가져오기
		ArrayList<BbsBean> list = new ArrayList<BbsBean>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) { //db에서 받아온 데이터 객체에 담기
				BbsBean bbs = new BbsBean();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsContent(rs.getString(4));
				bbs.setBbsAvailable(rs.getInt(5));
				return bbs;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; //해당 글이 존재하지 않는 경우
	}
	
	//
	// 게시글 수정하기 기능
	//
	public int modify(int bbsID, String bbsTitle, String bbsContent) {
		String sql = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db 오류
	}
	
	//
	// 게시글 삭제하기 기능
	//
	public int delete(int bbsID) {
		String sql = "UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db 오류
	}

}
