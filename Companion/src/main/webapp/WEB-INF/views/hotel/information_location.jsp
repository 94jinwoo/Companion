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
	<link rel="stylesheet" href="${root}css/hotel/infoLoc.css">
	<!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

	<title>컴패니언::Companion::위치정보</title>
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
								<a class="nav-link" href="${root }hotel/infocare">돌보미정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link active" href="${root }hotel/infoloc">위치정보</a>
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
                   <i class="fas fa-map-marker-alt"></i>
                    위치정보
                </a>
                <hr class="mb-4">
            </div>
		    <!-- section start -->
			<section class="section">
				<!-- main title -->
				<div class="main--title">
						<h1>위치 정보</h1>
                </div>
                <div class="hotelLoc mx-auto" id="map">
                </div>
                                
                <!-- 운영시간 안내 -->
                <div class="useinfo row">
                    <div class="icon"><img src="${root}imgs/infoloc.png" alt="time"></div>
                    <div>
                        <h2 class="sub--title">오시는 길</h2>
                        <h3 class="third--title">컴패니언 위치</h3>
                    </div>
               
                    <table class="table">
                        <tr>
                            <td>
                            <i class="fas fa-map-marker-alt"></i>
                            서울특별시 서초구 강남대로 459 (서초동, 백암빌딩) 3층
							<br/><br/>
                            대표전화 : 02-3486-9600
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <i class="fas fa-subway"></i>
                            지하철 이용 시
							<br/>
                            (신논현역) 9호선 6번출구 – 강남역 방향 도보 3분<br/>
							(강남역) 2호선 10번출구 – 신논현역 방향 도보 7분
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <i class="fas fa-bus"></i>
                            버스 이용 시
							<br/>                            
                            (하차) 신논현역,구교보타워사거리/ 신논현역,씨티은행
                            </td>
                        </tr>
                        
                    </table>
                </div>  
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
<!-- KAKAO MAP API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fc9be5e3e3a09fa3182e27df9a35a1a6&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
	var container  = document.getElementById('map'); // 지도를 표시할 div
	var options = {
		center : new kakao.maps.LatLng(37.503268, 127.024286), // 지도의 중심좌표(WGS84 좌표계)
		level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다.
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다.
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TORIGHT는 오른쪽 위를 의미합니다.
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TORIGHT);
	
	// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다.
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	// 마커가 표시될 위치입니다.
	var markerPosition  = new kakao.maps.LatLng(37.503268, 127.024286);
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 인포윈도우 표시 위치입니다
	// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	var iwContent = '<div id="mapinfo">'+
	'<div class="map-header">'+
	'컴패니언::Comapnion</div>'+
	'<div class="map-section">'+
	'서울 서초구 강남대로 459 백암빌딩 구관<br/>(우) 06611(지번) 서초동 1303-34</div>'+
	'<div class="map-toolbar clearfix">'+
	'<a href="https://map.kakao.com/link/map/Companion,37.503268, 127.024286" class="map-button" target="_blank">큰지도보기</a>'+
	'<a href="https://map.kakao.com/link/to/Companion,37.503268, 127.024286" class="map-button" target="_blank">길찾기</a></div>'+
	'</div>',
    iwPosition = new kakao.maps.LatLng(37.503268, 127.024286);
	
 // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        position : iwPosition, 
        content : iwContent 
    });
 
 // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
    infowindow.open(map, marker);
</script>
</body>
</html>