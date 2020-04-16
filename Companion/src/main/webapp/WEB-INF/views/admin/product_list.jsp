<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
    <!-- DateTables CSS -->
    <link rel="stylesheet" type="text/css" href="${root }DataTables/datatables.min.css"/>
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/admin/main.css">
    <link rel="stylesheet" href="${root }css/admin/product.css">
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	
	<title>Companion::상품 목록</title>
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
			                <a class="nav-link active" href="${root }admin/product_list">상품목록</a>
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
				<h1>[Admin] 상품 목록</h1>
			</div>
			<div class="sub-group clearfix">
			<a class="btn btn-dark insertbtn float--left" role="button" href="${root }admin/product_add">상품등록</a>
			</div>
				<table id="dataTable" class="table table-hover table-bordered">
					<thead>
						<tr>
							<th>카테고리</th>
							<th>이미지</th>
							<th>이름</th>
							<th>가격</th>
							<th>수량</th>
							<th>등록날짜</th>
							<th>옵션1</th>
							<th>옵션2</th>
							<th>옵션etc</th>
						</tr>
					</thead>
				<tbody>
				<c:forEach items="${adminProductList}" var="bean">
					<tr>
						<td>
							<c:choose>
								<c:when test="${bean.category_refid == '0' }">
							<div>
									<a href="${root }admin/product_detail?product_id=${bean.product_id}">${bean.category_name}</a>
							</div>
								</c:when>
								<c:when test="${bean.category_refid != '0' }">
							<div class="div2">	
									<a href="${root }admin/product_detail?product_id=${bean.product_id}">${bean.category_refidname} <br/>- ${bean.category_name}</a>
							</div>		
								</c:when>
							</c:choose>
						</td>
						<td>
							<img src="<spring:url value='${bean.product_thumb }'/>" alt="Img"/>
						</td>
						<td>
							<div>
							<a href="${root }admin/product_detail?product_id=${bean.product_id}">${bean.product_name}</a>
							</div>
						</td>
						<td>
							<div>
							<a href="${root }admin/product_detail?product_id=${bean.product_id}">
							<fmt:formatNumber value="${bean.product_price}" pattern="###,###,###"/>
							</a>
							</div>
						</td>
						<td>
							<div>
							<a href="${root }admin/product_detail?product_id=${bean.product_id}">${bean.product_stock}</a>
							</div>
						</td>
						<td>
							<div>
							<a href="${root }admin/product_detail?product_id=${bean.product_id}">
							<fmt:formatDate value="${bean.product_date}" pattern="yyy-MM-dd"/>
							</a>
							</div>
						</td>
						<td>
							<div>
							<a href="${root }admin/product_detail?product_id=${bean.product_id}">${bean.product_option1 }</a>
							</div>
						</td>
						<td>
							<div>
							<a href="${root }admin/product_detail?product_id=${bean.product_id}">${bean.product_option2 }</a>
							</div>
						</td>
						<td>
							<div>
							<a href="${root }admin/product_detail?product_id=${bean.product_id}">자세히>></a>
							</div>
						</td>

					</tr>   
				</c:forEach>
				</tbody>
			</table>
		</section>
		
	</div><!-- #content [end] -->
</div><!-- .wrapper [end] -->

<!-- jQuery -->
<script type="text/javascript" src="${root }DataTables/jQuery-3.3.1/jquery-3.3.1.js"></script>
<!-- Popper.JS -->
<script src="${root }js/bootstrap/popper.js"></script>
<!-- Bootstrap JS -->
<script src="${root }js/bootstrap/bootstrap.js"></script>
<!-- Data Table JS -->
<script type="text/javascript" src="${root }DataTables/datatables.min.js"></script>

<script type="text/javascript">
// 데이터 테이블 초기화
$(document).ready(function() {
	$('#dataTable').DataTable({
		"language": {
			"emptyTable": "데이터가 없습니다.",
			"lengthMenu": "페이지당 _MENU_ 개씩 보기",
			"info": "현재 _START_ - _END_ / _TOTAL_건",
			"infoEmpty": "데이터 없음",
			"infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
			"search": "검색: ",
			"zeroRecords": "일치하는 데이터가 없습니다.",
			"loadingRecords": "로딩중...",
			"processing":     "잠시만 기다려 주세요...",
			"paginate": {
				"next": "다음",
				"previous": "이전"
			}
		},
		"order" : [
			[5,"desc"]
		],
		"lengthMenu" : [
			10,20,30,40,50
		],
		"pageLength" : 20,
		"columnDefs" : [
			{ "orderable" : false, "targets" : 1},
			{ "orderable" : false, "targets" : 6},
			{ "orderable" : false, "targets" : 7},
			{ "orderable" : false, "targets" : 8}
		]
	});
});

//메뉴 토글 버튼
$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
});
</script>
	
</body>
</html>