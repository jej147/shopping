<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "news.NewsDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "news" class = "news.News" scope="page"/>
<jsp:setProperty name="news" property="nTitle"/>
<jsp:setProperty name="news" property="nContent"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>
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
			if (news.getnTitle() == null || news.getnContent() == null){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력이 안된 사항이 있습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					NewsDAO newsDAO = new NewsDAO();
					int result = newsDAO.write (news.getnTitle(), userId, news.getnContent());
					
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('등록에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('공지가 등록되었습니다.')");
						script.println("location.href = 'news.jsp'");
						script.println("</script>");
				}
	      }
	 }
%>
</body>
</html>