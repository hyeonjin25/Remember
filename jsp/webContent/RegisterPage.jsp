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
<script type="text/javascript">
	function checking(e) {
		var pw = document.getElementById("pw").value;
		var pwcheck = document.getElementById("pwcheck").value;
		if (pw != pwcheck) {
			와
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			e.preventDefault();
		}
	}
	// 생년월일 입력 기본날짜 오늘로 바꾸기
	document.getElementById("birth").value = new Date().toISOString()
			.substring(0, 10);
	document.getElementById("birth").max = new Date().toISOString().substring(
			0, 10);
</script>
</head>
<body style="overflow: scroll;">
	<jsp:include page="header.jsp" flush="false" />
	<div id="box">
		<div id="name">Register</div>
		<div id="inbox">
			<form action="action/register_act.jsp" method="post">
				<ul id="in">
					<li>이름 <input type="text" name="name" maxlength="20"></li>
					<li>아이디 <input type="text" name="id" maxlength="10"></li>
					<li>비밀번호 <input type="password" name="pw" id="pw" maxlength="20"></li>
					<li>비밀번호 확인 <input type="password" name="pwcheck" id="pwcheck" maxlength="20"></li>
					<li>생년월일 <input type="date" name="birth" id="birth" min="1900-01-01" max="2021-01-01"></li>
					<li><button class="butt" type="submit" onclick="checking()">회원가입</button></li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>