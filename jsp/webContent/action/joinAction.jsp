<%@page import="user.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="user" class="user.UserBean" scope="page" />

<!-- 넘어온 값 저장 -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userPW" />
<jsp:setProperty name="user" property="userBirth" />

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

		String pwcheck = request.getParameter("pwcheck");

		//사용자가 필수 항목을 입력하지 않았을 경우
		if (user.getUserID() == null || user.getUserName() == null || user.getUserPW() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()"); //사용자를 이전(회원가입)페이지로 돌려보내기
			script.println("</script>");
		}
		//비밀번호와 비밀번호 확인이 다른 경우
		else if (!user.getUserPW().equals(pwcheck)) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호 확인이 일치하지 않습니다.')");
			script.println("history.back()"); //사용자를 이전(회원가입)페이지로 돌려보내기
			script.println("</script>");
		}
		else{
			user.UserDAO userDAO = new user.UserDAO();
			//userDAO를 사용하여 회원가입 시도 후 결과값 저장
			int result = userDAO.join(user); //userBean 넣어주기
	
			//아이디가 없을 경우
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('중복되는 아이디 입니다.')");
				script.println("history.back()"); //사용자를 이전(회원가입)페이지로 돌려보내기
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입을 축하드립니다.')");
				script.println("location.href='../LoginPage.jsp'"); //회원가입 성공
				script.println("</script>");
			}
		}
	%>
</body>
</html>