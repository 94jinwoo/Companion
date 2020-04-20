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
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/admin/main.css">
    <link rel="stylesheet" href="${root }css/admin/reservD.css">
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<!-- CKEditor JS -->
 	<script src="${root }resources/ckeditor/ckeditor.js"></script>

	<title>Companion::예약상세</title>
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
			                <a class="nav-link" href="${root }admin/reservation_list">예약관리 목록</a>
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
				<h1>[Admin] 예약자 상세</h1>
			</div>
			<table class="reserv_d">
				<thead></thead>
				<tbody>
					<tr>
						<th><label for="member_id">아이디</label></th>
						<td>
							<div class="inputArea">
								<span>${adminReservationOne.member_id }</span>
							</div>
						</td>
						<th><label for="member_id">예약신청날짜</label></th>
						<td>
							<div class="inputArea">
								<span>${adminReservationOne.reserve_date }</span>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="member_name">이름</label></th>
						<td>
							<div class="inputArea">
								<span>${adminReservationOne.member_name }</span>
							</div>
						</td>
						<th><label for="member_name">연락처</label></th>
						<td>
							<div class="inputArea">
								<span>${adminReservationOne.member_phone }</span>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="service_id">서비스</label></th>
						<td colspan="3">
							<div class="inputArea">
								<span>${adminReservationOne.service_name }</span>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="reserve_checkin">체크인날짜</label></th>
						<td>
							<div class="inputArea">
								<span>${adminReservationOne.reserve_checkin }</span>
							</div>
						</td>
						<th><label for="reserve_checkout">체크아웃 날짜</label></th>
						<td>
							<div class="inputArea">
								<span>${adminReservationOne.reserve_checkout }</span>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="reserve_dogtype">견종</label></th>
						<td>
							<div class="inputArea">
								<span>${adminReservationOne.reserve_dogtype }</span>
							</div>
						</td>
						<th><label for="reserve_dogage">반려견 나이</label></th>
						<td>
							<div class="inputArea">
								<span>${adminReservationOne.reserve_dogage }</span>
							</div>
						</td>
					</tr>
					<tr class="reserv_msg">
						<th><label for="reserve_msg">특이사항</label></th>
						<td colspan="3">
							<div class="inputArea">
								<span>${adminReservationOne.reserve_msg }</span>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="reserve_state_id">예약상태</label></th>
						<td colspan="3" class="clearfix">
						<form role="form" method="post" autocomplete="off" action="${root}admin/reservation_edit">
							<input type="hidden" value="${adminReservationOne.reserve_id }" name="reserve_id">
							<div class="state-box float--left">
							
								<c:if test="${adminReservationOne.reserve_state_id == 0 }">
									<input type="radio" name="reserve_state_id" value="0" checked="checked"/><label>예약대기</label>
									<input type="radio" name="reserve_state_id" value="1"/><label>예약완료</label>
									<input type="radio" name="reserve_state_id" value="2"/><label>이용중</label>
									<input type="radio" name="reserve_state_id" value="3"/><label>이용완료</label>
								</c:if>
								<c:if test="${adminReservationOne.reserve_state_id == 1 }">
									<input type="radio" name="reserve_state_id" value="0"/><label>예약대기</label>
									<input type="radio" name="reserve_state_id" value="1" checked="checked"/><label>예약완료</label>
									<input type="radio" name="reserve_state_id" value="2"/><label>이용중</label>
									<input type="radio" name="reserve_state_id" value="3"/><label>이용완료</label>
								</c:if>
								<c:if test="${adminReservationOne.reserve_state_id == 2 }">
									<input type="radio" name="reserve_state_id" value="0"/><label>예약대기</label>
									<input type="radio" name="reserve_state_id" value="1"/><label>예약완료</label>
									<input type="radio" name="reserve_state_id" value="2" checked="checked"/><label>이용중</label>
									<input type="radio" name="reserve_state_id" value="3"/><label>이용완료</label>
								</c:if>
								<c:if test="${adminReservationOne.reserve_state_id == 3 }">
									<input type="radio" name="reserve_state_id" value="0"/><label>예약대기</label>
									<input type="radio" name="reserve_state_id" value="1"/><label>예약완료</label>
									<input type="radio" name="reserve_state_id" value="2"/><label>이용중</label>
									<input type="radio" name="reserve_state_id" value="3" checked="checked"/><label>이용완료</label>
								</c:if>
							</div>
							<div class="float--right">
								<button type="submit" id="update_Btn" class="Cbtn btn-primary">상태저장</button>
							</div>
						</form>
						</td>
					</tr>
				</tbody>
			</table>
			<button type="button" id="list_Btn" class="mainBtn btn-groupR">목록으로</button>
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
<!-- MAIN JS -->
<script src="${root }js/main.js"></script>
  
<script type="text/javascript">

$(document).ready(function(){
	$("input[name='reserve_state_id']").each(function(){
		var thisVal = $(this).val();
		console.log(thisVal);
	});
})
//수정 버튼
$("#modify_Btn").click(function(){
	location.href = ${root}+"admin/question_edit?article_id=${adminArticleOne.article_id}"
		+"&page=${search.page}"
		+"&range=${search.range}"
		+"&searchType=${search.searchType}"
		+"&keyword=${search.keyword}"; 
});  

// 목록버튼
$("#list_Btn").click(function(){
	location.href = ${root}+"/admin/reservation_list"
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
</script>
</body>
</html>