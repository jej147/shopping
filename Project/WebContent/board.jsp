<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>    
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
<%@ page import="java.util.ArrayList" %>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시판</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" 
integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>


     <style>
    a,a:hover{
    color: black;
    text-decoration: none;
    }
    body {
  padding-top: 5rem;
	}
	.subnav {
       float: right;
       font-size: 13px;
 	}
 	.main{
 	font-size: 20px;
 	float:inherit;
 	}
 	.link{
 	background-color: #f5f5f5;
 	width: 200px;
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
    </style>
  </head>
  <body>
 <%
	String userId = null;
    if(session.getAttribute("userId") != null){
		 userId = (String) session.getAttribute("userId");
		}
    	int pageNumber = 1;
    	if(request.getParameter("pageNumber") != null){
    		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    	}
	%>
   <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-white border-bottom shadow-sm">
  <a class="navbar-brand text-dark" href="Home.jsp"><img alt="logo" src="image/logo.png" style="width: 40px;"></a>
    <ul class="nav">
  <li class="nav-item">
    <a class="nav-link" href="order.jsp" style="color: black;">주문하기</a>
  </li>
  <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle"  id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black;">고객센터</a>
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
<!-- 영역시작 -->
<div class="container marketing">
<div class="a" style="text-align: center;"><b>게시판</b></div>
 <hr class="featurette-divider">

<div class="row">
  <div class="col-3">
    <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
    <div class="link">
 	  <a class="nav-link" style="color: white; background-color: teal;">고객센터</a>
      <a class="nav-link" href="news.jsp" style="color: black;">시장소식/공지</a>
      <a class="nav-link" href="board.jsp" style="color: black; background-color: silver;">게시판</a>
      <a class="nav-link" href="company.jsp" style="color: black;">회사소개</a>
      <a class="nav-link" href="map.jsp" style="color: black;">오시는길</a>
      <a class="nav-link" href="infor.jsp" style="color: black;">이용약관</a>
      <a class="nav-link" href="infor2.jsp" style="color: black;">개인정보 처리방침</a>
    </div>
  </div>
  </div>
  <div class="col-9">
   <table class="table" style="text-align: center; font-size: 10px; border: 1px solid #dddddd;">
  <thead>
  <tr>
  <th style="background-color: #eeeeee; text-align: center;">번호</th>
  <th style="background-color: #eeeeee; text-align: center;">제목</th>
  <th style="background-color: #eeeeee; text-align: center;">작성자</th>
  <th style="background-color: #eeeeee; text-align: center;">작성일</th>
  </tr>
  </thead>
  <tbody>
  <%
  BoardDAO boardDAO = new BoardDAO();
  ArrayList<Board> list = boardDAO.getList(pageNumber);
  for(int i = 0; i < list.size(); i++){
  %>  
  <tr>
  <td><%= list.get(i).gettId() %></td>
  <td><a href = "view.jsp?tId=<%= list.get(i).gettId() %>"><%= list.get(i).gettTitle() %></a></td>
  <td><%= list.get(i).getUserId() %></td>
  <td><%= list.get(i).gettDate().substring(0,11) + list.get(i).gettDate().substring(11,13) + "시"
  + list.get(i).gettDate().substring(14,16) + "분" %></td>
  </tr>
  <% 
  }
  %>
  
  </tbody>
  </table>
    <%
  if(pageNumber != 1){
  %>  
  <a href="board.jsp?pageNumber=<%= pageNumber-1 %>" class="btn" style="background-color: teal; font-size: 10px; color: white;">이전</a>
  <% 
  }if(boardDAO.nextPage(pageNumber+1)){
  %>
  <a href="board.jsp?pageNumber=<%= pageNumber+1 %>" class="btn" style="background-color: teal; font-size: 10px; color: white;">다음</a>
  <%
  }
  %>
  <a href="write.jsp" class="btn" style="float: right; background-color: silver; font-size: 10px;">글쓰기</a>
  </div>
</div>

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