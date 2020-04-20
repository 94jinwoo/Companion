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
    <link rel="stylesheet" href="${root }css/mypage/mypurchaselist.css">

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
	                                        <a class="nav-link active" href="${root }mypurchaselist">주문내역</a>
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
	            <div class="categories">
					<a href="${root }mypagechk"> <i class="fas fa-user"></i> 마이페이지</a>
					<span>></span> 
					<a href="#"> <i class="fas fa-clipboard"></i> 주문내역</a>
					<hr class="mb-4">
				</div>	
	            <section class="section">
				<div class="main--title">
					<h1>나의 주문내역</h1>
	       		</div>	
	            	<c:forEach items="${myPurchaseDetail }" var="bean">
					<div class="topB clearfix">
						<div class="float--left">
							<label for="date">&nbsp;[주문일자]&nbsp;</label>
							<span>${bean.order_date }</span>
						</div>
						<div class="float--right">
							<a href="${root }purchaseDetail?o=${bean.order_id }" style="text-decoration:none" class="cBtn">주문상세보기</a>
						</div>
					</div>
					<div class="bigB clearfix">	
						<div class="imgBox float--left">
							<a href="${root }order/productDetail?idx=${bean.product_id }" style="text-decoration:none">
								<img id="proImg" src="${bean.product_thumb }" alt="Img"/>
							</a>
						</div>
						<div class="contentBox float--right">
							<table class="table">
								<thead></thead>
								<tbody>
									<tr>
									<th>상품이름</th>
									<td id="tx">
										<a href="${root }order/productDetail?idx=${bean.product_id }" style="text-decoration:none">
											${bean.product_name }
										</a>
									</td>
									</tr>
									<tr>
									<th>옵션</th>
									<td id="tx">${bean.order_detail_option }</td>
									</tr>
									<tr>
									<th>가격</th>
									<td id="tx">${bean.order_detail_price }원 / ${bean.order_detail_quantity }개</td>
									</tr>
									<tr>
									<th>배송상태</th>
									<td id="tx">${bean.order_state_member }</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="btnBox float--right">
							<a href="#" style="text-decoration:none" class="cBtn innerBtn">배송조회</a>
							<a href="${root }askProduct?a=${bean.product_id }&b=${bean.order_id }" style="text-decoration:none" class="cBtn innerBtn">문의하기</a>
							<a href="${root }askExchange?a=${bean.product_id }&b=${bean.order_id }" style="text-decoration:none" class="cBtn innerBtn">교환신청</a>
							<a href="${root }askReturn?a=${bean.product_id }&b=${bean.order_id }" style="text-decoration:none" class="cBtn innerBtn">반품신청</a>
							<a href="${root }myReview?a=${bean.product_id }" style="text-decoration:none" class="cBtn innerBtn">후기작성</a>
						</div>
					</div>
	            	</c:forEach>
	            </section>
			</div>
			
        <!-- Footer  -->
			<jsp:include page="../common/footer.jsp" />
			<!-- Footer end -->

		</div>
	</div>
	
	
	<!-- script start -->
	<script src="${root }js/jquery-1.12.4.js"></script>
	<script type="text/javascript">
    </script>
    
    <!-- Popper.JS -->
    <script src="${root }js/bootstrap/popper.js"></script>
    <!-- Bootstrap JS -->
    <script src="${root }js/bootstrap/bootstrap.js"></script>
    <!-- MAIN JS -->
    <script src="${root }js/main.js"></script>
    <!-- script end -->
</body>
</html>