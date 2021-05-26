<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/header.css">
</head>
<body>
	<div style="background-image: url('image/header_2.jpg'); background-size: 100% 200px; overflow: hidden; background-repeat: no-repeat; background-position: 0 -65px; padding: 15px; height: 100px; border-bottom: #eb8f8fe7 5px solid;">
		<h1 style="text-align: center; margin: 0; padding-top: 10px;">
			<a href="MainPage.jsp">Remember</a>
		</h1>
		<div style="text-align: right; margin-right: 20px; border: none;">
		<%
			String userID = (String)session.getAttribute("userID");
			Integer userAdmin = (Integer)session.getAttribute("userAdmin"); 
			
			/* 사용자가 로그인 했을 경우 */
			if(userID!=null && userAdmin==0) {
				out.print("<a href='CartPage.jsp' class='login'>장바구니</a><a href='MyPage.jsp' class='login'>마이페이지</a>");
			}
			/* 관리자가 로그인 했을 경우 */
			else if(userID!=null && userAdmin==1) {
				out.print("<a href='AdminPage.jsp' class='login'>관리자페이지</a><a href='action/logout.act' class='login'>로그아웃</a>");
			}
			/* 로그인 하지 않았을 경우 */
			else{
				out.print("<a href='LoginPage.jsp' class='login'>로그인</a><a href='JoinPage.jsp' class='login'>회원가입</a>");
			}
		%>
		</div>
		<nav>
			<ul style="margin-bottom: 0">
				<li><a href="ProductPage.jsp?sort=new">New</a></li>
				<li><a href="ProductPage.jsp?sort=best">Best</a></li>
				<li><a href="ProductPage.jsp?sort=all">All</a></li>
				<li><a href="#">Q&A</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>