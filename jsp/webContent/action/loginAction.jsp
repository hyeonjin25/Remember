<%@page import="user.userDAO"%>
<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<jsp:useBean id="user" class="user.Users" scope="page" />

<!-- 넘어온 값 저장 -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receive login</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	userDAO userDAO = new userDAO();
	//userDAO를 사용하여 로그인 시도 후 결과값 저장
	int result = userDAO.login(user.getUserID(), user.getUserPW());

	//로그인에 성공했을 경우
	if(result==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='../index.jsp'");
		script.println("</script>");
		
	}
	//비밀번호가 일치하지 않을 경우
	else if(result==0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다.')");
		script.println("history.back()"); //사용자를 이전(로그인)페이지로 돌려보내기
		script.println("</script>");
	}
	//아이디가 없을 경우
		else if(result==-1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디 입니다.')");
			script.println("history.back()"); //사용자를 이전(로그인)페이지로 돌려보내기
			script.println("</script>");
		}
	//데이터베이스 오류
		else if(result==-2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");
			script.println("history.back()"); //사용자를 이전(로그인)페이지로 돌려보내기
			script.println("</script>");
		}
	
	
	/* String id = request.getParameter("userID");
	String pw = request.getParameter("userPW");
	//관리자 값이 null이 아닌경우에 admin임
	String admin = request.getParameter("admin"); */
	%>
	<%-- 	<%= id %><br>
	<%= pw %><br>
	<%= admin %> --%>
</body>
</html>