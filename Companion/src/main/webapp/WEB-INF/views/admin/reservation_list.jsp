<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:url value="/" var="root"></c:url>
<c:url var="getList" value="/admin/reservation_list"></c:url> <!-- 페이지네이션을위한 현재 페이지경로 설정 -->
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
    <link rel="stylesheet" href="${root }css/admin/reserv.css">
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<title>Companion::호텔예약자 목록</title>
</head>
<body>
<!-- .wrapper [start] -->
<div class="wrapper">
	<!-- sidebar -->
	<jsp:include page="../common/admin_sidebar.jsp"></jsp:include>
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
			                <a class="nav-link active" href="${root }admin/reservation_list">예약 목록</a>
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
				<h1>[Admin] 예약관리 목록</h1>
			</div>
				
			<table id="dataTable" class="table table-bordered table-hover" style="width:100%">
			<thead>
				<tr>
					<th>서비스</th>
					<th>아이디</th>
					<th>체크인 날짜</th>
					<th>체크아웃 날짜</th>
					<th>품종</th>
					<th>나이</th>
					<th>신청일</th>
					<th>예약상태</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${adminReservationList }" var="bean">
				<tr>
					<td>
						<a href="#reservationDetail" data-toggle="modal">${bean.service_name }</a>
					</td>
<%-- 				<td>
						<a href="${root }admin/reservation_detail?reserve_id=${bean.reserve_id}">${bean.service_name }</a>
					</td> --%>
					<td>
						<a href="${root }admin/reservation_detail?reserve_id=${bean.reserve_id}">${bean.member_id }</a>
					</td>
					<td><a href="${root }admin/reservation_detail?reserve_id=${bean.reserve_id}">${bean.reserve_checkin }</a></td>
					<td><a href="${root }admin/reservation_detail?reserve_id=${bean.reserve_id}">${bean.reserve_checkout }</a></td>
					<td>${bean.reserve_dogtype }</td>
					<td>${bean.reserve_dogage }</td>
					<td>${bean.reserve_date }</td>
					<td>
					<c:set var="state" value="${bean.reserve_state_id }"/>
						<c:if test="${state == 0}">신청완료</c:if>
						<c:if test="${state == 1}">예약완료</c:if>
						<c:if test="${state == 2}">이용중</c:if>
						<c:if test="${state == 3}">이용완료</c:if>
					</td>
				</tr>
				
			</c:forEach>
			</tbody>
			</table>
		</section>
		<!-- section [end] -->
		<!-- 테스트해보자 모달창 -->
		
		<!-- Modal -->
		<div class="modal fade" id="reservationDetail" tabindex="-1" role="dialog" aria-labelledby="reservationDetailTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-scrollable" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="reservationDetailTitle">예약 상세정보</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
				<div class="inputArea">
		       		<label for="member_name">이름</label>
					<span>${adminReservationOne.member_name }</span>
				</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary">예약취소</button>
		        <button type="button" class="btn btn-primary">예약확정</button>
		      </div>
		    </div>
		  </div>
		</div>

		<!-- 테스트해보자 모달창 -->
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

<script type="text/javascript">
	// 메뉴 토글 버튼
	$(document).ready(function () {
	    $('#sidebarCollapse').on('click', function () {
	        $('#sidebar').toggleClass('active');
	    });
	});

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
				{ "width" : "100px" }, 	//서비스
				{ "width" : "100px" },	//회원이름
				{ "width" : "120px" }, 	//체크인
				{ "width" : "120px" }, 	//체크아웃
				{ "width" : "100px" }, 	//품종
				{ "width" : "60px" }, 	//나이
				{ "width" : "100px" }, 	//작성일
				{ "width" : "100px" }	//예약상태
			],
			"order" : [
				[6,"desc"]
			],
			"lengthMenu" : [
				10,20,30,40,50
			],
			"pageLength" : 10
		});
	});
	
	
</script>
</body>
</html>