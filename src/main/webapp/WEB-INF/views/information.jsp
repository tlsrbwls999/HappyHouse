<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Happy House</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/icon.png" />
    <!-- Bootstrap icons-->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
      rel="stylesheet"
      type="text/css"
    />
    <!-- Google fonts-->
    <link
      href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
      rel="stylesheet"
      type="text/css"
    />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  </head>
  <body>
    <!-- Navigation-->
    <nav class="navbar navbar-light bg-light static-top">
      <div class="container">
        <a href="/happyhouse">
          <img
            class="logo"
            src="assets/icon.png"
            alt="My Image"
            style="max-width: 5%; height: auto"
          />
        </a>
        <script>
        window.onload = function(){
        	//HttpSession session = request.getSession();
			const login = sessionStorage.getItem("userInfo");
            //const login = JSON.parse(localStorage.getItem("login"));
            const btnElement = document.getElementById('login-button');
            if(login!=null){
              btnElement.innerText="마이페이지";
            }
      }
          function newPage(){
            const login = JSON.parse(localStorage.getItem("login"));
            if(${userInfo}!=null){
            	//마이페이지
              window.location.href="${root}/user/list";
            }
            else{
            	//로그인
              window.location.href="${root}/user/login";
            }
          }
        </script>
        <!--<a class="btn btn-primary" id = "login-button" button onclick="location.href='./login.html'">로그인</a>-->
        <c:if test="${empty userInfo}">
        	<a class="btn btn-primary" id = "login-button" button href="${root}/user/login">로그인</a>
		</c:if>
		<c:if test="${!empty userInfo}">
			<a class="btn btn-primary" id = "login-button" button href="${root}/user/list">마이페이지</a>
		</c:if>	
      </div>
    </nav>
    
    
    <!-- Masthead-->
    <header class="masthead" style="height: 200px; padding-top: 70px;">
      <div class="container position-relative">
        <div class="row justify-content-center">
          <div class="col-xl-6">
            <div class="text-center text-white">
              <!-- Page heading-->
              <h1 class="mb-5">해피하우스에서 행복의 보금자리를 찾아보세요!</h1>
            </div>
          </div>
        </div>
      </div>
    </header>



    <section class="container bg-light col-xl-auto mx-auto" style="max-width: 100%; padding: 70px 70px 70px 270px;">
		<div style="padding: 10px 0px 70px 0px;">
			<h2>About Us & Contact</h2>
			
			<h1>8조</h1>
			<h3>삼성 청년 SW 아카데미 7기 16반</h3>
			<a href="mailto:tlsrbwls999@naver.com" style="color: #000000; font-size:x-large; padding-right: 10px;">신규진</a>
			<a href="mailto:jibstring@gmail.com" style="color: #000000; font-size:x-large; padding-right: 10px;">이지현</a>
		</div>
		
		<div style="padding: 10px 0px 70px 0px;">
			<h2>Terms of Use & Privacy Policy</h2>
			<p>
				회원은 해피하우스 서비스 이용계약을 해지(이하 '회원탈퇴'라 한다)할 수 있습니다.<br>
				회원이 회원탈퇴를 원하는 경우에는 서비스 내 회원탈퇴 절차를 통하여 회원탈퇴를 할 수 있습니다.<br>
			</p>
		</div>
    </section>
    
    
    
    <!-- Footer-->
    <footer class="footer bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
            <ul class="list-inline mb-2">
              <li class="list-inline-item"><a href="${root}/information">About</a></li>
              <li class="list-inline-item">⋅</li>
              <li class="list-inline-item"><a href="${root}/information">Contact</a></li>
              <li class="list-inline-item">⋅</li>
              <li class="list-inline-item"><a href="${root}/information">Terms of Use</a></li>
              <li class="list-inline-item">⋅</li>
              <li class="list-inline-item"><a href="${root}/information">Privacy Policy</a></li>
            </ul>
            <p class="text-muted small mb-4 mb-lg-0">
              &copy; Happy House (SSAFY7_SEOUL16_8조). All Rights Reserved.
            </p>
          </div>
          <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
            <ul class="list-inline mb-0">
              <li class="list-inline-item me-4">
                <a href="https://www.facebook.com/hellossafy/"><i class="bi-facebook fs-3"></i></a>
              </li>
              <li class="list-inline-item me-4">
                <a href="https://www.youtube.com/channel/UC_XI3ByFO1uZIIH-g-zJZiw"><i class="bi-youtube fs-3"></i></a>
              </li>
              <li class="list-inline-item">
                <a href="https://www.instagram.com/hellossafy/"><i class="bi-instagram fs-3"></i></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
  </body>
</html>
