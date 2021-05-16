<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="css/reset.css">
<style>
#box {
	background-color: #ffe3de;
	width: 70%;
	min-width: 430px;
	margin: 40px auto;
	padding-top: 20px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

#name {
	text-align: center;
	font-size: 23px;
	font-weight: bold;
	margin-top: 10px;
}

#inbox {
	min-width: 430px;
	margin: 40px auto;
	margin-top: 10px;
}

#in {
	margin: 0 auto;
	width: 400px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-end;
}

#in li {
	float: right;
	font-size: 18px;
	margin: 13px
}

#in li input {
	width: 300px;
	height: 25px;
	margin: 10px;
}
.butt {
	background-color: #bee5d3;
	width:80px;
	height:30px;
	border-radius: 15px;
	margin: 10px;
	margin-left: 15px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="box">
		<div id="name">Login</div>
		<div id="inbox">
			<form action="action/login_act.jsp" method="post">
				<ul id="in">
					<li>아이디 <input type="text" name="id" maxlength="20"></li>
					<li>비밀번호 <input type="password" name="pw" maxlength="20"></li>
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