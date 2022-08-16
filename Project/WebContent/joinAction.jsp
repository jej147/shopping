<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class = "user.User" scope="page"/>
<jsp:setProperty name="user" property="userId"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userPhone1"/>
<jsp:setProperty name="user" property="userPhone2"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
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
	if (user.getUserId() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserPhone1() == null
		|| user.getUserPhone2() == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			session.setAttribute("userId", user.getUserId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('가입이 완료되었습니다.')");
			script.println("location.href = 'Home.jsp'");
			script.println("</script>");
	}
	 }
%>
</body>
</html>