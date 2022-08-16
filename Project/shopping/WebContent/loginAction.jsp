<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setPropertyname="user" property="userId" />
<jsp:setPropertyname="user" property="userPassword" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>login</title>
</head>
<body>
 
 <%
 String userId = null;
 if(session.getAttribute("userId") != null) {
	 userId = (String) session.getAttribute("userId");
 }
  if(userId != null){
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('이미 로그인이 되어있습니다.')");
	   script.println("location.href = 'Home.jsp'");
	   script.println("</script>");  
  }
  UserDAO userDAO = new UserDAO();
  int result = userDAO.login(user.getUserId(), user.getUserPassword());
  if(result ==1){
	  session.setAttribute("userId", user.getUserId());
	  PrintWriter script = response.getWriter();
	  script.println("<script>");
	  script.println("alert('"+ user.getUserId() +"님 환영합니다.')");
	  script.println("location.href = 'Home.jsp'");
	  script.println("</script>");
  }
  if(result ==0){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('비밀번호가 틀립니다.')");
   script.println("history.back()");
   script.println("</script>");  
  }
  if(result == -1){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('존재하지 않는 아이디 입니다.')");
   script.println("history.back()");
   script.println("</script>");  
  }
  
  if(result == -2){
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('데이터 베이스 오류가 발생하였습니다.')");
   script.println("history.back()");
   script.println("</script>");  
  }
  
 %>
 
</body>
</html>