<%@page import="bbs.BbsDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsBean" %>
<%@ page import="bbs.BbsDAO" %>
<%
request.setCharacterEncoding("utf-8");
%>
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
	
	int bbsID = 0;
	if(request.getParameter("bbsID")!=null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	
	// bbsID가 존재하지 않는 경우
	if(bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 게시글 입니다.')");
		script.println("location.href='Q&APage.jsp'"); //사용자를 Q&A페이지로 돌려보내기
		script.println("</script>");
	}
	
	BbsBean bbs = new BbsDAO().getBbs(bbsID);
	
	// 글 수정하려는 유저가 작성한 유저와 같은지 확인
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제 권한이 없습니다.')");
		script.println("location.href='Q&APage.jsp'"); //사용자를 Q&A페이지로 돌려보내기
		script.println("</script>");
	}
	//삭제 권한이 있는 경우
	else{

		BbsDAO bbsDAO = new BbsDAO();
		//bbsDAO 사용하여 delete 시도 후 결과값 저장
		int result = bbsDAO.delete(bbsID);

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
			script.println("alert('글이 삭제 되었습니다.')");
			script.println("location.href='../Q&APage.jsp'"); //글 삭제 성공
			script.println("</script>");
		}
	}	
	%>
</body>
</html>