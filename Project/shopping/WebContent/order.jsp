<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter" %> 
<%@ page import="java.util.ArrayList" %>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>주문</title>
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
.subnav{
font-size: 13px;
}
.container-a{
text-align: center;
}
@media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

div.scrollmenu {
  background-color: teal;
  overflow: auto;
  white-space: nowrap;
 margin:auto;
}

div.scrollmenu a {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 13px;
  text-decoration: none;
}
.con {
  position:  relative;
  font-family: Arial;
}

.text-block {
  position: absolute;
  bottom: 100px;
  right: 20px;
  background-color: teal;
  color: white;
  padding-left: 20px;
  padding-right: 20px;
  font-size: 15px;
}
.i-t {
  position: absolute;
  top: 50%;
  left: 10%;
 transform: translate(-50%, -50%);
  color: white;
 font-family:fantasy;
}
.col-lg-3 {
position: relative;
left: 140px;
}
#mySidenav a {
  position: absolute;
  left: -80px;
  transition: 0.3s;
  padding: 15px;
  width: 100px;
  text-decoration: none;
  font-size: 15px;
  color: white;
  border-radius: 0 5px 5px 0;
}

#mySidenav a:hover {
  left: 0;
}

#s {
  top: 140px;
  background-color: teal;
}

#d {
  top: 200px;
  background-color: teal;
}

#b {
  top: 260px;
  background-color: teal;
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
    <a class="nav-link" href="order.jsp" style="color: black;">주문하기 </a>
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
<!-- 찾기 -->
<div class="container marketing">
<div class="a" style="text-align: center;"><b>주문하기<% if(userId == null){
  %>
   <%
   }else if(session.getAttribute("userId").equals("admin")){
    %>
    <a href="insert.jsp" class="btn" style="float: right; background-color: silver; font-size: 10px;">상품등록</a>
<% } %></b></div>
 <hr class="featurette-divider">
<!-- 시장 --> 
<div id="mySidenav" class="sidenav">
  <a href="order.jsp" id="s">서울</a>
  <a href="#" id="d">대구</a>
  <a href="#" id="b">부산</a>
</div>
<div class="scrollmenu">
  <a href="order.jsp"><b>광장시장</b></a>
  <a href="order-1.jsp">동대문 종합시장</a>
  <a href="order-2.jsp">망원시장</a>
  <a href="order-3.jsp">마포시장</a> 
</div>
<!-- 배경-->
<div class="con">
  <img src="image/back/seoul1.jpg" alt="Nature" style="filter: blur(0px); width: 100%; 
  height: 300px;">
  <div class="i-t" style="font-size: 30px;">광장시장</div>
  <div class="text-block" style="border-radius: 5px 5px 5px 5px">
  <a>배달지역 :&nbsp; 종로구</a>     
  <br><a>배달시간 :&nbsp; 10:00 ~ 21:00 <br>(공휴일: 10:00 ~ 19:00)</a>
  <br><a>배달료 :&nbsp; 3000원</a>
  </div>
</div>
<br>
<!-- 상품 -->
<div class="row">
<%@ include file="dbconn.jsp" %>
          <%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%> 

       <div class="col-lg-3">
       <a href = "pview.jsp?id=<%=rs.getString("p_id")%>">
        <img src="resources/images/<%=rs.getString("p_fileName")%>" width="250" height="200" style="border-radius: 5px;"></a>
        <h4 name="price"><%=rs.getString("p_UnitPrice")%>&nbsp;<a style="font-size: 15px;">원</a></h4>
        <p name="name"><%=rs.getString("p_name")%></p>
       </div>
<%
				}
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			%>
 
</div>
</div>
<!-- 바닥글 -->

<div class="container">
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