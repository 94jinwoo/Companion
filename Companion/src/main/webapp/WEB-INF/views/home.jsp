<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="root"></c:url>
<% System.out.println(request.getSession().getServletContext().getRealPath("imgUpload")); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Companion::컴패니언</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/main.css">
    <link rel="stylesheet" href="${root }css/home.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
        integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
        crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
        integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
        crossorigin="anonymous"></script>

</head>

<body>

    <div class="wrapper">
        
        <!-- Sidebar  -->
		<jsp:include page="common/sidebar.jsp"/>

        <!-- Page Content  -->
        <div id="content">
            <div id="container">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fas fa-align-left"></i>
                        <span>메뉴</span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>
                    
                     <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <c:choose>
                            <c:when test="${sessionScope.memberVo.member_id==null }">
                                <ul class="nav navbar-nav ml-auto">
                                    <li class="nav-item">
                                        <a class="nav-link" href="${root }login">로그인</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="${root }login/memberadd" >회원가입</a>		
                                    </li>
                                </ul>
                            </c:when>
                            <c:when test="${(sessionScope.memberVo.member_id!=null) && (sessionScope.memberVo.member_grade!=2)  }">
                            	<ul class="nav navbar-nav ml-auto">
	                            	<li class="nav-item">
	                                     <a class="nav-link" href="${root }admin/admin_home">관리자</a>
	                                </li>
	                                <li class="nav-item">
	                                    <a class="nav-link" href="${root }logout">로그아웃</a>
	                                </li>
                            	</ul>     
                            </c:when>
                            <c:otherwise>
                                <ul class="nav navbar-nav ml-auto">
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypurchaselist">주문내역</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagereserve">예약조회</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mycart">장바구니</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagequestion">문의조회</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagechk">마이페이지</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }logout">로그아웃</a>
	                                    </li>
	                                </ul>
                            </c:otherwise>
                            
                        </c:choose>
                    </div>
                </div>
            </nav>
        
        
            <div class="maincontent">
                <!--carousel-->
                <div class="row">
                    <!-- 쇼핑몰 이동하는 캐러셀 485 x 560-->
                    <div class="col-md-6">
                        <div class="carosel">
                            <div id="carouselExampleCaptions1" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a href="${root }order/productMain?category_id=100">
                                            <img src="${root }imgs/shopping/shop01.jpg" class="d-block w-100" alt="...">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a href="${root }order/productMain?c=200&num=1">
                                            <img src="${root }imgs/shopping/shop02.jpg" class="d-block w-100" alt="...">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a href="${root }order/productMain?c=700&num=1">
                                            <img src="${root }imgs/shopping/shop03.jpg" class="d-block w-100" alt="...">
                                        </a>
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleCaptions1" role="button"
                                    data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleCaptions1" role="button"
                                    data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- 호텔서비스로 이동하는 캐러셀 485 x 560-->
                    <div class="col-md-6">
                        <div class="carosel">
                            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a href="${root }hotel/infouse">
                                            <img src="${root }imgs/hotel/hotel01.jpg" class="d-block w-100" alt="...">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a href="${root }hotel/infouse">
                                            <img src="${root }imgs/hotel/hotel02.jpg" class="d-block w-100" alt="...">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a href="${root }hotel/infouse">
                                            <img src="${root }imgs/hotel/hotel03.jpg" class="d-block w-100" alt="...">
                                        </a>
                                    </div>
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button"
                                    data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#carouselExampleCaptions" role="button"
                                    data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- test carousel end-->
                <!-- test main content start-->
                <div class="row mb-2">
                    <div class="col-md-6">
                        <div class="jumbotron text-gray rounded">
                            <div class="col-md-12 px-0">
                                <h1 class="display-4">최상의 품질 보장<br>간식 & 애완용품</h1>
                                <p class="lead my-3">신성한 사료&간식 유통기한100%책임제<br>
                                	매일매일 찾아오는 신상용품을 만나보세요 
                                </p>
                                <p class="lead mb-0"><a href="/companion/order/productMain?category_id=100&sort=date" class="text-gray font-weight-bold">쇼핑몰 바로가기 ></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="jumbotron text-gray rounded">
                            <div class="col-md-12 px-0">
                                <h1 class="display-4">최고의 힐링 공간<br>호텔&nbsp;& 데이케어</h1>
                                <p class="lead my-3">24시간 전문가 상주로 안심하고 맡길 수 있습니다.<br>
                                	매일 수의사 회진으로 일상 건강 관리가 가능합니다.
                                </p>
                                <p class="lead mb-0"><a href="${root }hotel/reservation" class="text-gray font-weight-bold">호텔예약 바로가기 ></a></p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 여여여 -->
                <!-- <div class="row mb-2">
                    <div class="col-md-6">
                        <div
                            class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                            <div class="col p-4 d-flex flex-column position-static">
                                <strong class="d-inline-block mb-2 text-primary">쇼핑몰 이용후기</strong>
                                <h3 class="mb-0">최고의 간식!</h3>
                                <div class="mb-1 text-muted">★★★★★</div>
                                <p class="card-text mb-auto">This is a wider card with supporting text below as a
                                    natural
                                    lead-in to
                                    additional content.</p>
                                <a href="#" class="stretched-link font-weight-bold">더 많은 후기보기 ></a>
                            </div>
                            <div class="col-auto d-none d-lg-block">
                                <svg class="bd-placeholder-img" width="180" height="250"
                                    xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice"
                                    focusable="false" role="img" aria-label="Placeholder: Thumbnail">
                                    <title>Placeholder</title>
                                    <rect width="100%" height="100%" fill="#55595c" /><text x="35%" y="50%"
                                        fill="#eceeef" dy=".3em">후기 사진</text>
                                </svg>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div
                            class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                            <div class="col p-4 d-flex flex-column position-static">
                                <strong class="d-inline-block mb-2 text-success">호텔 이용후기</strong>
                                <h3 class="mb-0">재이용 의사 100%</h3>
                                <div class="mb-1 text-muted">★★★★★</div>
                                <p class="mb-auto">This is a wider card with supporting text below as a natural lead-in
                                    to
                                    additional content.</p>
                                <a href="#" class="stretched-link font-weight-bold">더 많은 후기보기 ></a>
                            </div>
                            <div class="col-auto d-none d-lg-block">
                                <svg class="bd-placeholder-img" width="180" height="250"
                                    xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice"
                                    focusable="false" role="img" aria-label="Placeholder: Thumbnail">
                                    <title>Placeholder</title>
                                    <rect width="100%" height="100%" fill="#55595c" /><text x="35%" y="50%"
                                        fill="#eceeef" dy=".3em">후기 사진</text>
                                </svg>
                            </div>
                        </div>
                    </div>
                </div> -->
                <!-- 여여여 -->
            </div>
        </div>
		<!-- Footer  -->
		<jsp:include page="common/footer.jsp"/>
        
        
        </div>
    

    </div>

    <!-- jQuery -->
    <script src="${root }js/jquery-1.12.4.js"></script>
    <!-- Popper.JS -->
    <script src="${root }js/bootstrap/popper.js"></script>
    <!-- Bootstrap JS -->
    <script src="${root }js/bootstrap/bootstrap.js"></script>
    <!-- MAIN JS -->
    <script src="${root }js/main.js"></script>

</body>

</html>