<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO" %>   
<%@page import="user.User" %>  
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" 
integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>


    <style>
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
    <!---->
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
    .subnav{
    font-size: 13px;
    }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
     
    </style>
    <link href="carousel.css" rel="stylesheet">
  </head>
  <body>
 
	<%
	String userId = null;
    if(session.getAttribute("userId") != null){
		 userId = (String) session.getAttribute("userId");
		}
	%>
    <header>
 <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-white border-bottom shadow-sm">
 <!-- 홈 그룹 -->
   <a class="navbar-brand text-dark" href="Home.jsp"><img alt="logo" src="image/logo.png" style="width: 40px;"></a>
    <ul class="nav">
  <li class="nav-item">
    <a class="nav-link" href="order.jsp" style="color: black;">주문하기</a>
  </li>
  <li  class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black;">고객센터</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="news.jsp">시장 소식/공지</a>
          <a class="dropdown-item" href="board.jsp">게시판</a>
        </div>
      </li>
      </ul>
      <div class="collapse navbar-collapse" id="navbarCollapse"></div>
    <%
    if(userId == null){
    %>
    
    <div class="subnav" style="float: right;">
<a href="login.jsp" style="color: black;">로그인</a>&nbsp;&nbsp;
<a href="join.jsp" style="color: black;">회원 가입</a>
   <%
    }else if(session.getAttribute("userId").equals("admin")){
    %>
    <a href="user.jsp" style="color: black; font-size: 13px;">회원관리</a>&nbsp;&nbsp;&nbsp;
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
</header>

<!-- 캐러셀 -->
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
     <a href="nview.jsp?nId=5"><img src="image/carousel/slide1.jpg" class="d-block w-100" style="height: 500px;"></a>
    
      <div class="carousel-caption d-none d-md-block">
       <h5 style="color: black;"> 이벤트1</h5>
      </div>
    </div>
    <div class="carousel-item">
     <a href="nview.jsp?nId=6"><img src="image/carousel/slide2.jpg" class="d-block w-100" style="height: 500px;"></a>
      <div class="carousel-caption d-none d-md-block">
        <h5>이벤트2</h5>
        
      </div>
    </div>
    <div class="carousel-item">
      <a href="nview.jsp?nId=7"><img src="image/carousel/slide3.jpg" class="d-block w-100" style="height: 500px;"></a>
      <div class="carousel-caption d-none d-md-block">
        <h5 style="color: black;">이벤트3</h5>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<br>
<div class="container marketing">
<!-- 매장 정보 -->
 <div class="container">
    <!-- Example row of columns -->
 <div class="row">
      <div class="col-md-4">
        <div class="card" style="width: 20rem;">
  <img src="image/shop/shop1.jpg" class="card-img-top" alt="#">
  <div class="card-body">
    <h5 class="card-title">우리동네 시장</h5>
    <p class="card-text">
    <li style="font-size: 12px;"> 오시는 길: 대구 중구 큰장로26길 45
  <li style="font-size: 12px;"> 영업시간: (주중)첫째 셋째 일요일 휴무
매일 09:00 - 19:00 (야간)3월~11월 : 평일,일(19:00~23:00) 금,토(19:00~24:00)
12월~2월: 평일,일(19:00~22:00) 금,토(19:00~23:00)
연중무휴
  </p>
  <br>
   <a class="btn btn-secondary" href="nview.jsp?nId=2" role="button">바로가기 &raquo;</a>
  </div>
</div>
      </div>
      <div class="col-md-4">
        <div class="card" style="width: 20rem;">
  <img src="image/shop/shop2.jpg" class="card-img-top" alt="">
  <div class="card-body">
    <h5 class="card-title">우리동네 시장</h5>
    <p class="card-text">
    <li style="font-size: 12px;"> 오시는길: 부산 중구 신창동4가
  <li style="font-size: 12px;"> 영업시간:일요일 휴무매월 1,3주<br>
매일 09:00 - 20:00
  </p><br><br><br>
   <a class="btn btn-secondary" href="nview.jsp?nId=3" role="button">바로가기 &raquo;</a>
  </div>
</div>
     </div>
      <div class="col-md-4">
       <div class="card" style="width: 20rem;">
  <img src="image/shop/shop3.jpg" class="card-img-top" alt="cloth">
  <div class="card-body">
    <h5 class="card-title">우리동네 시장</h5>
    <p class="card-text">
    <li style="font-size: 12px;"> 오시는길: 서울 종로구 창경궁로 88</li>
  <li style="font-size: 12px;">영업시간: 일요일 휴무
매일 09:00 - 18:00<br>
매일 09:00 - 23:00 (먹자골목, 연중무휴)<br>
매일 10:00 - 19:00 (구제상가, 일요일 휴무)
  </p><br><br>
    <a class="btn btn-secondary" href="nview.jsp?nId=4" role="button">바로가기 &raquo;</a>
  </div>
</div>
      </div>
  </div> <!-- /container -->
  </div>
    <!--각종 소식--> 
  <hr class="featurette-divider">
  <!-- FOOTER -->
  <footer class="container">
    <p class="float-right"><a href="Home.jsp" style="color: black;">Back to top</a></p>
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
      </div>
  </footer>
      </body>
</html>