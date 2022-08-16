<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.BoardDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "board" class = "board.Board" scope="page"/>
<jsp:setProperty name="board" property="tTitle"/>
<jsp:setProperty name="board" property="tContent"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<%
		String userId = null;
		if(session.getAttribute("userId") != null) {
		 userId = (String) session.getAttribute("userId");
		}
 		if(userId == null){
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('로그인 후 이용해주세요.')");
	   script.println("location.href = 'login.jsp'");
	   script.println("</script>");  
	 }else{
			if (board.gettTitle() == null || board.gettContent() == null){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					BoardDAO boardDAO = new BoardDAO();
					int result = boardDAO.write (board.gettTitle(), userId, board.gettContent());
					
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('작성에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('작성이 완료되었습니다.')");
						script.println("location.href = 'board.jsp'");
						script.println("</script>");
				}
	      }
	 }
%>
</body>
</html>