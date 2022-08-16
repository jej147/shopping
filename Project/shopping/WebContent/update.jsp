<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.Board" %>
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
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>

    <style>
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
  </nav>
<!-- 영역시작 -->
<div class="container marketing">
<div class="a" style="text-align: center;"><b>게시판</b></div>
 <hr class="featurette-divider">

<div class="row">
  <div class="col-3">
    <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
      <div class="link">
 	  <a class="nav-link" style="background-color: teal; color: white;">고객센터</a>
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
  <form method="post" name="writeform" action="updateAction.jsp?tId=<%= tId %>">
<table class="table table-striped">
  <tr>
    <td  width="70" align="center">제 목</td>
    <td  width="330" align="left">
    <input type="text" size="38" maxlength="50" name="tTitle" style="ime-mode:active; font-size: 15px;" value="<%= board.gettTitle() %>"></td>	
  </tr>
  <tr>
    <td  width="70" align="center" >내 용</td>
    <td  width="330" align="left">
    <textarea name="tContent" rows="13" cols="40" 
    style="ime-mode:active; font-size: 15px;" maxlength="2048"><%= board.gettContent() %></textarea> </td>
  </tr>
  <tr>      
    <td colspan=2 align="right"> 
      <input type="submit" value="글수정" class="btn" style="background-color: rgba(0, 0, 0, 0.1);">  
      <input type="reset" value="다시작성" class="btn" style="background-color: rgba(0, 0, 0, 0.1);">
      <input type="button" value="목록보기" OnClick="window.location='board.jsp'" class="btn" style="background-color: rgba(0, 0, 0, 0.1);">
    </td>
  </tr>
</table>       
</form>
  </div>
  </div>
<hr class="featurette-divider">
  <!-- FOOTER -->
  <footer class="container">
    <p class="float-right"><a href="Home.jsp">Back to home</a></p>
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