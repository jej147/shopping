<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.BoardDAO" %>
<%@ page import = "board.Board" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
	 }
        int tId = 0;
        if (request.getParameter("tId") != null){
        	tId = Integer.parseInt(request.getParameter("tId"));
        }
        if(tId == 0){
           PrintWriter script = response.getWriter();
     	   script.println("<script>");
     	   script.println("alert('유효하지 않은 글입니다.')");
     	   script.println("location.href = 'board.jsp'");
     	   script.println("</script>");  
    }
        Board board = new BoardDAO().getBoard(tId);
        if(!userId.equals(board.getUserId())){
        	PrintWriter script = response.getWriter();
      	   script.println("<script>");
      	   script.println("alert('권한이 없습니다.')");
      	   script.println("location.href = 'board.jsp'");
      	   script.println("</script>"); 
        }else{
			if (request.getParameter("tTitle") == null || request.getParameter("tContent") == null || request.getParameter("tTitle").equals("")
					|| request.getParameter("tContent").equals("")){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					BoardDAO boardDAO = new BoardDAO();
					int result = boardDAO.update(tId, request.getParameter("tTitle"), request.getParameter("tContent"));
					
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글수정에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('수정이 완료되었습니다.')");
						script.println("location.href = 'board.jsp'");
						script.println("</script>");
				}
	      }
	 }
%>
</body>
</html>