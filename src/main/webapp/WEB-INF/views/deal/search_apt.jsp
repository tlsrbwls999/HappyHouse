<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Happy House</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="../favicon.ico">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/apt.css">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/icon.png" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />



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


	<section id="index_section">
		<div class="card col-sm-12 mt-1" style="min-height: 850px;">
			<div class="card-body">
				<h1 class="h4 text-gray-900 mb-4 text-center">부동산 거래내역 조회하기</h1>
				<div class="text-center">
                   	<input type="checkbox" id="checkbox_store">
                   	<label class="" for="checkbox_store">주변 상권</label>
                   	<input type="checkbox" id="checkbox_cctv">
                   	<label class="" for="checkbox_cctv">CCTV 설치 현황</label>
                   	<input type="checkbox" id="checkbox_green">
                   	<label class="" for="checkbox_green">주변 공원</label>
                </div>
			
				<div class="form-group form-inline justify-content-center">
					<div id="star" style="display:none">
						★
					</div>
					<label class="mr-2" for="sido">시도 : </label> <select
						class="form-control" id="sido">
						<option value="0">선택</option>
					</select> <label class="mr-2 ml-3" for="gugun">구군 : </label> <select
						class="form-control" id="gugun">
						<option value="0">선택</option>
					</select> <label class="mr-2 ml-3" for="dong">읍면동 : </label> <select
						class="form-control" id="dong">
						<option value="0">선택</option>
					</select>
					<div style="margin: 50px">
						<input type="text" class="form-control border-1 small" placeholder="아파트 이름" id="aptSearchTextBox" aria-label="Search" aria-describedby="basic-addon2">
						<button class="btn btn-primary" type="button" id="aptSearchBtn">검색</button>
					</div>
					<div style="margin: 5px">
						<button class="btn btn-primary" type="button" id="favorite">관심지역 등록</button>
					</div>
				</div>
				<table class="table mt-2">
					<colgroup>
						<col width="100">
						<col width="150">
						<col width="*">
						<col width="120">
						<col width="120">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>아파트이름</th>
							<th class="text-center">주소</th>
							<th>건축연도</th>
							<th>최근거래금액</th>
						</tr>
					</thead>
					<tbody id="searchResult"></tbody>
				</table>
				<div id="map" style="width: 100%; height: 700px;"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2040668d43252d51988554d3026c8727&libraries=services"></script>
				<script type="text/javascript" src="../js/map.js"></script>
				<script type="text/javascript">
				let colorArr = ['table-primary','table-success','table-danger'];
				$(document).ready(function(){	
					if(location.href.indexOf('dongcode') != -1){
						var dongcode = location.href.substr(location.href.lastIndexOf('=') + 1);
						console.log(dongcode);
						$.get(root + "apt"
								,{dong: dongcode}
								,function(data, status){
									$("tbody").empty();
									$.each(data, function(index, vo) {
										let str = 
											"<tr class="+colorArr[index%3]+">"+
											"<td>"+(index+1)+"</td>"+
											"<td>"+vo.aptName+"</td>"+
											"<td>"+vo.sidoName+" "+vo.gugunName+" "+vo.dongName+" "+vo.jibun+"</td>"+
											"<td>"+vo.buildYear+"</td>"+
											"<td>"+vo.recentPrice+"</td>"+
										"<tr>";
										$("tbody").append(str);
									});
									displayMarkers(data);
								}
								, "json"
						);
					}
					
					//console.log("ready");
					$.get(root + "sido"
						,function(data, status){
							$.each(data, function(index, vo) {
								$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
							});
						}
						, "json"
					);
				});
				$(document).on("change", "#sido", function() {
					$.get(root + "gugun"
							,{sido: $("#sido").val()}
							,function(data, status){
								$("#gugun").empty();
								$("#gugun").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#gugun", function() {
					$.get(root + "dong"
							,{gugun: $("#gugun").val()}
							,function(data, status){
								$("#dong").empty();
								$("#dong").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#dong").append("<option value='"+vo.dongCode+"'>"+vo.dongName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#dong, #checkbox_store, #checkbox_cctv, #checkbox_green" ,function() {
					$.get(root + "apt"
							,{dong: $("#dong").val()}
							,function(data, status){
								$("tbody").empty();
								$.each(data, function(index, vo) {
									let str = 
										"<tr class="+colorArr[index%3]+">"+
										"<td>"+(index+1)+"</td>"+
										"<td>"+vo.aptName+"</td>"+
										"<td>"+vo.sidoName+" "+vo.gugunName+" "+vo.dongName+" "+vo.jibun+"</td>"+
										"<td>"+vo.buildYear+"</td>"+
										"<td>"+vo.recentPrice+"</td>"+
									"<tr>";
									/*
									let str = `
										<tr class="${colorArr[index%3]}">
										<td>${vo.aptCode}</td>
										<td>${vo.aptName}</td>
										<td>${vo.sidoName} ${vo.gugunName} ${vo.dongName} ${vo.jibun}</td>
										<td>${vo.buildYear}</td>
										<td>${vo.recentPrice}</td>
									`;
									*/
									$("tbody").append(str);
								});
								
								displayMarkers(data);
								
								if($("#dong").val() != 0){
									if($("#checkbox_store").is(":checked"))
											displayMarkers_store($("#dong").val());
									
									if($("#checkbox_cctv").is(":checked"))
											displayMarkers_cctv($("#gugun option:selected").text());
									
									if($("#checkbox_green").is(":checked"))
											displayMarkers_green();
								}
								else {
									alert("동으로 검색할 시 주변 정보 조회가 가능합니다.");
									location.reload();
								}
							}
							, "json"
					);
				});
				
				
				
				$(document).on("click", "#aptSearchBtn", function() {
					$.get(root + "aptname"
							,{aptname: $("#aptSearchTextBox").val()}).done(
							function(data, status){
								$("tbody").empty();
								$.each(data, function(index, vo) {
									let str = 
										"<tr class="+colorArr[index%3]+">"+
										"<td>"+(index+1)+"</td>"+
										"<td>"+vo.aptName+"</td>"+
										"<td>"+vo.sidoName+" "+vo.gugunName+" "+vo.dongName+" "+vo.jibun+"</td>"+
										"<td>"+vo.buildYear+"</td>"+
										"<td>"+vo.recentPrice+"</td>"+
									"<tr>";
									$("tbody").append(str);
								});
								displayMarkers(data);
								
								if($("#checkbox_store").is(":checked"))
									displayMarkers_store($("#dong").val());
								if($("#checkbox_cctv").is(":checked"))
									displayMarkers_cctv($("#gugun option:selected").text());
								if($("#checkbox_green").is(":checked"))
									displayMarkers_green();
							}
							, "json")
				});

				$(document).on("click","#favorite",function(){
					$.post(root+"favorite",
							{sido:$("#sido").val(),
							gugun:$("#gugun").val(),
							dong:$("#dong").val()}).done(
							function(data,status){
								$.each(data,function(index,item){
									if(item.sido==$("#sido").val()&&item.gugun==$("#gugun").val()&&item.dong==$("#dong").val()){
										jQuery("#star").removeAttr('style');
										alert("등록되었습니다");
									}
								});
							}
						)
				});
				</script>
			</div>
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
</body>
