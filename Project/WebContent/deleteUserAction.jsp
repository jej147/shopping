<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "user.User" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>
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
        
        User user = new UserDAO().getUser(userId);
        if(!userId.equals(user.getUserId())){
        	PrintWriter script = response.getWriter();
      	   script.println("<script>");
      	   script.println("alert('권한이 없습니다.')");
      	   script.println("location.href = 'user.jsp'");
      	   script.println("</script>"); 
        }else{
					UserDAO userDAO = new UserDAO();
					int result = userDAO.delete(user.getUserId());
					
					if(result == -1){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('탈퇴에 실패했습니다.')");
						script.println("history.back()");
						script.println("</script>");
					}else {				
						session.invalidate();
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('탈퇴가 완료되었습니다.')");
						script.println("location.href = 'Home.jsp'");
						script.println("</script>");
	      }
	 }
%>
</body>
</html>