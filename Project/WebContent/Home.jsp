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
 <!-- ??? ?????? -->
   <a class="navbar-brand text-dark" href="Home.jsp"><img alt="logo" src="image/logo.png" style="width: 40px;"></a>
    <ul class="nav">
  <li class="nav-item">
    <a class="nav-link" href="order.jsp" style="color: black;">????????????</a>
  </li>
  <li  class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black;">????????????</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="news.jsp">?????? ??????/??????</a>
          <a class="dropdown-item" href="board.jsp">?????????</a>
        </div>
      </li>
      </ul>
      <div class="collapse navbar-collapse" id="navbarCollapse"></div>
    <%
    if(userId == null){
    %>
    
    <div class="subnav" style="float: right;">
<a href="login.jsp" style="color: black;">?????????</a>&nbsp;&nbsp;
<a href="join.jsp" style="color: black;">?????? ??????</a>
   <%
    }else if(session.getAttribute("userId").equals("admin")){
    %>
    <a href="user.jsp" style="color: black; font-size: 13px;">????????????</a>&nbsp;&nbsp;&nbsp;
    <a href="logoutAction.jsp" style="color: black; font-size: 13px;" onclick="return confirm('???????????? ???????????????????')">????????????</a>
 	<%
    }else{
    %>
    <ul class="nav">
     <li class="nav-item dropdown" style="font-size: 13px;">
        <a class="dropdown-toggle" data-toggle="dropdown" style="color: black;" ><%=userId%>???</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="cart.jsp">????????????</a>
          <a class="dropdown-item" href="user.jsp">????????????</a>
        </div>
      </li>
      </ul>
 &nbsp; &nbsp;
<a href="logoutAction.jsp" style="color: black; font-size: 13px;" onclick="return confirm('???????????? ???????????????????')">????????????</a>&nbsp;&nbsp;&nbsp;
</div>  
    <%
    }
 	%>
  </nav>
</header>

<!-- ????????? -->
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
       <h5 style="color: black;"> ?????????1</h5>
      </div>
    </div>
    <div class="carousel-item">
     <a href="nview.jsp?nId=6"><img src="image/carousel/slide2.jpg" class="d-block w-100" style="height: 500px;"></a>
      <div class="carousel-caption d-none d-md-block">
        <h5>?????????2</h5>
        
      </div>
    </div>
    <div class="carousel-item">
      <a href="nview.jsp?nId=7"><img src="image/carousel/slide3.jpg" class="d-block w-100" style="height: 500px;"></a>
      <div class="carousel-caption d-none d-md-block">
        <h5 style="color: black;">?????????3</h5>
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
<!-- ?????? ?????? -->
 <div class="container">
    <!-- Example row of columns -->
 <div class="row">
      <div class="col-md-4">
        <div class="card" style="width: 20rem;">
  <img src="image/shop/shop1.jpg" class="card-img-top" alt="#">
  <div class="card-body">
    <h5 class="card-title">???????????? ??????</h5>
    <p class="card-text">
    <li style="font-size: 12px;"> ????????? ???: ?????? ?????? ?????????26??? 45
  <li style="font-size: 12px;"> ????????????: (??????)?????? ?????? ????????? ??????
?????? 09:00 - 19:00 (??????)3???~11??? : ??????,???(19:00~23:00) ???,???(19:00~24:00)
12???~2???: ??????,???(19:00~22:00) ???,???(19:00~23:00)
????????????
  </p>
  <br>
   <a class="btn btn-secondary" href="nview.jsp?nId=2" role="button">???????????? &raquo;</a>
  </div>
</div>
      </div>
      <div class="col-md-4">
        <div class="card" style="width: 20rem;">
  <img src="image/shop/shop2.jpg" class="card-img-top" alt="">
  <div class="card-body">
    <h5 class="card-title">???????????? ??????</h5>
    <p class="card-text">
    <li style="font-size: 12px;"> ????????????: ?????? ?????? ?????????4???
  <li style="font-size: 12px;"> ????????????:????????? ???????????? 1,3???<br>
?????? 09:00 - 20:00
  </p><br><br><br>
   <a class="btn btn-secondary" href="nview.jsp?nId=3" role="button">???????????? &raquo;</a>
  </div>
</div>
     </div>
      <div class="col-md-4">
       <div class="card" style="width: 20rem;">
  <img src="image/shop/shop3.jpg" class="card-img-top" alt="cloth">
  <div class="card-body">
    <h5 class="card-title">???????????? ??????</h5>
    <p class="card-text">
    <li style="font-size: 12px;"> ????????????: ?????? ????????? ???????????? 88</li>
  <li style="font-size: 12px;">????????????: ????????? ??????
?????? 09:00 - 18:00<br>
?????? 09:00 - 23:00 (????????????, ????????????)<br>
?????? 10:00 - 19:00 (????????????, ????????? ??????)
  </p><br><br>
    <a class="btn btn-secondary" href="nview.jsp?nId=4" role="button">???????????? &raquo;</a>
  </div>
</div>
      </div>
  </div> <!-- /container -->
  </div>
    <!--?????? ??????--> 
  <hr class="featurette-divider">
  <!-- FOOTER -->
  <footer class="container">
    <p class="float-right"><a href="Home.jsp" style="color: black;">Back to top</a></p>
    <p>&copy; Traditional Market</a></p>
    <div class="row">
     <div class="col-6 col-md">
        <h5 style="font-size: 16px;">COMPANY</h5>
        <ul class="list-unstyled text-small" style="font-size: 13px;">
          <li><a class="text-muted" href="company.jsp">?????? ??????</a></li>
          <li><a class="text-muted" href="map.jsp">????????? ???</a></li>
          <li><a class="text-muted">T.123-456-7890</a></li>
          <li><a class="text-muted">????????????(AM 9:00~ PM 18:00)</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5 style="font-size: 16px;">MENU</h5>
        <ul class="list-unstyled text-small" style="font-size: 13px;">
        <li><a class="text-muted" href="board.jsp">?????????</a></li>
          <li><a class="text-muted" href="order.jsp">????????????</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5 style="font-size: 16px;">MORE INFO</h5>
        <ul class="list-unstyled text-small" style="font-size: 13px;">
         <li><a class="text-muted" href="news.jsp">????????????</a></li> 
          <li><a class="text-muted" href="infor.jsp">????????????</a></li> 
          <li><a class="text-muted" href="infor2.jsp">???????????? ????????????</a></li>
        </ul>
      </div>
      </div>
      </div>
  </footer>
      </body>
</html>