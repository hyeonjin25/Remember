<%@page import="bbs.BbsDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="bbs" class="bbs.BbsBean" scope="page" />

<!-- 넘어온 값 저장 -->
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>remember</title>
</head>
<body>
	<%
	String userID = (String)session.getAttribute("userID");
	
	//로그인이 되어있지 않은 경우 돌려 보내기
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href='../LoginPage.jsp'"); //사용자를 로그인페이지로 돌려보내기
		script.println("</script>");
	}
	//로그인 되어있는 경우
	else{
		
		//사용자가 제목을 입력하지 않았을 경우
		if (bbs.getBbsTitle() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('제목을 입력해 주십시오.')");
			script.println("history.back()"); //사용자를 이전(write)페이지로 돌려보내기
			script.println("</script>");
		}	
		//사용자가 내용을 입력하지 않았을 경우
		else if (bbs.getBbsContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('내용을 입력해 주십시오.')");
			script.println("history.back()"); //사용자를 이전(write)페이지로 돌려보내기
			script.println("</script>");
		}

		BbsDAO bbsDAO = new BbsDAO();
		//bbsDAO 사용하여 write 시도 후 결과값 저장
		int result = bbsDAO.write(bbs.getBbsTitle(),userID, bbs.getBbsContent());

		//데이터베이스 오류가 발생했을 경우
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");
			script.println("history.back()"); //사용자를 이전페이지로 돌려보내기
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글이 업로드 되었습니다.')");
			script.println("location.href='../Q&APage.jsp'"); //글 업로드 성공
			script.println("</script>");
		}
	}	
	%>
</body>
</html>