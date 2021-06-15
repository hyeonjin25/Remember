<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remember</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/page.css">
<style>
	#in li {
		margin: 2px
	}
	#inbox {
		padding-top: 20px;
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
					<li><input type="text" name="userName" maxlength="20" placeholder="이름"></li>
					<li><input type="text" name="userID" maxlength="10" placeholder="아이디"></li>
					<li><input type="password" name="userPW" id="userPW" placeholder="비밀번호" maxlength="20"></li>
					<li><input type="password" name="pwcheck" id="pwcheck" placeholder="비밀번호 확인" maxlength="20"></li>
					<li><input type="date" name="userBirth" id="userBirth" placeholder="생년월일" min="1900-01-01" max="2021-01-01"></li>
					<div id="buttBox"><button class="butt" type="submit">회원가입</button></div>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>