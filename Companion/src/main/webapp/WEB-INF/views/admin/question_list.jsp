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
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<title>Companion::Q&A 목록</title>
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
			                <a class="nav-link active" href="${root }admin/question_list">Q&A 목록</a>
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
				<h1>[Admin] Q&A 목록</h1>
			</div>
			
			<table id="dataTable" class="table table-bordered table-hover" style="width:100%">
				<thead>
					<tr>
						<th>글번호</th>
						<th>문의유형</th>
						<th>문의상태</th>
						<th>문의제목</th>
						<th>작성자</th>
						<th>문의일</th>
						<th>답변일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${adminQuestionList }" var="bean" varStatus="status">
						<tr>
							<td>${bean.question_id }</td>
							<td><a href="${root }admin/question_detail?question_id=${bean.question_id }">${bean.question_type_name }</a></td>
							<td><a href="${root }admin/question_detail?question_id=${bean.question_id }">${bean.question_state_name }</a></td>
							<td><a href="${root }admin/question_detail?question_id=${bean.question_id }">${bean.question_title }</a></td>
							<td><a href="${root }admin/question_detail?question_id=${bean.question_id }">${bean.member_id }</a></td>
							<td><a href="${root }admin/question_detail?question_id=${bean.question_id }">${bean.question_date }</a></td>
							<td><a href="${root }admin/question_detail?question_id=${bean.question_id }">${bean.question_answerdate }</a></td>
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
				{ "width" : "30px" }, 
				{ "width" : "200px" }, 
				{ "width" : "25px" },
				{ "width" : "25px" },
				{ "width" : "25px" }
			],
			"order" : [
				[2,"asc"],[0,"desc"]
			],
			"lengthMenu" : [
				10,20,30,40,50
			],
			"pageLength" :20
		});
	});

</script>
</body>
</html>