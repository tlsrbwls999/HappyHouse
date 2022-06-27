<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp" %>

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Happy House</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/icon.png" />
    <link rel="stylesheet" href="../css/main.css" />
    <script type="text/javascript">
        $(document).ready(function () {
        	var isId = false;
        	// 회원정보수정
            $("#changeBtn").click(function () {
                if (!$("#name").val()) {
                    alert("이름 입력!!!");
                    return;
                } else if (!$("#password").val()) {
                    alert("비밀번호 입력!!!");
                    return;
                } else {
                	alert("회원정보 수정을 진행합니다. 수정이 성공할 경우 메인 화면으로 돌아갑니다.");
                    $("#memberform").attr("action", "${root}").submit();
                }
            });
            $("#mvdeleteBtn").click(function() {
    			location.href = "${root}/user/delete";
    		});
            $("#mvlogoutBtn").click(function() {
    			location.href = "${root}/user/logout";
    		});
        });
    </script>
</head>

<c:if test="${empty userInfo}">
        <a href="${root}/user/login">로그인 후 이용 가능합니다.</a>
</c:if>
<c:if test="${!empty userInfo}">
<body>
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
        <br>
        <a href="${root}/article?act=list&pg=1&key=&word=">글목록</a>
        <div class="login-page">
            <h2>회원 정보</h2>
            <form id="memberform" class="text-left mb-3" method="post" action="${root}/user/update">
                <input type="hidden" name="act" id="act" value="change">
                <div class="form">
                <div class="form-group">
                    <label for="username">이름</label>
                    <input type="text" class="form-control" id="name" name="name" value="${userInfo.name}">
                </div>
                <div class="form-group">
                    <label for="userid">아이디</label>
                    <input type="text" class="form-control" id="id" name="id" value="${userInfo.id}">
                    <div id="idresult" class="mt-1"></div>
                </div>
                <div class="form-group">
                    <label for="userpwd">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <div class="form-group">
                    <label for="emailid">이메일</label><br>
                    <input type="text" class="form-control" id="email" name="email" value="${userInfo.email}">
                </div>
                <div class="form-group">
                    <label for="userid">나이</label>
                    <input type="text" class="form-control" id="age" name="age" value="${userInfo.age}">
                    <div id="idresult" class="mt-1"></div>
                </div>
                <div class="form-group text-center">
                    <button type="button" id="changeBtn">정보 수정</button>
                    <button type="button" id="mvlogoutBtn">로그아웃</button>
                    <button type="button" id="mvdeleteBtn">회원탈퇴</button>
                </div>
                </div>
            </form>
        </div>
    </div>

</c:if>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>