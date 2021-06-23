<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cart.CartBean" %>
<%@ page import="cart.CartDAO" %>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="cart" class="cart.CartBean" scope="page" />

<!-- 넘어온 값 저장 -->
<jsp:setProperty name="cart" property="prodID" />
<jsp:setProperty name="cart" property="prodNumber" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remember</title>
</head>
<body>
	<%
	String userID = (String)session.getAttribute("userID");
	
	//로그인이 되어있지 않은 경우 돌려 보내기
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href='../LoginPage.jsp'"); //사용자를 로그인페이지로 돌려보내기
		script.println("</script>");
	}
	
	// prodID가 존재하지 않는 경우
	if(cart.getProdID() == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('수행할 수 없는 기능입니다.')");
		script.println("location.href='../index.jsp'"); //사용자를 메인페이지로 돌려보내기
		script.println("</script>");
	}
	
	CartDAO cartDAO = new CartDAO();
	//cartDAO 사용하여 add 시도 후 결과값 저장
	int result = cartDAO.add(userID, cart.getProdID(), cart.getProdNumber());

	//데이터베이스 오류가 발생했을 경우
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.')");
		script.println("history.back()"); //사용자를 이전페이지로 돌려보내기
		script.println("</script>");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("if(confirm('장바구니로 이동하시겠습니까?'))");
		script.println("{location.href='../CartPage.jsp'}"); //장바구니 이동
		script.println("else{history.back()}"); //원래 페이지로 돌아가기
		script.println("</script>");
	}
	%>
</body>
</html>