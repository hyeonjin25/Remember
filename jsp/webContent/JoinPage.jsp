<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/login.css">
<style>
#in li {
	margin: 2px
}
</style>
</head>
<body style="overflow: scroll;">
	<jsp:include page="header.jsp" flush="false" />
	<div id="box">
		<div id="name">Register</div>
		<div id="inbox">
			<form action="action/joinAction.jsp" method="post">
				<ul id="in">
					<li>이름</li> <li><input type="text" name="userName" maxlength="20"></li>
					<li>아이디</li> <li><input type="text" name="userID" maxlength="10"></li>
					<li>비밀번호</li> <li><input type="password" name="userPW" id="userPW" maxlength="20"></li>
					<li>비밀번호 확인</li> <li><input type="password" name="pwcheck" id="pwcheck" maxlength="20"></li>
					<li>생년월일</li> <li><input type="date" name="userBirth" id="userBirth" min="1900-01-01" max="2021-01-01"></li>
					<li><button class="butt" type="submit">회원가입</button></li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>