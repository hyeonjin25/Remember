<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/login.css">

</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="box">
		<div id="name">Login</div>
		<div id="inbox">
			<form action="action/loginAction.jsp" method="post">
				<ul id="in">
					<li>아이디 <input type="text" name="userID" maxlength="20"></li>
					<li>비밀번호 <input type="password" name="userPW" maxlength="20"></li>
					<li style="font-size: 13px; display: flex; align-items: center;">
						<input type="checkbox" name="admin" style="width: 16px; margin: 0 2px 0 0">관리자 로그인
						<button class="butt" type="submit">로그인</button>
					</li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>