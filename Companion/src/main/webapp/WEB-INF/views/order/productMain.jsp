<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/" var ="root"></c:url>
	<!DOCTYPE html>
	<html> 
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Collapsible sidebar using Bootstrap 4</title>
	
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="${root}css/bootstrap/bootstrap.css">
		<!-- Our Custom CSS -->
		<link rel="stylesheet" href="${root}css/home.css">
		<!-- Our Custom CSS -->
		<link rel="stylesheet" href="${root}css/main.css">
		<link rel="stylesheet" href="${root}css/order/productMain.css">
		
		<!-- Font Awesome JS -->
		<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
		<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
		
		
	</head>
	<body>
	

		<div class="wrapper">
			 <!-- Sidebar  -->
		<jsp:include page="../common/sidebar.jsp"/>
	
			<!-- Page Content  -->
			<div id="content">
	
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div class="container-fluid">
	
						<button type="button" id="sidebarCollapse" class="btn btn-info">
							<i class="fas fa-align-left"></i>
							<span>메뉴</span>
						</button>
						<button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<i class="fas fa-align-justify"></i>
						</button>
	
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="nav navbar-nav ml-auto">
								<li class="nav-item">
                                <a class="nav-link active" href="/companion/order/productMain?c=100">사료</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/companion/order/productMain?c=200">간식</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/companion/order/productMain?c=300">장난감</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/companion/order/productMain?c=400">미용용품</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/companion/order/productMain?c=500">목욕용품</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/companion/order/productMain?c=600">위생용품</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/companion/order/productMain?c=700">산책용품</a>
                            </li>
                        </ul>
						</div>
					</div>
				</nav>
				<div class="categories">
                <a href="#homeSubmenu">
                    <i class="fas fa-home"></i>
                    쇼핑하기
                </a>
                <span>></span>
                <a href="#">
                    <i class="fas fa-home"></i>
                    사료
                </a>
                <hr class="mb-4">
            </div>
		<!-- content -->
		<div class="maincontent">
				<nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item active" aria-current="page">추천순</li>
                        <li class="breadcrumb-item"><a href="#">판매인기순</a></li>
                        <li class="breadcrumb-item"><a href="#">낮은가격순</a></li>
                        <li class="breadcrumb-item"><a href="#">높은가격순</a></li>
                        <li class="breadcrumb-item"><a href="#">상품평순</a></li>
                        <li class="breadcrumb-item"><a href="#">등록일순</a></li>
                    </ol>
                </nav>
			   <div class="row">
			        <%--    <% for(int i=0;i<20;i++){ %>  --%>
			<c:forEach items="${productCategory }" var="bean"> 
			        <div class="col-md-3 col-sm-6"> 
			            <div class="product-grid productbox">
			                <div class="product-image">
			                    <a href="productDetail?idx=${bean.product_id }">
						            <c:set var = "name" value="${bean.category_id }"/>        
										<c:choose >
											<c:when test="${name eq '100' }">		             
						                        <img class="pic-1" src="${root }imgs/shopping/사료.jpg">
			         <!--    마우스오버 사진변경<img class="pic-2" src="http://bestjquery.com/tutorial/product-grid/demo9/images/img-4.jpg"> -->
						                	</c:when>
					                		<c:when test="${name eq '200' }">		             
						                        <img class="pic-1" src="${root }imgs/shopping/간식.jpg">
						                	</c:when>
					                		<c:when test="${name eq '300' }">		             
						                        <img class="pic-1" src="${root }imgs/shopping/장난감.jpg">
						                	</c:when>
					                		<c:when test="${name eq '400' }">		             
						                        <img class="pic-1" src="${root }imgs/shopping/미용용품.jpg">
						                	</c:when>
					                		<c:when test="${name eq '500' }">		             
						                        <img class="pic-1" src="${root }imgs/shopping/목욕용품.jpg">
						                	</c:when>
					                		<c:when test="${name eq '600' }">		             
						                        <img class="pic-1" src="${root }imgs/shopping/위생용품.jpg">
						                	</c:when>
					                		<c:when test="${name eq '700' }">		             
						                        <img class="pic-1" src="${root }imgs/shopping/산책용품.jpg">
						                	</c:when>
						                </c:choose>
			                    </a>

			                </div>
			                <ul class="rating">
			                <!-- 별갯수 알려주는곳. -->
			                    <li class="fa fa-star"></li>
			                    <li class="fa fa-star"></li>
			                    <li class="fa fa-star"></li>
			                    <li class="fa fa-star"></li>
			                    <li class="fa fa-star"></li>
			                </ul>
			                <div class="product-content">
			                    <h3 class="title"><a href="productDetail?idx=${bean.product_id }"> ${bean.product_thumb } // ${bean.category_id }</a></h3>
			                    <h3 class="title"><a href="productDetail?idx=${bean.product_id }"> ${bean.category_name }</a></h3> 
			              
			                <!-- 상품 추천 수 받아올 것. -->
			      
			                    <h3 id="DDaBong"class="title">상품 추천 수: ${bean.like_id }</h3>  
			                <!-- 상품 추천 수 받아올 것. -->
			                
			         <%--            <h3 class="title"><a href="#"> ${productlist.product_thumb } 나오는지 확인</a></h3>
			                    <h3 class="title"><a href="#"> ${productlist.product_option1 } 나오는지 확인</a></h3> --%>
			         			<!-- 리스트로 넘기면 하나씩은 못받아옴 FOrEach를 써야 하는가봄... -->
			                    <h3 class="title"><a href="productDetail?idx=${bean.product_id }"> ${bean.product_name }</a>
			             
			             
			             
			             
			             <!-- 따봉 로그인 세션 검사  -->
			             <c:set var = "memberID" value="${memberVo.member_id }"/>         
			               <c:choose>
									<c:when test="${memberVo.member_id==null}">	
					                    <a id=btn href="${root }login"><img  src="${root }imgs/shopping/빈따봉1.jpg"></a><%-- <img src="${root }imgs/shopping/찬따봉.jpg"> --%></h3>
					               </c:when>  
									<c:when test="${memberVo.member_id!=null }">	
					                    <a id=btn href='javascript:like_func();'><img id="like_img" src="${root }imgs/shopping/빈따봉1.jpg"></a><%-- <img src="${root }imgs/shopping/찬따봉.jpg"> --%></h3>
					                    <%System.out.println("따봉 클릭!할때만 작동하라고..."); %>
					               </c:when>  
 			                </c:choose>       
					 
			               <!-- 따봉 로그인 세션 검사  -->   
			                    <div class="price">$5.00
			                        <span>$10.00</span>
			                    </div>
			                    <a class="add-to-cart" href="">+ Add To Cart</a>
			                </div>
			            </div>
			        </div>
       		 </c:forEach>
		<%-- 	        <% } %> --%>
	
  
    </div>
			  <!-- 썸네일 쇼쇼핑멀 끝 -->
					      <!-- pagination [start] -->
				<jsp:include page="../common/pagination.jsp">
					<jsp:param value="${pagination.prev }" name="prev"/>
					<jsp:param value="${pagination.next }" name="next"/>
					<jsp:param value="${pagination.page }" name="page"/>
					<jsp:param value="${pagination.range }" name="range"/>
					<jsp:param value="${pagination.rangeSize }" name="rangeSize"/>
					<jsp:param value="${pagination.startPage }" name="startPage"/>
					<jsp:param value="${pagination.endPage }" name="endPage"/>
				</jsp:include>
				<!-- pagination [end] -->		
		</div><!-- container end  -->
		<!-- Footer  -->
			<jsp:include page="../common/footer.jsp"/>
		<!-- Footer end -->

		<!-- content -->
			</div>
		</div>
	
		<!-- jQuery -->
		<script src="${root}js/jquery-1.12.4.js"></script>
		<!-- Popper.JS -->
		<script src="${root}js/bootstrap/popper.js"></script>
		<!-- Bootstrap JS -->
		<script src="${root}js/bootstrap/bootstrap.js"></script>
	    <!-- MAIN JS -->
    	<script src="${root }js/main.js"></script>
		<!-- 추천수 script start -->
		<script type="text/javascript">
	
		</script>
		<!-- 추천수 script end -->
	</body>
	
	</html>