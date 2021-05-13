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
	<div style="background-image: url('image/header_1.jpg'); background-size: 100% 200px; overflow: hidden; background-repeat: no-repeat; background-position: 0 -65px; padding: 15px; height: 100px; border-bottom: #ff00c852 5px solid;">
		<h1 style="text-align: center; margin: 0; padding-top: 10px;">
			<a href="main.jsp">Remember</a>
		</h1>
		<div style="text-align: right; margin-right: 20px; border: none;">
			<script>
				document.write('<a href="login.jsp" class="login">로그인</a><a href="register.jsp" class="login">회원가입</a>')
			</script>
		</div>
		<nav>
			<ul>
				<li><a href="#">New</a></li>
				<li><a href="#">Best</a></li>
				<li><a href="#">All</a></li>
				<li><a href="#">Q&A</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>