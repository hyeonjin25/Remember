<%@page import="user.userDAO"%>
<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="user" class="user.UserBean" scope="page" />

<!-- 넘어온 값 저장 -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<jsp:setProperty name="user" property="userAdmin" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remember</title>
</head>
<body>
	<%
	//이미 로그인되어있는 상태일경우 돌려보내기
	if (session.getAttribute("userID") != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 되어있는 상태입니다.')");
		script.println("location.href='../index.jsp'"); //사용자를 메인페이지로 돌려보내기
		script.println("</script>");
	}

	//아이디를 입력하지 않았을 경우
	if (user.getUserID() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디가 입력되지 않았습니다.')");
		script.println("history.back()"); //사용자를 이전(로그인)페이지로 돌려보내기
		script.println("</script>");
	}
	//비밀번호를 입력하지 않았을 경우
	else if (user.getUserPW() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 입력되지 않았습니다.')");
		script.println("history.back()"); //사용자를 이전(로그인)페이지로 돌려보내기
		script.println("</script>");
	}

	userDAO userDAO = new userDAO();

	//체크박스 선택 안된 경우 null값 대신 0 넣기
	if (user.getUserAdmin() == null)
		user.setUserAdmin(0);

	System.out.println(user.getUserAdmin());
	System.out.println(user.getUserID());
	System.out.print(user.getUserPW());

	//userDAO를 사용하여 로그인 시도 후 결과값 저장
	int result = userDAO.login(user.getUserID(), user.getUserPW(), user.getUserAdmin());

	//로그인에 성공했을 경우
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='../index.jsp'");
		script.println("</script>");

		//세션에 로그인 정보 저장
		session.setAttribute("userID", user.getUserID());
		session.setAttribute("userAdmin", user.getUserAdmin());
	}
	//비밀번호가 일치하지 않을 경우
	else if (result == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다.')");
		script.println("history.back()"); //사용자를 이전(로그인)페이지로 돌려보내기
		script.println("</script>");
	}
	//아이디가 없을 경우
	else if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.')");
		script.println("history.back()"); //사용자를 이전(로그인)페이지로 돌려보내기
		script.println("</script>");
	}
	//데이터베이스 오류
	else if (result == -2) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.')");
		script.println("history.back()"); //사용자를 이전(로그인)페이지로 돌려보내기
		script.println("</script>");
	}
	%>
</body>
</html>