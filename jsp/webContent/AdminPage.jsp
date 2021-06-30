<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="order.OrderBean" %>
<%@ page import="order.OrderDAO" %>
<%@ page import="cart.CartBean" %>
<%@ page import="cart.CartDAO" %>
<%@ page import="product.ProductsBean" %>
<%@ page import="product.ProductsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/reset.css">
<title>remember</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/page.css">
<style type="text/css">
	#title {margin: 5px auto;}
	img { width:100% }
	#del_btn { border: none; background-color: white; cursor: pointer;}
	#del_btn:hover { text-decoration: underline; }
	.butt { margin-left:0 }
	#price { padding:10px 20px }
	#price div { float:right; }
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="box">
		<div id="name"><b>관리자 페이지</b></div>
		<div id="inbox" style="width:80%; margin-top:30px;">
			<div id="title">고객 주문 내역</div>
			<table border=1px style="width:100%; margin-top: 10px; border-collapse: collapse; text-align: center">
				<tr style="height:50px; background-color: #ffe3de;">
					<th style="width: 7%;">NO</th>
					<th style="width: 15%;">userID</th>
					<th style="width: 20%;">address</th>
					<th style="width: 10%, padding: 0 40px">상품이미지</th>
					<th style="width: 25%">상품명</th>
					<th style="width: 10%">수량</th>
				</tr>
				<%
					String userID = (String)session.getAttribute("userID");
					int userAdmin = (int)session.getAttribute("userAdmin");
					System.out.print(userAdmin);
				
					//로그인이 되어있지 않은 경우 돌려 보내기
					if (userID == null) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('로그인이 필요합니다.')");
						script.println("location.href='LoginPage.jsp'"); //사용자를 로그인페이지로 돌려보내기
						script.println("</script>");
					}
					//관리자가 아닌 경우 돌려 보내기
					if (userAdmin == 0) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('권한이 없습니다.");
						script.println("location.href='index.jsp'"); //사용자를 메인페이지로 돌려보내기
						script.println("</script>");
					}
				
					OrderDAO orderDAO = new OrderDAO();
					ArrayList<OrderBean>orderlist = orderDAO.getList();
					
					int totalPrice = 0; //총 상품금액들 담을 변수
					if(orderlist.size()==0){
					%>
						<tr style="height:100px;">
							<td colspan="6">주문 상품이 존재하지 않습니다.</td>		
						</tr>
					<%
					}
					else
					//각 주문서당 정보들 보여주기
					{for(int i=0; i<orderlist.size(); i++){
						//각 주문서 당 카트들 id 배열로 만들기
						String[] cartID = orderlist.get(i).getCartIDs().split(",");
							
					%>
						<%
						//각 카트별 정보들 보여주기
						for(int j=0; j<cartID.length; j++){
							CartDAO cartDAO = new CartDAO();
							//cartID에 해당하는 카트내용들 가져오기
							CartBean cartlist = cartDAO.getCart(Integer.parseInt(cartID[j]));
							System.out.println(cartlist.getCartID());
						
							ProductsDAO prodDAO = new ProductsDAO();
							//cart의 상품 정보들 가져오기
							ProductsBean prodlist = prodDAO.getProd(cartlist.getProdID());
						%>
						<tr style="height:45px;">
							<% if(j == 0){ %>
								<td rowspan="<%= cartID.length %>"><%= i+1 %></td>
								<td rowspan="<%= cartID.length %>"><%= orderlist.get(i).getUserID() %></td>
								<td rowspan="<%= cartID.length %>"><%= orderlist.get(i).getAddress() %></td>
							<% } %>	
							<td style="padding: 0 40px">
								<img alt="상품이미지" src="<%= prodlist.getProdThumbnail() %>">
							</td>
							<td><%= prodlist.getProdName() %></td>
							<td><%= cartlist.getProdNumber() %> 개</td>
						</tr>
					<% }}} %>
			</table>
		</div>
	</div>
</body>
</html>