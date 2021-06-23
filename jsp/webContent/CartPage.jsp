<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cart.CartBean" %>
<%@ page import="cart.CartDAO" %>
<%@ page import="product.ProductsBean" %>
<%@ page import="product.ProductsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remember</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/page.css">
<style type="text/css">
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
	<div style="margin-top:40px">
		<div id="name">Cart</div>
		<div id="inbox" style="width:80%; margin-top:30px;">
			<table border=1px style="width:100%; margin-top: 10px; border-collapse: collapse; text-align: center">
				<tr style="height:50px; background-color: #ffe3de;">
					<th style="width: 7%;">NO</th>
					<th style="width: 30%, padding: 0 40px">상품이미지</th>
					<th style="width: 25%">상품명</th>
					<th style="width: 15%">수량</th>
					<th style="width: 15%">금액</th>
					<th style="width: 7%">삭제</th>
				</tr>
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
				
					CartDAO cartDAO = new CartDAO();
					ArrayList<CartBean>cartlist = cartDAO.getList(userID);
					int totalPrice = 0; //총 상품금액들 담을 변수
					if(cartlist.size()==0){
				%>
					<tr style="height:100px;">
						<td colspan="6">장바구니에 상품이 존재하지 않습니다.</td>		
					</tr>
				<%
					}
					else{
						for(int i=0; i<cartlist.size(); i++){
							ProductsDAO prodDAO = new ProductsDAO();
							ProductsBean prodlist = prodDAO.getProd(cartlist.get(i).getProdID());
				%>
						<tr style="height:45px;">
							<td><%= i+1 %></td>
							<td style="padding: 0 40px">
							<a href="ProductDetailPage.jsp?prodID=<%= prodlist.getProdID() %>"><img alt="상품이미지" src="<%= prodlist.getProdThumbnail() %>"></a>
							</td>
							<td><a href="ProductDetailPage.jsp?prodID=<%= prodlist.getProdID() %>"><%= prodlist.getProdName() %></a></td>
							<td><%= cartlist.get(i).getProdNumber() %> 개</td>
							<% 
								//상품 가격과 개수 곱한 총 가격 계산
								int cartPrice = prodlist.getProdPrice() * cartlist.get(i).getProdNumber();
								//총 상품금액들 누적해서 더하기
								totalPrice += cartPrice;
							%>
							<td><%= cartPrice %> 원</td>
							<script type="text/javascript">
								function deleteConfirm(param,e){
									if(confirm("정말로 삭제하시겠습니까?")){
										location.href="action/cartDeleteAction.jsp?cartID="+param.value;
									}
								}
								function deleteAllConfirm(e){
									if(confirm("장바구니의 모든 상품이 삭제됩니다. 정말로 삭제하시겠습니까?")){
										location.href="action/cartDeleteAllAction.jsp";
									}
								}
							</script>
							<td><button id="del_btn" onclick="deleteConfirm(this)" value=<%= cartlist.get(i).getCartID() %>>x</button></td>
						</tr>
					<% }} %>
			</table>
			<div id="price">
				<div>총 상품 금액 : <%= totalPrice %>원</div><br>
				<% 
					int shipping = 0;
					//장바구니에 물건이 들어있을 때만 배송비 붙기
					if(totalPrice != 0) shipping = 2500; 
				%>
				<div>배송비 : <%= shipping%>원</div><br>
				<div style="margin-top: 10px"><b>결제 금액 : <%= shipping + totalPrice%>원</b></div>
			</div>
			<div id="buttBox" style="width:80vw;">
				<button class="butt" onclick="deleteAllConfirm()">전체삭제</button>
				<button class="butt" style="background-color: #ffe3de;" onclick="location.href='BuyPage.jsp'">구매하기</button>
			</div>
		</div>
	</div>
</body>
</html>