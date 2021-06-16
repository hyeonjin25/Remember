<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	.view{
		width:500px;
		background-color: white;
		border: solid 1px black;
		font-size: 14px;
		padding: 10px;
	}
	table input {width:70px;}
	.butt { float: none;}
	#buttBox { float: none;}
	.butt:last-child { background-color: #ffe3de;}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<%
		String userID = (String)session.getAttribute("userID");
	
		int prodID = 0;
		if(request.getParameter("prodID")!=null){
			prodID = Integer.parseInt(request.getParameter("prodID"));
		}
		
		// bbsID가 존재하지 않는 경우
		if(prodID==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 상품 입니다.')");
			script.println("location.href='index.jsp'"); //사용자를 메인페이지로 돌려보내기
			script.println("</script>");
		}
		ProductsBean prod = new ProductsDAO().getProd(prodID);
	%>
	<div style="margin-top:40px">
		<div id="inbox" style="width:70%; margin-top:30px;">
			<table border=1px style="width:100%; margin-top: 10px; border-collapse: collapse; text-align: center">
				<tr>
					<td rowspan="5" style="width:60%;"><img alt="상품이미지" src="<%= prod.getProdThumbnail() %>" width="100%"></td>
					<td style="height: 50px; text-align: left; padding: 0 40px"><b><%= prod.getProdName() %></b></td>
				</tr>
				<tr style="min-height:250px; background-color: white;">
					<td style="text-align: left; padding: 0 40px"><%= prod.getProdComment() %></td>
				</tr>
				<tr style="height:5%;">
					<td style="text-align: right; padding: 0 40px">
						<script type="text/javascript">
							/*상품 수량 변경에 따라 가격 변경하는 함수 */
							function numChange(param){
								var price = document.getElementById("price");
								price.innerHTML = <%= prod.getProdPrice() %> * param.value;
							}
						</script>
						수량 : <input id="prodnum" type="number" value=1 onChange="numChange(this)">
					</td>
				</tr>
				<tr style="height:5%;">
					<td style="text-align: right; padding: 0 40px">
						총 상품금액 :  <b id="price"><%= prod.getProdPrice() %></b>  원
					</td>
				</tr>
				<tr style="height:15%;">
					<td style="text-align: center; padding: 0 40px">
						<div id="buttBox">
							<script type="text/javascript">
								function cartConfirm(){
									var prodnum = document.getElementById("prodnum").value;
									location.href="action/cartAddAction.jsp?prodID=<%= prod.getProdID() %>&prodNumber="+prodnum;
								}
							</script>
							<button class="butt" onclick="cartConfirm()">장바구니</button>
							<button class="butt" onclick="location='BuyPage.jsp?prodID=<%= prod.getProdID() %>'">바로구매</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>