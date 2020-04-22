<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
    <title>Companion::관리자::주문내역</title>
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
			            <li class="nav-item active">
			                <a class="nav-link" href="#">주문관리</a>
			            </li>
			        </ul>
			    </div>
			    <!-- top menu bar [end] -->
			</div>
			<!-- .container-fluid [end] -->
		</nav>
		<!-- nav [end] -->
		
		<section class="section">
			<div class="main--title clearfix">
				<h1>[Admin] 주문내역</h1>
			</div>
		<!-- .container-fluid [start] -->
		<div class="container-fluid">
			<table class="table table-bordered dataTable" id="dataTable">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문상태</th>
						<th>금액</th>
						<th>주문자(아이디)</th>
						<th>수령인</th>
						<th>수령인 연락처</th>
						<th>주문일</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list }" var="bean">
				
					<tr>
						<td><a href="${root }admin/order_detail?order_id=${bean.order_id}">${bean.order_id }</a></td>
						<td>
							<c:choose>
								<c:when test="${bean.order_state_id eq 0 }">
									결제대기
								</c:when>
								<c:when test="${bean.order_state_id eq 1 }">
									결제완료
								</c:when>
								<c:when test="${bean.order_state_id eq 2 }">
									배송준비중
								</c:when>
								<c:when test="${bean.order_state_id eq 3 }">
									출고요청
								</c:when>
								<c:when test="${bean.order_state_id eq 4 }">
									출고처리중
								</c:when>
								<c:when test="${bean.order_state_id eq 5 }">
									배송중/출고완료
								</c:when>
								<c:when test="${bean.order_state_id eq 6 }">
									배송완료
								</c:when>
								<c:when test="${bean.order_state_id eq 7 }">
									구매확정
								</c:when>
								<c:when test="${bean.order_state_id eq 8 }">
									교환
								</c:when>
								<c:when test="${bean.order_state_id eq 9 }">
									반품
								</c:when>
								<c:otherwise>
									주문취소
								</c:otherwise>
							</c:choose>
						</td>
						<td><fmt:formatNumber value="${bean.order_amount }" pattern="###,###,###"/></td>
						<td><a href="${root }admin/order_detail?order_id=${bean.order_id}">${bean.member_name }(${bean.member_id })</a></td>
						<td>${bean.order_name }</td>
						<td>${bean.order_phone }</td>
						<td>${bean.order_date }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- .container-fluid [end] -->
		</section>
		<!-- Footer  -->
		<jsp:include page="../common/footer.jsp"/>
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
<!-- Data Table JS -->
<script type="text/javascript" src="${root }DataTables/datatables.min.js"></script>
<script type="text/javascript" src="//gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	// DataTable
	var chkbox = $('#dataTable').DataTable({
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
		"searching" : false,
		"order" : [[0,'desc']],
		"lengthMenu" : [
			10,20,30,40,50
		],
		"pageLength" : 10,
		"columnDefs" : [
			{ "orderable" : false, "targets" : 6}
		]
	});
});
 </script>
</body>
</html>