<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsBean" %>
<%@ page import="bbs.BbsDAO" %>
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
		int pageNum = 1; // 기본 첫 페이지
		if(request.getParameter("pageNum")!=null){
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
	%>
	<div style="margin-top:40px">
		<div id="name">Q&A</div>
		<div id="inbox" style="width:80%; margin-top:30px;">
			<table border=1px style="width:100%; margin-top: 10px; border-collapse: collapse; text-align: center">
				<tr style="height:50px; background-color: #ffe3de;">
					<th style="width:15%;">NO</th>
					<th>Title</th>
					<th style="width:20%;">Writer</th>
				</tr>
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<BbsBean>list = bbsDAO.getList(pageNum);
					for(int i=0; i<list.size(); i++){
				%>
				<tr style="height:45px;">
					<td><%= list.get(i).getBbsID() %></td>
					<td style="text-align: left; padding: 0 40px">
					<a href="BbsViewPage.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %>
					</td>
					<td><%= list.get(i).getUserID() %></td>
				</tr>
				<% } %>
			</table>
			<div id="buttBox" style="width:80vw">
				<button class="butt" onclick="location='BbsWritePage.jsp'">글쓰기</button>
				<!-- 이전 페이지가 있을 경우 -->
				<% if(pageNum != 1){ %>
					<button class="butt" style="background-color: #ffe3de; float:left" onclick="location='Q&APage.jsp?pageNum=<%=pageNum - 1%>'">이전</button>
				<%} 
				//다음 페이지가 있을 경우
				if(bbsDAO.isNextPage(pageNum+1)){ %>
					<button class="butt" style="background-color: #ffe3de;" onclick="location='Q&APage.jsp?pageNum=<%=pageNum +1 %>'">다음</button>
				<% } %>
			</div>
		</div>
	</div>
</body>
</html>