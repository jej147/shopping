<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<%@page import="user.UserDAO" %>   
<%@page import="user.User" %>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원정보</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" 
integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">
    <style>
    body {
  padding-top: 5rem;
}
.subnav{
font-size: 13px;
}
.container-a{
text-align: center;
}
	.link{
 	background-color: #f5f5f5;
 	width: 200px;
 	}
 .table{
 text-align: center;
 width:700px; 
 margin: auto;
 }	
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .vertical-menu {
  width: 200px;
}

.vertical-menu a {
  background-color: #eee;
  color: black;
  display: block;
  padding: 12px;
  text-decoration: none;

}

.vertical-menu a:hover {
  background-color: #ccc;
}

.vertical-menu a.active {
  background-color: teal;
  color: white;
}
@media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
    </style>
  </head>
  <body>
  <%
		String userId = null;
		if(session.getAttribute("userId") != null) {
			userId = (String) session.getAttribute("userId");
			System.out.println("userUpdate.jsp : userId"+userId);
			
		}else if (session.getAttribute("userId") == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		
		User user = new UserDAO().getUser(userId);
		if (!userId.equals(user.getUserId())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
	%>
	
   <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-white border-bottom shadow-sm">
  <a class="navbar-brand text-dark" href="Home.jsp"><img alt="logo" src="image/logo.png" style="width: 40px;"></a>
    <ul class="nav">
   <li class="nav-item">
    <a class="nav-link" href="order.jsp" style="color: black;">주문하기</a>
  </li>
  <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black;">고객센터</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="news.jsp">시장 소식/공지</a>
          <a class="dropdown-item" href="board.jsp">게시판</a>
        </div>
      </li>
      </ul>
    &nbsp;&nbsp;&nbsp;&nbsp;<div class="collapse navbar-collapse" id="navbarCollapse">
    </div>
<%
    if(userId == null){
    %>
    
    <div class="subnav" style="float: right;">
<a href="login.jsp" style="color: black;">로그인</a>&nbsp;&nbsp;
<a href="join.jsp" style="color: black;">회원 가입</a>
   <%
    }else if(session.getAttribute("userId").equals("admin")){
    %>
    <a href="auser.jsp" style="color: black; font-size: 13px;">회원관리</a>&nbsp;&nbsp;&nbsp;
    <a href="logoutAction.jsp" style="color: black; font-size: 13px;" onclick="return confirm('로그아웃 하시겠습니까?')">로그아웃</a>
 	<%
    }else{
    %>
    <ul class="nav">
     <li class="nav-item dropdown" style="font-size: 13px;">
        <a class="dropdown-toggle" data-toggle="dropdown" style="color: black;" ><%=userId%>님</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="cart.jsp">장바구니</a>
          <a class="dropdown-item" href="user.jsp">회원정보</a>
        </div>
      </li>
      </ul>
 &nbsp; &nbsp;
<a href="logoutAction.jsp" style="color: black; font-size: 13px;" onclick="return confirm('로그아웃 하시겠습니까?')">로그아웃</a>&nbsp;&nbsp;&nbsp;
</div>  
    <%
    }
 	%> 
  </nav>
<!-- 찾기 -->
<div class="container marketing">
<div class="a" style="text-align: center;"><b>회원정보</b></div>
 <hr class="featurette-divider">
<!-- 정보 --> 
<br>
     <table class="table" style="text-align: center; font-size: 13px; 
     border: 1px solid #dddddd;">
  <thead>
  <tr>
  <th style="background-color: #eeeeee; text-align: center;">이름</th>
  <th style="background-color: #eeeeee; text-align: center;">아이디</th>
   <th style="background-color: #eeeeee; text-align: center;">비밀번호</th>
  <th style="background-color: #eeeeee; text-align: center;">연락처</th>
  </tr>
  </thead>

  <tbody>
  <tr>
  <td><%=user.getUserName()%></td>
  <td><%=user.getUserId()%></td>
  <td><%=user.getUserPassword()%></td>
  <td><%=user.getUserPhone1()%><%=user.getUserPhone2()%></td>
  </tr>
  </tbody>
  </table>
  <br>
  <div class="table">
   
   <a href="deleteUserAction.jsp" class="btn" style=" background-color: teal; 
   font-size: 13px; color: white; margin: auto;" onclick="return confirm('정말로 탈퇴 하시겠습니까?')">탈퇴하기</a>
  </div>
<!-- 바닥글 -->
<div class="container marketing" style="position: fixed; bottom: 0;">
<hr class="featurette-divider">
  <!-- FOOTER -->
  <footer class="container">
    <p class="float-right"><a href="Home.jsp" style="color: black;">Back to home</a></p>
    <p>&copy; Traditional Market</a></p>
    <div class="row">
     <div class="col-6 col-md">
        <h5 style="font-size: 16px;">COMPANY</h5>
        <ul class="list-unstyled text-small" style="font-size: 13px;">
          <li><a class="text-muted" href="company.jsp">회사 소개</a></li>
          <li><a class="text-muted" href="map.jsp">오시는 길</a></li>
          <li><a class="text-muted">T.123-456-7890</a></li>
          <li><a class="text-muted">상담시간(AM 9:00~ PM 18:00)</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5 style="font-size: 16px;">MENU</h5>
        <ul class="list-unstyled text-small" style="font-size: 13px;">
         <li><a class="text-muted" href="board.jsp">게시판</a></li>
          <li><a class="text-muted" href="order.jsp">주문하기</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5 style="font-size: 16px;">MORE INFO</h5>
        <ul class="list-unstyled text-small" style="font-size: 13px;">
          <li><a class="text-muted" href="news.jsp">고객센터</a></li>
          <li><a class="text-muted" href="infor.jsp">이용약관</a></li> 
          <li><a class="text-muted" href="infor2.jsp">개인정보 처리방침</a></li>
        </ul>
      </div>
      </div>
       </footer>
      </div>   
</body>
</html>