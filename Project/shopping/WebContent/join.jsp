<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Join</title>
<meta charset="utf-8">
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<style>
body {font-family: Arial, Helvetica, sans-serif;
background-color: #f5f5f5;
}

/* Full-width input fields */
input[type=text], input[type=password]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

.a{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
input[type=button]{
  background-color: teal;
  border: none;
  color: white;
  text-align: center;
}

/* Set a style for all buttons */
button {
  background-color: silver;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

.container {
  padding: 16px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; 
  border: 1px solid #888;
  width: 40%; 
}

.cancel, .sign {
  float: left;
  width: 50%;
}
</style>
</head>
<body>
  <div class="container marketing">
  <form class="modal-content animate" action="joinAction.jsp" method="post" name="join">
    <div class="imgcontainer">
      <img src="image/login.png" class="avatar" style="width: 100px;">
    </div>
    <div class="container">
     <label for="Name"><b>이름</b></label>
      <input type="text" name="userName"  placeholder="이름" required autofocus>
    
      <label for="Id"><b>아이디</b></label><br>
      <input type="text" placeholder="아이디를 입력해주세요" name="userId" required>
      <label for="Password"><b>비밀번호</b></label>
      <input type="password" placeholder="비밀번호를 입력해주세요" name="userPassword" required>
      
      <a><b>연락처</b></a><div class="container"> <div class="row">
       <select id="Phone1" name="userPhone1" class="a" style="width: 100px;" required>
  <option value="010">010</option> <!-- db1 -->
  <option value="011">011</option> <!-- db2 -->
  <option value="016">016</option> <!-- db3 -->
  <option value="017">017</option> <!-- db4 -->
  <option value="018">018</option> <!-- db5 -->
  <option value="019">019</option> <!-- db6 -->
  </select><input type="tel" name="userPhone2" class="a" placeholder="연락처 입력" style="width: 307px;" maxlength="8" required></div></div>
      <div class="clearfix">
        <button type="reset"  class="cancel" style="background-color: teal;">취소</button>
        <button type="submit" class="sign">가입</button>
      </div>
    </div>
    </div>
  </form>
  <hr class="featurette-divider">
  <!-- FOOTER -->
  <footer class="container">
    <p class="float-right"><a href="Home.jsp" style="color: black;">Go to home</a></p>
    <p>&copy; Traditional Market</p>
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