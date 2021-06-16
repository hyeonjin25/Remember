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
<style>
#in li {
	margin: 2px
}
</style>
</head>
<body style="overflow: scroll;">
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
		<div id="name">정보수정</div>
		<div id="inbox">
			<form action="action/userModifyAction.jsp" method="post">
				<ul id="in">
					<li>이름 : <input type="text" name="userName" value="<%= user.getUserName() %>" maxlength="20"></li>
					<li>비밀번호 : <input type="password" name="userPW" id="userPW" maxlength="20"></li>
					<li>생년월일 : <input type="date" name="userBirth" id="userBirth" value="<%= user.getUserBirth() %>" min="1900-01-01" max="2021-01-01"></li>
					<div id="buttBox"><button class="butt" type="submit">정보수정</button></div>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>