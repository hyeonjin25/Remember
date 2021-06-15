<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remember</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/page.css">
<style type="text/css">
	#inbox {
		padding-top: 20px;
	}
	#buttBox {
		margin-top: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp" flush="false" />
	<div id="box">
		<div id="name">Login</div>
		<div id="inbox">
			<form action="action/loginAction.jsp" method="post">
				<ul id="in">
					<li><input type="text" name="userID" id="userID" placeholder="아이디" maxlength="20"></li>
					<li><input type="password" name="userPW" id="userPW" placeholder="비밀번호" maxlength="20"></li>
					<div id="buttBox">
						<!-- 관리자 로그인이면 1, 아니면 0 보내기 -->
						<input type="checkbox" name="userAdmin" id="userAdmin" value=1 style="width: 16px; margin: 0 2px 0 0" />관리자 로그인
						<button class="butt" type="submit">로그인</button>
					</div>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>