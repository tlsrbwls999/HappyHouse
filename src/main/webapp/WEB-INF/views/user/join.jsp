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
        	// 아이디 중복검사
        	$("#userid").keyup(function () {
        		var ckid = $("#userid").val();
        		$.ajax({
	                	url: '${root}/user/idcheck',
	                	data: {'act': 'idcheck', 'ckid': ckid},
	                  	type: 'GET',
	                  	dataType: 'JSON',
	                  	success: function (response) {
	                  		console.log(response);
	                    	const cnt = response.idcount;
	                    	console.log(cnt);
	                    	if(cnt == 0) {
	                    		$("#idresult").text("사용가능한 아이디입니다.").removeClass('text-dark').removeClass('text-danger').addClass('text-primary');
	                    		isId = true;
	                    	} else {
	                    		$("#idresult").text("이미 등록된 아이디입니다.").removeClass('text-dark').removeClass('text-primary').addClass('text-danger');
	                    		isId = false;
	                    	}
	                  	}
					});
			});
        	
        	// 회원가입
            $("#registerBtn").click(function () {
                if (!$("#username").val()) {
                    alert("이름 입력!!!");
                    return;
                } else if (!isId) {
                    alert("아이디 확인!!!");
                    return;
                } else if (!$("#userpwd").val()) {
                    alert("비밀번호 입력!!!");
                    return;
                } else {
                	alert("회원가입을 진행합니다. 회원가입이 성공적으로 진행되면 로그인 화면으로 넘어가게 됩니다.");
                    $("#memberform").attr("action", "${root}/user/register").submit();
                }
            });

            // $('#zipcode').focusin(function () {
            //     $('#zipModal').modal();
            // });
        });
    </script>
</head>
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
        <div class="login-page">
            <h2>회원가입</h2>
            <form id="memberform" class="text-left mb-3" method="post" action="">
                <input type="hidden" name="act" id="act" value="register">
                <div class="form">
                <div class="form-group">
                    <label for="username">이름을 입력하세요.</label>
                    <input type="text" class="form-control" id="username" name="name" placeholder="name">
                </div>
                <div class="form-group">
                    <label for="userid">아이디를 입력하세요.</label>
                    <input type="text" class="form-control" id="userid" name="id" placeholder="ID">
                    <div id="idresult" class="mt-1"></div>
                </div>
                <div class="form-group">
                    <label for="userpwd">비밀번호를 입력하세요.</label>
                    <input type="password" class="form-control" id="userpwd" name="password" placeholder="password">
                </div>
                <div class="form-group">
                    <label for="emailid">이메일을 입력하세요.</label><br>
                    <div id="email" class="custom-control-inline">
                        <input type="text" class="form-control" id="emailid" name="email" placeholder="email"
                            size="25"> @
                        <select class="form-control" id="emaildomain" name="emaildomain">
                            <option value="ssafy.com">ssafy.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="kakao.com">kakao.com</option>
                            <option value="google.com">google.com</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="userid">나이를 입력하세요.</label>
                    <input type="text" class="form-control" id="userAge" name="age" placeholder="age">
                    <div id="idresult" class="mt-1"></div>
                </div>
                <div class="form-group text-center">
                    <button type="button" id="registerBtn">회원가입</button>
                    <button type="reset">초기화</button>
                </div>
                </div>
            </form>
        </div>
    </div>

<%@ include file="/WEB-INF/views//template/footer.jsp" %>
