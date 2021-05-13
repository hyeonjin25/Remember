<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<link rel="stylesheet" href="css/reset.css">
    <style>
        #box{background-color: rgb(255, 214, 228); width: 70%; min-width: 430px; margin:40px auto;
            padding-top:20px; display: flex; flex-direction: column; justify-content: center;}
        #name{text-align: center; font-size: 23px; font-weight: bold; margin-top: 10px;}
        #inbox{min-width: 430px; margin:40px auto; margin-top: 10px;}
        #in{ margin:0 auto; width: 370px; display: flex; flex-direction: column; justify-content: center;
            align-items: flex-end;}
        #in li{ float: right; font-size: 18px; margin:2px}
        #in li input{ width: 300px; height: 25px; margin: 10px; }
    </style>
</head>
<body style="overflow: scroll;">
	<jsp:include page="header.jsp" flush="false" />
	 <div id="box">
        <div id="name">Register</div>
        <div id="inbox">
	        <form action="server/register_sv.jsp" method="post">
	            <ul id="in">
	                <li>이름  <input type="text" name="name"></li>
	                <li>아이디  <input type="text" name="id"></li>
	                <li>비밀번호  <input type="password" name="pw"></li>
	                <li>비밀번호 확인  <input type="password" name="pwcheck"></li>
	                <li>생년월일  <input type="date" name="birth"></li>
	                <li><button type="submit">회원가입</button></li>
	            </ul>
	        </form>
        </div>
    </div>
</body>
</html>