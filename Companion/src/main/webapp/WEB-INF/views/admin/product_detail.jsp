<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:url value="/" var="root"></c:url>
<c:url var="getList" value="/admin/product_list"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/admin/main.css">
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	
	<title>Companion::상품 조회</title>
</head>
<body>

<!-- .wrapper [start] -->
<div class="wrapper">

	<!-- Sidebar -->
	<jsp:include page="../common/admin_sidebar.jsp"/>
	
	<!-- #content [start] -->
	<div id="content">
	
		<!-- nav [start] -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			
			<!-- .container-fluid [start] -->
			<div class="container-fluid">

				<!-- menu toggle button [start] -->
			    <button type="button" id="sidebarCollapse" class="btn btn-jacaranda">
			        <i class="fas fa-align-left"></i>
			        <span>메뉴</span>
			    </button>
			    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
			        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
			        aria-expanded="false" aria-label="Toggle navigation">
			        <i class="fas fa-align-justify"></i>
			    </button>
			    <!-- menu toggle button [end] -->
			    
				<!-- top menu bar [start] -->
			    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			        <ul class="nav navbar-nav ml-auto">
			            <li class="nav-item">
			                <a class="nav-link" href="${root }admin/product_list">상품목록</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="${root }admin/product_add">상품등록</a>
			            </li>
			        </ul>
			    </div>
			    <!-- top menu bar [end] -->
			    
			</div>
			<!-- .container-fluid [end] -->
			
		</nav>
		<!-- nav [end] -->
		
		<!-- section [start] -->
		<section class="section">
			<div class="main--title">
				<h1>[Admin] 상품 상세</h1>
			</div>
			<form role="form" method="post" autocomplete="off" action="${root}admin/product_delete">
				<c:choose>
					<c:when test="${adminProductOne.category_refid == '0' }">
						<label for="category_name">1차 분류</label>
						<span>${adminProductOne.category_name}</span>
					</c:when>
					<c:when test="${adminProductOne.category_refid != '0' }">
						<label for="category_refidname">1차 분류</label>
						<span>${adminProductOne.category_refidname}</span>
						<label for="category_name">2차 분류</label>
						<span>${adminProductOne.category_name}</span>
					</c:when>
				</c:choose>
				
		 		<input type="hidden" name="product_id" value="${adminProductOne.product_id }"/>
		 		 
				<div class="inputArea">
					<label for="product_name">상품번호</label>
					<span>${adminProductOne.product_id }</span>
				</div>
				<div class="inputArea">
					<label for="product_price">상품가격</label>
					<span><fmt:formatNumber value="${adminProductOne.product_price}" pattern="###,###,###"/></span>
				</div>
				<div class="inputArea">
					<label for="product_stock">상품수량</label>
					<span>${adminProductOne.product_stock }</span>
				</div>
				<div class="inputArea">
					<label for="product_name">상품명</label>
					<span>${adminProductOne.product_name }</span>
				</div>
				<div class="inputArea">
					<label for="product_content">상품소개</label>
					<div>${adminProductOne.product_content }</div>
				</div>
				<div class="inputArea">
					<label for="product_date">상품등록일</label>
					<span><fmt:formatDate value="${adminProductOne.product_date}" pattern="yyy-MM-dd"/></span>
				</div>
				<div class="inputArea">
					<label for="like_sum">좋아요</label>
					<span>${adminProductOne.like_sum }</span>
				</div>
				<div class="inputArea">
					<label for="product_option1">상품옵션1</label>
					<span>${adminProductOne.product_option1 }</span>
				</div>
				<div class="inputArea">
					<label for="product_option2">상품옵션2</label>
					<span>${adminProductOne.product_option2 }</span>
				</div>
				<div class="inputArea">
					<label for="product_option3">상품옵션3</label>
					<span>${adminProductOne.product_option3 }</span>
				</div>
				<div class="inputArea">
					<label for="product_option4">상품옵션4</label>
					<span>${adminProductOne.product_option4 }</span>
				</div>
				<div class="inputArea">
					<label for="product_option5">상품옵션5</label>
					<span>${adminProductOne.product_option5 }</span>
				</div>
				<div>
					<label for="img">원본이미지</label>
					<img alt="원본이미지" src="<spring:url value='${adminProductOne.product_image }'/>">
				</div>
				<div>
					<label for="img">썸네일</label>
					<img alt="썸네일" src="<spring:url value='${adminProductOne.product_thumb }'/>">
				</div>
				<div class="inputArea">
					<button type="button" id="edit_Btn" class="btn btn-primary">수정</button>
					<button type="submit" id="delete_Btn" class="btn btn-danger">삭제</button>
					<button type="button" id="back_Btn" class="btn btn-warning">취소</button>
				</div>
			</form>
		</section>
	</div><!-- #content [end] -->
</div><!-- .wrapper [end] -->



<!-- jQuery -->
<script src="${root }js/jquery-1.12.4.js"></script>
<!-- Popper.JS -->
<script src="${root }js/bootstrap/popper.js"></script>
<!-- Bootstrap JS -->
<script src="${root }js/bootstrap/bootstrap.js"></script>

<script type="text/javascript">
// 메뉴 토글 버튼
$(document).ready(function () {
	$('#sidebarCollapse').on('click', function () {
		$('#sidebar').toggleClass('active');
	});
});

	// 수정 버튼
$("#edit_Btn").click(function(){
	location.href = ${root}+"admin/product_edit?product_id=" + ${adminProductOne.product_id};
});

	// 삭제 버튼
	var formObj = $("form[role='form']");
$("#delete_Btn").click(function(){
var con = confirm("정말로 삭제하시겠습니까?");
if(con) {      
	formObj.submit();
	}
});

// 취소 버튼
$("#back_Btn").click(function(){
	history.back();
});

	// 이전목록 버튼
	var url = "${getList}";
 		url = url + "?page=" + "${pagination.page}";
	url = url + "&range=" + "${pagination.pagerange}";
	url = url + "&searchType=" + "${search.searchType}";
	url = url + "&keyword=" + "${search.keyword}";
	console.log(url);
$("#list_Btn").click(function(){
	location.href = url;	

});
</script>

</body>
</html>