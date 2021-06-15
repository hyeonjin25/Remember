<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserBean" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remember</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/page.css">
<style type="text/css">
	#inbox{padding: 30px 70px;}
	.butt{margin:0}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<%
		String userID = (String)session.getAttribute("userID");
	
		//로그인이 되어있지 않은 경우 돌려 보내기
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href='LoginPage.jsp'"); //사용자를 로그인페이지로 돌려보내기
			script.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		UserBean user = userDAO.getUser(userID);
	%>
	<div id="box">
		<div id="name">MyPage</div>
		<div id="inbox">
			<div>
				<b>내 정보</b>
				<p>아이디 : <%= user.getUserID() %></p>
				<p>이름 : <%= user.getUserName() %></p>
				<p>생년월일 : <%= user.getUserBirth() %></p>
				<button class="butt" onclick="location='InformModifyPage.jsp'" style="float:left">수정하기</button>
			</div><p>
			<!-- <div>주문내역</div><p>
			<div>내가 쓴 게시물</div> -->
		</div>
	</div>
</body>
</html>