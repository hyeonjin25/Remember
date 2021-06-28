<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="order.OrderBean" %>
<%@ page import="order.OrderDAO" %>
<%@ page import="cart.CartBean" %>
<%@ page import="cart.CartDAO" %>
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
	String address = (String)request.getParameter("address");
	
	//로그인이 되어있지 않은 경우 돌려 보내기
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href='../LoginPage.jsp'"); //사용자를 로그인페이지로 돌려보내기
		script.println("</script>");
	}

	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('결제가 완료되었습니다.')");
	script.println("</script>");
	
	OrderDAO orderDAO = new OrderDAO();
	CartDAO cartDAO = new CartDAO();
	ArrayList<CartBean>cartlist = cartDAO.getList(userID);
	
	//cartID 배열을 db에 저장하기 위해 하나의 string으로 만들기
	String cartIDs = "";
	for(int i=0; i<cartlist.size(); i++){
		cartIDs += cartlist.get(i).getCartID();
		if(i!=cartlist.size()-1) cartIDs += ",";
	}
	
	//orderDAO 사용하여 add 시도 후 결과값 저장
	int result = orderDAO.add(userID, cartIDs, address);
	
	//cartDAO 사용하여 장바구니 모두 지움
	int result2 = cartDAO.deleteAll(userID);

	//데이터베이스 오류가 발생했을 경우
	if (result == -1 || result2 == -1) {
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.')");
		script.println("history.back()"); //사용자를 이전페이지로 돌려보내기
		script.println("</script>");
	} else {
		script.println("<script>");
		script.println("location.href='../CartPage.jsp'"); //장바구니로 이동
		script.println("</script>");
	}
	
	%>
</body>
</html>