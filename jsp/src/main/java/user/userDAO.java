package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
	// 데이터베이스에 접근하게 해주는 하나의 객체
	private Connection conn;
	private PreparedStatement pstmt;
	// 어떠한 정보를 담을 수 있는 하나의 객체
	private ResultSet rs;

	public userDAO() {
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
	// 로그인 기능 함수
	//
	public int login(String userID, String userPW, int userAdmin) {
		String sql = "SELECT userPW FROM USERS WHERE userID = ? AND userAdmin = ?";
		try {
			pstmt = conn.prepareStatement(sql); // db에 정해진 문장을 삽입
			pstmt.setString(1, userID); // 문장의 물음표에 값 넣기
			pstmt.setInt(2, userAdmin);
			rs = pstmt.executeQuery(); // 결과를 담을 수 있는 객체에 실행결과 넣어주기

			// 결과가 존재 할 경우 (회원 아이디를 넣었을 떄 비밀번호가 있는 경우)
			if (rs.next()) {
				// 결과로 받은 pw가 사용자가 입력한 pw와 같다면
				if (rs.getString(1).equals(userPW)) {
					return 1; // 로그인 성공
				} else {
					return 0; // 비밀번호 불일치
				}
			}
			// 결과가 존재하지 않을 경우 (회원 아이디를 넣었을 때 비밀번호가 없는 경우)
			else {
				return -1; // 아이디가 없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}

	//
	// 회원가입 기능 함수
	//
	public int join(UserBean users) {
		String sql = "INSERT INTO USERS VALUES (?,?,?,?,0)"; // userAdmin은 항상 false (관리자는 회원가입 불가능)
		try {
			pstmt = conn.prepareStatement(sql); // db에 정해진 문장을 삽입
			// 문장의 물음표에 값 넣기
			pstmt.setString(1, users.getUserID());
			pstmt.setString(2, users.getUserName());
			pstmt.setString(3, users.getUserPW());
			pstmt.setString(4, users.getUserBirth());
			return pstmt.executeUpdate(); // 해당 statement를 실행한 결과 넣어주기
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // db오류 (INSERT문이 실행될 경우 반드시 0이상의 숫자가 반환됨)

	}
}
