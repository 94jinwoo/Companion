<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
       <!-- DateTables CSS -->
    <link rel="stylesheet" type="text/css" href="${root }DataTables/datatables.min.css"/>
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/admin/main.css">
    <link rel="stylesheet" href="${root }css/admin/review.css">
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<title>Companion::후기 목록</title>
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
			                <a class="nav-link active" href="${root }admin/review_list">후기 목록</a>
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
				<h1>[Admin] 후기 목록</h1>
			</div>
			
			<table id="dataTable" class="table table-bordered table-hover" style="width:100%">
				<thead>
					<tr>
						<th>상품명</th>
						<th>썸네일</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${adminReviewList }" var="bean" varStatus="status">
						<tr>
							<td><a href="${root }admin/review_detail?article_id=${bean.article_id }">${bean.product_name }</a></td>
							<td><img width="80px" height="80px" alt="썸네일" src="<spring:url value='${bean.article_thumb }'/>"/></td>
							<td><a href="${root }admin/review_detail?article_id=${bean.article_id }">${bean.article_title }</a></td>
							<td><a href="${root }admin/review_detail?article_id=${bean.article_id }">${bean.member_id }</a></td>
							<td><a href="${root }admin/review_detail?article_id=${bean.article_id }">${bean.article_date }</a></td>
							<td><a href="${root }admin/review_detail?article_id=${bean.article_id }">${bean.article_count }</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</section>
		<!-- section [end] -->
		
	</div>
	<!-- #content [end] -->
</div>
<!-- .wrapper [end] -->



<!-- jQuery -->
<script src="${root }js/jquery-1.12.4.js"></script>
<!-- Popper.JS -->
<script src="${root }js/bootstrap/popper.js"></script>
<!-- Bootstrap JS -->
<script src="${root }js/bootstrap/bootstrap.js"></script>
<!-- Data Table JS -->
<script type="text/javascript" src="${root }DataTables/datatables.min.js"></script>
<!-- MAIN JS -->
<script src="${root }js/main.js"></script>

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
			"columns" : [ 
				{ "width" : "25px" },
				{ "width" : "25px" }, 
				{ "width" : "200px" }, 
				{ "width" : "25px" },
				{ "width" : "25px" },
				{ "width" : "25px" }
			],
			"lengthMenu" : [
				10,20,30,40,50
			],
			"pageLength" : 10,
			"columnDefs" : [
				{ "orderable" : false, "targets" : 1},
				{ "orderable" : false, "targets" : 3}
			]
		});
	});
</script>

</body>
</html>