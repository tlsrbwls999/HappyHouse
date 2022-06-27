<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<c:if test="${cookie.loginid.value ne null}">
	<c:set var="svid" value="${cookie.loginid.value}" />
	<c:set var="ckid" value=" checked=\"checked\"" />
</c:if>

<script type="text/javascript">
	$(document).ready(function() {
		$("#loginBtn").click(function() {
			if (!$("#id").val()) {
				alert("아이디 입력!!!");
				return;
			} else if (!$("#password").val()) {
				alert("비밀번호 입력!!!");
				return;
			} else {
				alert("로그인을 시도합니다. 페이지가 넘어가지 않는 경우 정보가 일치하지 않는 것을 의미합니다. 이 경우, 계정 확인을 부탁드립니다.");
				$("#loginform").attr("action", "${root}/user/login").submit();
			}
		});
		$("#mvRegisterBtn").click(function() {
			location.href = "${root}/user/register";
		});
	});
</script>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Happy House</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/icon.png" />
<link rel="stylesheet" href="../css/main.css" />
</head>


    <!-- Navigation-->
    <nav class="navbar navbar-light bg-light static-top">
      <div class="container">
        <a href="/happyhouse">
          <img
            class="logo"
            src="../assets/icon.png"
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
              window.location.href="../user/list";
            }
            else{
            	//로그인
              window.location.href="../user/login";
            }
          }
        </script>
        <!--<a class="btn btn-primary" id = "login-button" button onclick="location.href='./login.html'">로그인</a>-->
        <c:if test="${empty userInfo}">
        	<a class="btn btn-primary" id = "login-button" button href="../user/login">로그인</a>
		</c:if>
		<c:if test="${!empty userInfo}">
			<a class="btn btn-primary" id = "login-button" button href="../user/list">마이페이지</a>
		</c:if>	
      </div>
    </nav>


<div class="container">
	<div class="login-page">
		<h2>
			로그인
		</h2>
		<form id="loginform" class="text-left mb-3" method="post" action="${root}/user/login">
			<input type="hidden" name="act" id="act" value="login">
			<div class="form">
				<label for="userid">아이디를 입력하세요.</label> <input type="text"
					class="login-form" id="id" name="id" placeholder="ID"
					value="${svid}">
				<label for="userpwd">비밀번호를 입력하세요.</label> <input type="password"
					class="login-form" id="password" name="password" placeholder="password">
					
				<div class="text-danger mb-2">${msg}</div>
				
				<button type="button" id="loginBtn">로그인</button>
				<button type="button" id="mvRegisterBtn">회원가입</button>
				
			</div>
			
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp"%>