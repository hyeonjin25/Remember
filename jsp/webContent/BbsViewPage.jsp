<%@page import="java.io.PrintWriter"%>
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
<style type="text/css">
	.view{
		width:500px;
		background-color: white;
		border: solid 1px black;
		font-size: 14px;
		padding: 10px;	
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<%
		String userID = (String)session.getAttribute("userID");
		
		int bbsID = 0;
		if(request.getParameter("bbsID")!=null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		
		// bbsID가 존재하지 않는 경우
		if(bbsID==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 게시글 입니다.')");
			script.println("location.href='Q&APage.jsp'"); //사용자를 Q&A페이지로 돌려보내기
			script.println("</script>");
		}
		BbsBean bbs = new BbsDAO().getBbs(bbsID);
	%>
	<div style="margin-top:40px">
		<div id="name">Q&A</div>
		<div id="inbox" style="width:80%; margin-top:30px;">
			<table border=1px style="width:100%; margin-top: 10px; border-collapse: collapse; text-align: center">
				<tr style="height:45px; background-color: #ffe3de;">
					<th style="width:15%;">제목</th>
					<th style="text-align: left; padding: 0 40px"><%= bbs.getBbsTitle() %></th>
				</tr>
				<tr style="height:45px; background-color: #ffe3de;">
					<th>글쓴이</th>
					<th style="text-align: left; padding: 0 40px"><%= bbs.getUserID() %></th>
				</tr>
				<tr style="height:400px; background-color: white;">
					<td>내용</td>
					<td style="text-align: left; padding: 0 40px">
					<%= bbs.getBbsContent() %>
					</td>
				</tr>
			</table>
			<%
				if(userID != null && userID.equals(bbs.getUserID())){
			%>
			<!-- 삭제 전 확인 기능 -->
			<script type="text/javascript">
				function deleteConfirm(){
					if(confirm("정말로 삭제하시겠습니까?")){
						location.href="action/bbsDeleteAction.jsp?bbsID=<%= bbs.getBbsID() %>";
					}
				}
			</script>
			<div id="buttBox">
				<button class="butt" onclick="location='BbsModifyPage.jsp?bbsID=<%= bbs.getBbsID() %>'">수정하기</button>
				<button class="butt" onclick="deleteConfirm()">삭제하기</button>
			</div>
			<% } %>
		</div>
	</div>
</body>
</html>