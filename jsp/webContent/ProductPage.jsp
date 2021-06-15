<%@page import="java.util.ArrayList"%>
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
	table {width:100%; margin-top: 10px; border-collapse: collapse; text-align: center;}
	td {width:33%;}
	img {width: 100%;}
	.product {padding: 10px;}
	.prodname {margin: 5px 0;}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<%
		request.setCharacterEncoding("utf-8");
		String kate = "All";
		if(request.getParameter("Kate")!=null){
			kate = (String)request.getParameter("Kate");
		}
	
		int pageNum = 1; // 기본 첫 페이지
		if(request.getParameter("pageNum")!=null){
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
	%>
	<div style="margin-top:40px">
		<div id="name"><%= kate %></div>
		<div id="inbox" style="width:80%; margin-top:30px;">
			<table >
				<%
					ProductsDAO prodDAO = new ProductsDAO();
					ArrayList<ProductsBean>list = prodDAO.getList(pageNum, kate);
					
					//상품을 한 열당 3개씩 출력
					for(int i=0; i<list.size(); i+=3){
				%>
					<tr style="height:250px;">
						<td>
							<div class="product">
								<a href="ProductDetailPage.jsp?prodID=<%= list.get(i).getProdID() %>"><img alt="상품이미지" src="<%= list.get(i).getProdThumbnail() %>">
								<br>
								<div class="prodname">
									<a href="ProductDetailPage.jsp?prodID=<%= list.get(i).getProdID() %>"><%= list.get(i).getProdName() %></a>
								</div>
								<%= list.get(i).getProdPrice() %>
							</div>
						</td>
						<%if(i+1<list.size()) {%> <!-- 상품 개수를 넘었을 경우 그만 -->
						<td>
							<div class="product">
								<a href="ProductDetailPage.jsp?prodID=<%= list.get(i+1).getProdID() %>"><img alt="상품이미지" src="<%= list.get(i+1).getProdThumbnail() %>"></a>
								<br>
								<div class="prodname">
									<a href="ProductDetailPage.jsp?prodID=<%= list.get(i+1).getProdID() %>"><%= list.get(i+1).getProdName() %></a>
								</div>
								<%= list.get(i+1).getProdPrice() %>
							</div>
						</td>
						<%} if(i+2<list.size()) {%> <!-- 상품 개수를 넘었을 경우 그만 -->
						<td>
							<div class="product">
								<a href="ProductDetailPage.jsp?prodID=<%= list.get(i+2).getProdID() %>"><img alt="상품이미지" src="<%= list.get(i+2).getProdThumbnail() %>"></a>
								<br>
								<div class="prodname">
									<a href="ProductDetailPage.jsp?prodID=<%= list.get(i+2).getProdID() %>"><%= list.get(i+2).getProdName() %></a>
								</div>
								<%= list.get(i+2).getProdPrice() %>
							</div>
						</td>
						<% } %>
					</tr>
					<% } %>
			</table>
			<div id="buttBox" style="width:80vw">
				<!-- 이전 페이지가 있을 경우 -->
				<% if(pageNum != 1){ %>
					<button class="butt" style="background-color: #ffe3de; float:left" onclick="location='Q&APage.jsp?pageNum=<%=pageNum - 1%>'">이전</button>
				<%} 
				//다음 페이지가 있을 경우
				if(prodDAO.isNextPage(pageNum+1)){ %>
					<button class="butt" style="background-color: #ffe3de;" onclick="location='Q&APage.jsp?pageNum=<%=pageNum +1 %>'">다음</button>
				<% } %>
			</div>
		</div>
	</div>
</body>
</html>