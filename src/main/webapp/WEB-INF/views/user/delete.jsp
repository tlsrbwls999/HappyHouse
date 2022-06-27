<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<c:if test="${cookie.loginid.value ne null}">
	<c:set var="svid" value="${cookie.loginid.value}" />
	<c:set var="ckid" value=" checked=\"checked\"" />
</c:if>

<script type="text/javascript">
	$(document).ready(function() {
		$("#deleteBtn").click(function() {
			if (!$("#userpwd").val()) {
				alert("비밀번호 입력!!!");
				return;
			} else {
				alert("회원탈퇴를 진행합니다.");
				$("#loginform").attr("action", "${root}/user").submit();
			}
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
<div class="container">
	<div class="login-page">
		<h2>
			회원탈퇴
		</h2>
		<form id="loginform" class="text-left mb-3" method="post" action="">
			<input type="hidden" name="act" id="act" value="delete">
			<div class="form">
				<label for="userid">아이디를 입력하세요.</label> <input type="text"
					class="login-form" id="userid" name="userid" placeholder="ID"
					 value="${userInfo.userId}">
				<label for="userpwd">비밀번호를 입력하세요.</label> <input type="password"
					class="login-form" id="userpwd" name="userpwd" placeholder="password">
					
				<div class="text-danger mb-2">${msg}</div>
				
				<button type="button" id="deleteBtn">탈퇴하기</button>
				
			</div>
			
		</form>
	</div>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp"%>