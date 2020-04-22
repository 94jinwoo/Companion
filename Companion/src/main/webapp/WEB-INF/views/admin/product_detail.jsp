<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:url value="/" var="root"></c:url>
<c:url var="getList" value="/admin/product_list"></c:url> <!-- 페이지네이션을위한 현재 페이지경로 설정 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/admin/main.css">
    <link rel="stylesheet" href="${root }css/admin/productD.css">
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
			<div class="btn__group">
				<button type="button" id="edit_Btn" class="mainBtn">수정</button>
				<button type="submit" id="delete_Btn" class="mainBtn">삭제</button>
				<button type="button" id="back_Btn" class="mainBtn">목록</button>
			</div>
			<div id="detail">
			<input type="hidden" name="product_id" value="${adminProductOne.product_id }"/>
		 		<div class="clearfix"> 
				<div class="inputArea float--left">
					<label for="img"></label>
					<img alt="썸네일" width="45px" height="45px" src="<spring:url value='${adminProductOne.product_thumb }'/>">
				</div>
				<div class="inputArea tit float--left">
					<label for="product_name">상품번호</label>
					<span>${adminProductOne.product_id }</span>
				</div>
				<div class="inputArea rightd float--right">
					<label for="product_date">상품등록일</label>
					<span><fmt:formatDate value="${adminProductOne.product_date}" pattern="yyy-MM-dd"/></span>
				</div>
				</div>
			<div class="contentM clearfix">
			<div class="imgB float--left">
				
				<img alt="원본이미지" src="<spring:url value='${adminProductOne.product_image }'/>">
			</div>	
			<table class="float--right">
				<thead>
				<tr>
				<c:choose>
					<c:when test="${adminProductOne.category_refid == '0' }">
						<th><label for="category_name">1차 분류</label></th>
						<td><span>${adminProductOne.category_name}</span></td>
						<th><span>2차 분류</span></th>
						<td><span></span></td>
					</c:when>
					<c:when test="${adminProductOne.category_refid != '0' }">
						<th><label for="category_refidname">1차 분류</label></th>
						<td><span>${adminProductOne.category_refidname}</span></td>
						<th><label for="category_name">2차 분류</label></th>
						<td><span>${adminProductOne.category_name}</span></td>
					</c:when>
				</c:choose>
				</tr>
				</thead>
				<tbody>
			  <tr>
			  	<th><label for="product_name">상품번호</label></th>
			    <td><span>${adminProductOne.product_id }</span></td>
			  </tr>
			   <tr>
			  	<th><label for="product_name">상품명</label></th>
			    <td colspan="3"><span>${adminProductOne.product_name }</span></td>
			  </tr>
			   <tr>
			  	<th><label for="product_price">상품가격</label></th>
			    <td><span><fmt:formatNumber value="${adminProductOne.product_price}" pattern="###,###,###"/>원</span></td>
			  	<th><label for="product_stock">상품수량</label></th>
			    <td><span>${adminProductOne.product_stock }</span></td>
			  </tr>
			   <tr>
			  	<th> <label for="like_sum">좋아요</label></th>
			    <td><span>${adminProductOne.like_sum }</span></td>
			  </tr>
			  <tr>
			  	<th><label for="product_option1">옵션1</label></th>
			    <td><span>${adminProductOne.product_option1 }</span></td>
			  	<th><label for="product_option2">옵션2</label></th>
			    <td><span>${adminProductOne.product_option2 }</span></td>
			  </tr>
			  <tr>
			  	<th><label for="product_option3">옵션3</label></th>
			    <td><span>${adminProductOne.product_option3 }</span></td>
			  	<th><label for="product_option4">옵션4</label></th>
			    <td><span>${adminProductOne.product_option4 }</span></td>
			  </tr>
			  <tr>
			  	<th><label for="product_option5">옵션5</label></th>
			    <td><span>${adminProductOne.product_option5 }</span></td>
			  </tr>
			  </tbody>
			</table>
			</div>
			<div class="inputArea">
				<label for="product_content" class="sr-only">상품소개</label>
				<div class="inputAreaC">${adminProductOne.product_content }</div>
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
	}else{
		return false;
	}
});

// 목록 버튼
$("#back_Btn").click(function(){
	location.href = ${root}+"admin/product_list";
});

</script>

</body>
</html>