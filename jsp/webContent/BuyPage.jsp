<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="order.OrderBean" %>
<%@ page import="order.OrderDAO" %>
<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remember</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/page.css">
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
			
			OrderDAO orderDAO = new OrderDAO();
	%>
	<div id="box">
		<div id="name">주문</div>
		<div id="inbox">
			<form action="action/BuyAction.jsp" method="post">
				<div style="display: flex; flex-direction: column; justify-content: center; align-items: center">
					<input type="text" placeholder="주소" name="address" style="width:80%; height: 80px; margin: 20px";/>
					<button class="butt" type="submit">결제하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>