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
    <script type="text/javascript">
      $(document).ready(function () {
        // $("#search_apt_btn").on("click", function () {
        //   console.log("hello");
        //   location.replace("./search_apt.html");
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
    <header class="masthead">
      <div class="container position-relative">
        <div class="row justify-content-center">
          <div class="col-xl-6">
            <div class="text-center text-white">
              <!-- Page heading-->
              <h1 class="mb-5">해피하우스에서 행복의 보금자리를 찾아보세요!</h1>
              <!-- Signup form-->
              <!-- * * * * * * * * * * * * * * *-->
              <!-- * * SB Forms Contact Form * *-->
              <!-- * * * * * * * * * * * * * * *-->
              <!-- This form is pre-integrated with SB Forms.-->
              <!-- To make this form functional, sign up at-->
              <!-- https://startbootstrap.com/solution/contact-forms-->
              <!-- to get an API token!-->
              <form
                class="form-subscribe"
                id="contactForm"
                data-sb-form-api-token="API_TOKEN"
              >
              <br>
                <c:if test="${empty userInfo}">
        	<h4>로그인 후 이용해주세요.</h4>
		</c:if>
		<c:if test="${!empty userInfo}">
			<h4><strong>${userInfo.name}(${userInfo.id})</strong>님 안녕하세요</h4>
		</c:if>	
                <!-- Submit success message-->
                <!---->
                <!-- This is what your users will see when the form-->
                <!-- has successfully submitted-->
                <div class="d-none" id="submitSuccessMessage">
                  <div class="text-center mb-3">
                    <div class="fw-bolder">Form submission successful!</div>
                    <p>To activate this form, sign up at</p>
                    <a
                      class="text-white"
                      href="https://startbootstrap.com/solution/contact-forms"
                      >https://startbootstrap.com/solution/contact-forms</a
                    >
                  </div>
                </div>
                <!-- Submit error message-->
                <!---->
                <!-- This is what your users will see when there is-->
                <!-- an error submitting the form-->
                <div class="d-none" id="submitErrorMessage">
                  <div class="text-center text-danger mb-3">
                    Error sending message!
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- Icons Grid-->
    <section class="features-icons bg-light text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-3 hover_pointer hover_dark"
            onclick="location.href='${root}/deal/search_apt'">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="bi-file-earmark-ruled m-auto text-primary"></i>
              </div>
              <h3>거래내역 조회</h3>
              <p class="lead mb-0">부동산 거래내역을 조회해드립니다</p>
            </div>
          </div>
          <div class="col-lg-3 hover_pointer hover_dark"
          onclick="location.href='${root}/dashboard'">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="bi-ui-radios m-auto text-primary"></i>
              </div>
              <h3>거래가 분석</h3>
              <p class="lead mb-0">부동산 거래 통계를 정리해 보여드립니다.</p>
            </div>
          </div>
          <div class="col-lg-3 hover_pointer hover_dark"
          onclick="location.href='${root}/newsBoard'">
            <div class="features-icons-item mx-auto mb-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="bi bi-newspaper m-auto text-primary"></i>
              </div>
              <h3>부동산 뉴스</h3>
              <p class="lead mb-0">부동산과 관련된 최신 소식을 전해드립니다</p>
            </div>
          </div>
          <div class="col-lg-3 hover_pointer hover_dark"
          onclick="location.href='${root}/vueboard'">
            <div class="features-icons-item mx-auto mb-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="bi-clipboard m-auto text-primary"></i>
              </div>
              <h3>Q&A</h3>
              <p class="lead mb-0">사이트 이용 관련 질문을 할 수 있습니다</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Image Showcases-->
    <section class="showcase">
      <div class="container-fluid p-0">
        <div class="row g-0 hover_dark">
          <div
            class="col-lg-6 order-lg-2 text-white showcase-img"
            style="background-image: url('assets/img/bg-showcase-1.jpg')"
          ></div>
          <div class="col-lg-6 order-lg-1 my-auto showcase-text">
            <h2>간편한 위치 검색</h2>
            <p class="lead mb-0">
              서울의 면적은 605.2 km2로, 이 넓은 지역을 스스로 탐방하는 것은
              결코 쉬운 일이 아닐 것입니다. 그러나 걱정하지 마세요! 상세 주소를
              선택해주시면, Happy Home이 해당 지역의 위치를 자동으로 검색해
              드립니다.
            </p>
          </div>
        </div>
        <div class="row g-0 hover_dark">
          <div
            class="col-lg-6 text-white showcase-img"
            style="background-image: url('assets/img/bg-showcase-2.jpg')"
          ></div>
          <div class="col-lg-6 my-auto showcase-text">
            <h2>최근 거래금액을 한눈에 파악</h2>
            <p class="lead mb-0">
              Happy House은 사용자가 선택한 아파트의 최근 거래 내역들을
              제공합니다. 최근 거래금액이 어떻게 형성되어 있는지 직접
              확인하세요!
            </p>
          </div>
        </div>
        <div class="row g-0 hover_dark">
          <div
            class="col-lg-6 order-lg-2 text-white showcase-img"
            style="background-image: url('assets/img/bg-showcase-3.jpg')"
          ></div>
          <div class="col-lg-6 order-lg-1 my-auto showcase-text">
            <h2>부동산 정보까지 빠르게</h2>
            <p class="lead mb-0">
              최근의 부동산 트렌드는 매우 빠르게 변화하고 있으며, 이를 따라가는
              것은 매우 힘든 일입니다. Happy House은 현재 일어나는 부동산에
              관련된 뉴스들을 제공하여, 고객 여러분들께 지식 제공에 힘쓰고
              있습니다.
            </p>
          </div>
        </div>
        <div class="row g-0 hover_dark">
          <div
            class="col-lg-6 text-white showcase-img"
            style="background-image: url('assets/img/bg-showcase-4.jpg')"
          ></div>
          <div class="col-lg-6 my-auto showcase-text">
            <h2>시대는 빠르게 변화하므로</h2>
            <p class="lead mb-0">
              	바쁜 일상 속에서 보다 효율적인 정보 수집을 할 수 있도록,
            	Happy House에서는 부동산 거래가 분석 정보를 보기 좋게
            	정리해 보여드립니다.
            </p>
          </div>
        </div>
      </div>
    </section>
    <!-- Testimonials-->
    <section class="testimonials text-center bg-light">
      <div class="container">
        <h2 class="mb-5">사용자 후기</h2>
        <div class="row">
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img
                class="img-fluid rounded-circle mb-3"
                src="assets/img/testimonials-1.jpg"
                alt="..."
              />
              <h5>Margaret E.</h5>
              <p class="font-weight-light mb-0">
                "해피하우스 덕에 싸고 좋은 집으로 이사왔어요!"
              </p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img
                class="img-fluid rounded-circle mb-3"
                src="assets/img/testimonials-2.jpg"
                alt="..."
              />
              <h5>Fred S.</h5>
              <p class="font-weight-light mb-0">"해피하우스 최고"</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img
                class="img-fluid rounded-circle mb-3"
                src="assets/img/testimonials-3.jpg"
                alt="..."
              />
              <h5>Sarah W.</h5>
              <p class="font-weight-light mb-0">"한번 써보세요!"</p>
            </div>
          </div>
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
