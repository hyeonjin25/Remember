<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remember</title>
</head>
<body>
	<%
	//session 제거
	session.invalidate();
	%>
	<script type="text/javascript">
		location.href = "../index.jsp";
	</script>
</body>
</html>