<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<!-- jQuery-UI -->
	<link rel="stylesheet" href="${root }css/jquery-ui.css">
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="${root}css/bootstrap/bootstrap.css">
	<!-- Our Custom CSS -->
	<link rel="stylesheet" href="${root}css/main.css">
	<link rel="stylesheet" href="${root}css/hotel/infoCare.css">
	<!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

	<title>컴패니언::Companion::돌보미정보</title>
</head>
<body>
<!-- .wrapper start  -->
<div class="wrapper">
	<!-- Sidebar -->
	<jsp:include page="../common/sidebar.jsp"/>
	<!-- #content start -->
	<div id="content">
		<!-- #container start -->
		<div id="container">
			<!-- nav start -->
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<!-- .container-fluid start -->
			    <div class="container-fluid">
					<!-- menu toggle button start -->
			        <button type="button" id="sidebarCollapse" class="btn btn-info">
			            <i class="fas fa-align-left"></i>
			            <span>메뉴</span>
			        </button>
			        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
			            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
			            aria-expanded="false" aria-label="Toggle navigation">
			            <i class="fas fa-align-justify"></i>
			        </button>
			        <!-- menu toggle button end -->
			        <!-- top menu bar start -->
			         <div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="nav navbar-nav ml-auto">
							<li class="nav-item">
								<a class="nav-link" href="${root }hotel/infouse">이용안내</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${root }hotel/reservation">예약하기</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${root }hotel/preroom">룸미리보기</a>
							</li>
							<li class="nav-item">
								<a class="nav-link active" href="${root }hotel/infocare">돌보미정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${root }hotel/infoloc">위치정보</a>
							</li>
						</ul>
			        </div>
			        <!-- top menu bar end -->
			    </div>
			    <!-- .container-fluid end -->
			</nav>
		    <!-- nav end -->
		    <div class="categories">
                <a href="#homeSubmenu">
                    <i class="fas fa-building"></i>
                    호텔서비스
                </a>
                <span>></span>
                <a href="#">
                    <i class="fas fa-user-md"></i>
                    돌보미정보
                </a>
                <hr class="mb-4">
            </div>
		    <!-- section start -->
			<section class="section">
				<div class="main--title">
						<h1>다년간의 경험과 노하우를 보유한<br/>국내 최고의 반려견 전문가들이 함께 합니다.</h1>
                </div>
				<!-- .boxing start -->
				<div class="boxing clearfix">
					<div class="pic float--left">
						<img src="../imgs/doctor1.png" alt="doctorimg">
					</div>
					<div class="descrip-group float--right">
						<ul class="descrip">
							<li><h2 id="name">김박사</h2></li>
							<li><span>한국 서울대학교 수의대 졸업</span></li>
							<li><span>동대학수의대 동물복지 및 동물행동학 박사 취득</span></li>
							<li><span>유럽동물자연보호협회 동물보호소 임상 수의사</span></li>
							<li><span>서울대 수의대 겸임교수</span></li>
							<li><span>대한수의사회 동물복지위원회 위원</span></li>
							<li><span>애견 종합 관리사 - 한국애견협회</span></li>
							<li><span>독 아로마테라피스트 마스터 - 한국펫산업학회장</span></li>
						</ul>
					</div>
				</div>
				<!-- .boxing end -->
				<!-- .boxing start -->
				<div class="boxing clearfix">
					<div class="pic float--left">
						<img src="../imgs/doctor3.png" alt="doctorimg">
					</div>
					<div class="descrip-group float--right">
						<ul class="descrip">
							<li><h2 id="name">이슬이</h2></li>
							<li><span>한국 서울대학교 수의학과 졸업</span></li>
							<li><span>동대학수의대 동물복지 및 동물행동학 박사 취득</span></li>
							<li><span>유럽동물자연보호협회 동물보호소 임상 수의사</span></li>
							<li><span>서울대 수의대 겸임교수</span></li>
							<li><span>대한수의사회 동물복지위원회 이사</span></li>
							<li><span>애견 종합 관리사 - 한국애견협회</span></li>
							<li><span>애견 훈련사 마스터 - 한국펫산업학회임원</span></li>
						</ul>
					</div>
				</div>
				<!-- .boxing end -->
				<!-- .boxing start -->
				<div class="boxing clearfix">
					<div class="pic float--left">
						<img src="../imgs/doctor2.png" alt="doctorimg">
					</div>
					<div class="descrip-group float--right">
						<ul class="descrip">
							<li><h2 id="name">최지우</h2></li>
							<li><span>한국 건국대학교 수의학과 졸업</span></li>
							<li><span>동대학수의대 동물복지 및 동물행동학 박사 취득</span></li>
							<li><span>유럽동물자연보호협회 동물보호소 임상 수의사</span></li>
							<li><span>서울대 수의대 겸임교수</span></li>
							<li><span>대한수의사회 동물복지위원회 위원</span></li>
							<li><span>애견 종합 관리사 - 한국애견협회</span></li>
							<li><span>독 힐링테라피스트 마스터 - 한국펫산업학회장</span></li>
						</ul>
					</div>
				</div>
				<!-- .boxing end -->
			</section>
			<!-- section end -->
		</div>
		<!-- #container end -->
		<!-- Footer  -->
			<jsp:include page="../common/footer.jsp"/>
		<!-- Footer end -->
	</div>
	<!-- #content end -->
</div>
<!-- .wrapper end  -->
<!-- jQuery -->
<script src="${root}js/jquery-1.12.4.js"></script>
<!-- jQuery-UI -->
<script src="${root }js/jquery-ui.js"></script>
<!-- Popper.JS -->
<script src="${root}js/bootstrap/popper.js"></script>
<!-- Bootstrap JS -->
<script src="${root}js/bootstrap/bootstrap.js"></script>
<!-- MAIN JS -->
<script src="${root }js/main.js"></script>


</body>
</html>