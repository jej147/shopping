<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>íėŽėę°</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" 
integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>


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
	%>
   <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-white border-bottom shadow-sm">
  <a class="navbar-brand text-dark" href="Home.jsp"><img alt="logo" src="image/logo.png" style="width: 40px;"></a>
    <ul class="nav">
  <li class="nav-item">
    <a class="nav-link" href="order.jsp" style="color: black;">ėĢžëŽļíęļ°</a>
  </li>
  <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle"  id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black;">ęģ ę°ėží°</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="news.jsp">ėėĨ ėė/ęģĩė§</a>
          <a class="dropdown-item" href="board.jsp">ęēėí</a>
        </div>
      </li>
      </ul>
    &nbsp;&nbsp;&nbsp;&nbsp;<div class="collapse navbar-collapse" id="navbarCollapse">
      
    </div>
     <%
    if(userId == null){
    %>
    
    <div class="subnav" style="float: right;">
<a href="login.jsp" style="color: black;">ëĄę·ļėļ</a>&nbsp;&nbsp;
<a href="join.jsp" style="color: black;">íė ę°ė</a>
   <%
    }else if(session.getAttribute("userId").equals("admin")){
    %>
    <a href="auser.jsp" style="color: black; font-size: 13px;">íėęīëĶŽ</a>&nbsp;&nbsp;&nbsp;
    <a href="logoutAction.jsp" style="color: black; font-size: 13px;" onclick="return confirm('ëĄę·ļėė íėęē ėĩëęđ?')">ëĄę·ļėė</a>
 	<%
    }else{
    %>
    <ul class="nav">
     <li class="nav-item dropdown" style="font-size: 13px;">
        <a class="dropdown-toggle" data-toggle="dropdown" style="color: black;" ><%=userId%>ë</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="cart.jsp">ėĨë°ęĩŽë</a>
          <a class="dropdown-item" href="user.jsp">íėė ëģī</a>
        </div>
      </li>
      </ul>
 &nbsp; &nbsp;
<a href="logoutAction.jsp" style="color: black; font-size: 13px;" onclick="return confirm('ëĄę·ļėė íėęē ėĩëęđ?')">ëĄę·ļėė</a>&nbsp;&nbsp;&nbsp;
</div>  
    <%
    }
 	%>
  </nav>
<!-- ėė­ėė -->
<div class="container marketing">
<div class="a" style="text-align: center;"><b>íėŽėę°</b></div>
 <hr class="featurette-divider">

<div class="row">
  <div class="col-3">
    <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
      <div class="link">
 	  <a class="nav-link" style="color: white; background-color: teal;">ęģ ę°ėží°</a>
      <a class="nav-link" href="news.jsp" style="color: black;">ėėĨėė/ęģĩė§</a>
      <a class="nav-link" href="board.jsp" style="color: black;">ęēėí</a>
      <a class="nav-link" href="company.jsp" style="color: black; background-color: silver;">íėŽėę°</a>
      <a class="nav-link" href="map.jsp" style="color: black;">ėĪėëęļļ</a>
      <a class="nav-link" href="infor.jsp" style="color: black;">ėīėĐė―ęī</a>
      <a class="nav-link" href="infor2.jsp" style="color: black;">ę°ėļė ëģī ėēëĶŽë°ĐėđĻ</a>
    </div>
  </div>
  </div>
  <div class="col-9">
    ė§ė­ ė íĩėėĨė ėęķė ėīëĶŽęļ° ėí ė íĩėėĨë§ė ė ëģī, ë°°ëŽ ėëđėĪ ėđ ėŽėīíļ....
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
          <li><a class="text-muted" href="company.jsp">íėŽ ėę°</a></li>
          <li><a class="text-muted" href="map.jsp">ėĪėë ęļļ</a></li>
          <li><a class="text-muted">T.123-456-7890</a></li>
          <li><a class="text-muted">ėëīėę°(AM 9:00~ PM 18:00)</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5 style="font-size: 16px;">MENU</h5>
        <ul class="list-unstyled text-small" style="font-size: 13px;">
          <li><a class="text-muted" href="board.jsp">ęēėí</a></li>
          <li><a class="text-muted" href="order.jsp">ėĢžëŽļíęļ°</a></li>
        </ul>
      </div>
      <div class="col-6 col-md">
        <h5 style="font-size: 16px;">MORE INFO</h5>
        <ul class="list-unstyled text-small" style="font-size: 13px;">
          <li><a class="text-muted" href="news.jsp">ęģ ę°ėží°</a></li>
          <li><a class="text-muted" href="infor.jsp">ėīėĐė―ęī</a></li> 
          <li><a class="text-muted" href="infor2.jsp">ę°ėļė ëģī ėēëĶŽë°ĐėđĻ</a></li>
        </ul>
      </div>
      </div>
       </footer>
      </div>   
</body>
</html>