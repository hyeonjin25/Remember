<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receive login</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		//관리자 값이 null이 아닌경우에 admin임
		String admin = request.getParameter("admin");
	%>
<%-- 	<%= id %><br>
	<%= pw %><br>
	<%= admin %> --%>
</body>
</html>