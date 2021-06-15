<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="user.UserDAO"%>
<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remember</title>
</head>
<body>
	<%
	String userID = (String)session.getAttribute("userID");
	String userName = (String)request.getParameter("userName");
	String userPW = (String)request.getParameter("userPW");
	String userBirth = (String)request.getParameter("userBirth");
	
	//로그인이 되어있지 않은 경우 돌려 보내기
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href='../LoginPage.jsp'"); //사용자를 로그인페이지로 돌려보내기
		script.println("</script>");
	}
	
	//사용자가 필수 항목을 입력하지 않았을 경우
	if (userName == null || userPW == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()"); //사용자를 이전(회원가입)페이지로 돌려보내기
		script.println("</script>");
	}

	user.UserDAO userDAO = new user.UserDAO();
	//userDAO를 사용하여 유저정보수정 시도 후 결과값 저장
	int result = userDAO.modifyUser(userID, userName, userPW, userBirth);
	
	//비밀번호가 틀릴 경우
	if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다.')");
		script.println("history.back()"); //사용자를 이전(정보수정)페이지로 돌려보내기
		script.println("</script>");
	}
	//아이디가 없을 경우
	else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('해당하는 사용자가 없습니다.')");
		script.println("history.back()"); //사용자를 이전(정보수정)페이지로 돌려보내기
		script.println("</script>");
	}
	//데이터베이스 오류
	else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.')");
		script.println("history.back()"); //사용자를 이전(정보수정)페이지로 돌려보내기
		script.println("</script>");
	}
	else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정보수정을 완료했습니다.')");
		script.println("location.href='../MyPage.jsp'"); //정보수정 성공
		script.println("</script>");
	}
	%>
</body>
</html>