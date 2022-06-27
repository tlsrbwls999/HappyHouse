<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
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
<link rel="stylesheet" href="./css/apt.css">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/icon.png" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./css/styles.css" rel="stylesheet" />

<style type="text/css">
	mark:hover   { text-decoration:underline; color:#FACC2E; font-weight: bold; font-size: large; }
</style>

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



	<!-- header -->

	<header class="dashboard">
      <div class="container position-relative"> 
        <div class="row justify-content-center">
          <div class="col-xl-8">
            <div class="text-center text-white">
              <!-- Page heading-->
              <h1 class="mb-5">부동산 거래 통계를 한눈에 파악하세요!</h1>
            </div>
          </div>
        </div>
      </div>
    </header>


	<!-- Main -->
	
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<div class="container text-center mt-5" style="max-width: 1600px;">
		<div class="col-xl-auto mx-auto">

			<!-- Content Row -->
	
	        <div class="row">
	
	            <!-- LEFT -->
	            <div class="col-xl-5 col-lg-auto">
	            
		            <div class="container text-center mb-5" style="background-color: #eaecf4; height:160px">
			            <h2 class="mb-3" style="text-align: center; padding-top: 35px;">현재 서울 평균 집값:</h2>
			            <h2 class="mt-3 mb-3" style="text-align: center" id="allaver"></h2>
		            </div>
		            <script>document.getElementById("allaver").innerText = Math.floor(${allaver}/10000)+"억 "+${allaver}%10000+"만원";</script>
	                <div class="card shadow mb-4">
	
	                    <!-- Card Header -->
	                    <div
	                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                        <h6 class="m-0 font-weight-bold text-primary">서울 평균 집값 추이</h6>
	                    </div>
	                    <!-- Card Body -->
	                    <div class="card-body">
	                        <div class="chart-area">
	                            <canvas id="averchange"></canvas>
	                        </div>
	                    </div>
	                </div>
	                
	            	<div>
	                	<img class= "img img-fluid mt-5 mb-5"  alt="roomimage" src="./assets/img/image1-dashboard.jpg">
	                </div>
	            </div>

	            <!-- RIGHT -->
	            <div class="col-xl-7 col-lg-auto">
	                <h2 style="text-align: center">지역별 평균 집값</h2>
	                <div class="card shadow mb-4">
	                    <!-- Card Header -->
	                    <div
	                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
	                        <h6 class="m-0 font-weight-bold text-primary">구군별 집값</h6>
	                    </div>
	                    <!-- Card Body -->
	                    <div class="card-body">
	                        <div class="chart-pie pt-4 pb-2">
	                            <canvas id="avergugun"></canvas>
	                        </div>
	                    </div>
	                </div>
	                
	                <!-- rank lists -->
	                <div class="row mt-5">
	                	<div class="col-xl-6 col-lg-auto mb-5">
	                		<h3>평균 집값이 높은 지역 순위</h3>
	                		<div id="rankaver"></div>
	                	</div>
	                
	                    <div class="col-xl-6 col-lg-auto mb-5">
	                		<h3>면적 대비 집값이 높은 지역 순위</h3>
	                		<div id="rankarea"></div>
	                		
	                	</div>
	                </div>
	            </div>
	            
	            
	        </div>
	<!-- row end -->

		</div>
	</div>

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

<!-- 서울 평균 집값 추이 -->
<script>
var ctx = document.getElementById("averchange");

var data = {
  labels: ['1월', '2월', '3월','4월', '5월', '6월','7월', '8월', '9월','10월', '11월', '12월'],
  datasets: [{
    label: '실거래가',
    data: ${averchange},
    fill: false,
    borderColor: 'rgb(75, 192, 192)',
    tension: 0.1
  }]
};
var config = {
		  type: 'line',
		  data: data,
};
var averchange = new Chart(ctx, {
    type: 'line',
    data: data,
    options: {
        scales: {
            y: {
                stacked: true
            }
        }
    }
});
</script>

<!-- 서울 평균 집값 추이 -->
<script>
var ctx = document.getElementById("avergugun");

var data = {
		  labels: ${avergugun_key},
		  datasets: [{
		    label: '실거래가',
		    data: ${avergugun_data},
		    backgroundColor: [
		        'rgba(255, 99, 132, 0.2)',
		        'rgba(255, 159, 64, 0.2)',
		        'rgba(255, 205, 86, 0.2)',
		        'rgba(75, 192, 192, 0.2)',
		        'rgba(54, 162, 235, 0.2)',
		        'rgba(153, 102, 255, 0.2)',
		        'rgba(201, 203, 207, 0.2)'
		      ],
		      borderColor: [
		        'rgb(255, 99, 132)',
		        'rgb(255, 159, 64)',
		        'rgb(255, 205, 86)',
		        'rgb(75, 192, 192)',
		        'rgb(54, 162, 235)',
		        'rgb(153, 102, 255)',
		        'rgb(201, 203, 207)'
		      ],
		      borderWidth: 1
		  }]
		};
var config = {
		  type: 'bar',
		  data: data,
		  options: {
		    scales: {
		      y: {
		        beginAtZero: true
		      }
		    }
		  },
		};
var stackedBar = new Chart(ctx, {
    type: 'bar',
    data: data,
    options: {
        scales: {
            x: {
                stacked: true
            },
            y: {
                stacked: true
            }
        }
    }
});
 
</script>
<script>
var frac1 = document.createDocumentFragment();
var rankaver_key = ${rankaver_key};
var rankaver_code = ${rankaver_code};
var rankaver_data = ${rankaver_data};
for(var i = 0; i < 20; i++){
	var spanElement = document.createElement("mark");
	frac1.appendChild(spanElement).className='list-inline-item';
	spanElement.textContent = (i+1)+"위  "+rankaver_key[i]+" ("+rankaver_data[i]+"만원)";
	spanElement.setAttribute('value', rankaver_code[i]);
	spanElement.setAttribute('onclick', 'donglink('+rankaver_code[i]+')');
	frac1.appendChild(document.createElement("br"));
}
document.getElementById("rankaver").appendChild(frac1);



var frac2 = document.createDocumentFragment();
var rankarea_key = ${rankarea_key};
var rankarea_code = ${rankarea_code};
var rankarea_data = ${rankarea_data};
for(var i = 0; i < 20; i++){
	var spanElement = document.createElement("mark");
	frac2.appendChild(spanElement).className='list-inline-item';
	spanElement.textContent = (i+1)+"위 "+rankarea_key[i]+" ("+rankarea_data[i]+"만원)";
	spanElement.setAttribute('value', rankarea_code[i]);
	spanElement.setAttribute('onclick', 'donglink('+rankarea_code[i]+')');
	frac2.appendChild(document.createElement("br"));
}
document.getElementById("rankarea").appendChild(frac2);



// 이동 이벤트
function donglink(dongcode) {
	console.log(dongcode);
	window.location.href = '/happyhouse/deal/search_apt?dongcode='+dongcode;
}
</script>