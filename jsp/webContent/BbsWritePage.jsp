<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	%>
	<div id="box">
		<div id="name">Write</div>
		<div id="inbox">
			<form action="action/writeAction.jsp" method="post">
				<ul id="in" style="width:550px">
					<li>제목</li>
					<li><input type="text" name="bbsTitle" maxlength="50" style="width:500px"></li>
					<li>내용</li>
					<li><textarea type="text" name="bbsContent" maxlength="2048" style="width:500px"></textarea></li>
					<li style="font-size: 13px; display: flex; align-items: center;"></li>
					<div id="buttBox">
						<button class="butt" type="submit">올리기</button>
					</div>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>