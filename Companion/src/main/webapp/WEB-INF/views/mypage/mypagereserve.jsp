<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>컴패니언::Companion</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/main.css">

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
		<jsp:include page="../common/sidebar.jsp"/>

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
	                                <script>
	                                	window.location.href="login";
	                                </script>
	                            </c:when>
	                            <c:otherwise>
	                                <ul class="nav navbar-nav ml-auto">
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypurchaselist">주문내역</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link active" href="${root }mypagereserve">예약조회</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mycart">장바구니</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagequestion">문의조회</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagechk">나의정보</a>
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
	            <!-- .categories start -->
	            <div class="categories">
                <a href="#homeSubmenu">
                	<i class="fas fa-clipboard"></i>
                    예약조회
                </a>
                <hr class="mb-4">
            	</div>
            	<!-- .categories start -->
	            <!-- section start -->
				<section class="section">
		            <!-- main title -->
					<div class="main--title">
							<h1>나의 예약현황</h1>
	                </div>
	                <c:choose>
	    				<c:when test="${reserveList != null }">
			            	<ul class="list-group list-unstyled components">
								<c:forEach items="${reserveList }" var="bean">
									<ul>
										<li class="list-group-item list-group-item">
											<div class="row">
												<div class="col-2">${bean.service_name }</div>
												<div class="col-4">${bean.reserve_state_name }</div>
												<div class="col-2">예약일자</div>
												<div class="col-2">${bean.reserve_date }</div>
												<div class="col-2">
													<button class="mainBtn" onclick="toggleReserve(${bean.reserve_id })" id="reserveBtn_${bean.reserve_id }">
														내역 상세보기
													</button>
												</div>
											</div>
										</li>
										<ul class="list-group-item list-group-item-secondary list-unstyled" id="${bean.reserve_id }" style="display:none">
											<li class="row">
												<div class="col-2">반려견종</div>
												<div class="col-4">${bean.reserve_dogtype }</div>
												<div class="col-2">반려견나이</div>
												<div class="col-4">${bean.reserve_dogage }</div></br>
												
												<div class="col-2">체크인</div>
												<div class="col-4">${bean.reserve_checkin }</div>
												<div class="col-2">체크아웃</div>
												<div class="col-4">${bean.reserve_checkout }</div></br>
												<div class="col-12">기타</div></br>
												<div class="col-12">${bean.reserve_msg }</div>
											</li>
										</ul>
									</ul>
								</c:forEach>	            
			            	</ul>
	    				</c:when>            
	    				<c:otherwise>
	    					예약하신 사항이 없습니다.
	    				</c:otherwise>
	                </c:choose>
	            </section>
			</div>
			
        <!-- Footer  -->
			<jsp:include page="../common/footer.jsp" />
		<!-- Footer end -->

		</div>
	</div>
	<!-- content -->
	
	<!-- script start -->
	<!-- jQuery -->
    <script src="${root }js/jquery-1.12.4.js"></script>
	<!-- Popper.JS -->
    <script src="${root }js/bootstrap/popper.js"></script>
    <!-- Bootstrap JS -->
    <script src="${root }js/bootstrap/bootstrap.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
        
       function toggleReserve(reserve_id){
        	if($('#'+reserve_id).css("display")=="none"){
        		$('#'+reserve_id).show();
        		$('#reserveBtn_'+reserve_id).text("상세보기 닫기");
        	}else{
        		$('#'+reserve_id).hide();
        		$('#reserveBtn_'+reserve_id).text("내역 상세보기");
        	}
        }
    </script>
    <!-- script end -->

</body>
</html>