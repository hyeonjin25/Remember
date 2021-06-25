<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	//로그인이 되어있지 않은 경우 돌려 보내기
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href='../LoginPage.jsp'"); //사용자를 로그인페이지로 돌려보내기
		script.println("</script>");
	}
	
	int cartID = 0;
	if(request.getParameter("cartID")!=null){
		cartID = Integer.parseInt(request.getParameter("cartID"));
		System.out.print(cartID);
	}
	
	// cartID가 존재하지 않는 경우
	if(cartID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('수행할 수 없는 기능입니다.')");
		script.println("location.href='../index.jsp'"); //사용자를 메인페이지로 돌려보내기
		script.println("</script>");
	}
	
	CartBean cart = new CartDAO().getCart(cartID);
	
	// 상품을 삭제하려는 유저가 본인이 맞는지 확인
	if(!userID.equals(cart.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제 권한이 없습니다.')");
		script.println("location.href='../CartPage.jsp'"); //사용자를 장바구니 페이지로 돌려보내기
		script.println("</script>");
	}
	//삭제 권한이 있는 경우
	else{
		CartDAO cartDAO = new CartDAO();
		//cartDAO 사용하여 delete 시도 후 결과값 저장
		int result = cartDAO.delete(userID, cartID);

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
			script.println("alert('상품이 삭제 되었습니다.')");
			script.println("location.href='../CartPage.jsp'"); //상품 삭제 성공
			script.println("</script>");
		}
	}	
	%>
</body>
</html>