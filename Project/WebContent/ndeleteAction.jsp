<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="news.NewsDAO" %>
<%@ page import="news.News" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
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
        int nId = 0;
        if (request.getParameter("nId") != null){
        	nId = Integer.parseInt(request.getParameter("nId"));
        }
        if(nId == 0){
           PrintWriter script = response.getWriter();
     	   script.println("<script>");
     	   script.println("alert('유효하지 않은 글입니다.')");
     	   script.println("location.href = 'news.jsp'");
     	   script.println("</script>");  
    }
        News news = new NewsDAO().getNews(nId);
        if(!userId.equals(news.getUserId())){
        	PrintWriter script = response.getWriter();
      	   script.println("<script>");
      	   script.println("alert('권한이 없습니다.')");
      	   script.println("location.href = 'news.jsp'");
      	   script.println("</script>"); 
        }else{
					NewsDAO newsDAO = new NewsDAO();
					int result = newsDAO.delete(nId);
					
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글삭제에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('삭제가 완료되었습니다.')");
						script.println("location.href = 'news.jsp'");
						script.println("</script>");
	      }
	 }
%>
</body>
</html>