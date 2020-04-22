<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/admin/main.css">
    <link rel="stylesheet" href="${root }css/admin/reservD.css">
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	
	<title>Companion::회원 상세</title>
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
			                <a class="nav-link" href="${root }admin/member_list">회원 목록</a>
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
				<h1>[Admin] 회원 상세</h1>
			</div>
			<table class="reserv_d">
				<thead></thead>
				<tbody>
					<tr>
						<th><label for="member_grade">회원구분</label></th>
						<td colspan="3">
							<div class="inputArea">
								<c:if test="${adminMemberOne.member_grade == 0}">관리자</c:if>
								<c:if test="${adminMemberOne.member_grade == 1}">운영자</c:if>
								<c:if test="${adminMemberOne.member_grade == 2}">회원</c:if>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="member_name">이름</label></th>
						<td>
							<div class="inputArea">
								<span>${adminMemberOne.member_name }</span>
							</div>
						</td>
						<th><label for="member_id">아이디</label></th>
						<td>
							<div class="inputArea">
							<input type="hidden" name="member_id" value="${adminMemberOne.member_id }">
								<span>${adminMemberOne.member_id }</span>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="member_tel">일반전화</label></th>
						<td>
							<div class="inputArea">
								<span>${adminMemberOne.member_tel }</span>
							</div>
						</td>
						<th><label for="member_phone">휴대전화</label></th>
						<td>
							<div class="inputArea">
								<span>${adminMemberOne.member_phone }</span>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="member_email">이메일</label></th>
						<td colspan="3">
							<div class="inputArea">
								<span>${adminMemberOne.member_email }</span>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="member_addr1">우편번호</label></th>
						<td colspan="3">
							<div class="inputArea">
								<span>${adminMemberOne.member_addr1 }</span>
							</div>
						</td>
					</tr>	
					<tr>	
						<th><label for="member_addr2">기본주소</label></th>
						<td colspan="3">
							<div class="inputArea">
								<span>${adminMemberOne.member_addr2 }</span>
							</div>
						</td>
					</tr>
					<tr>	
						<th><label for="member_addr3">상세주소</label></th>
						<td colspan="3">
							<div class="inputArea">
								<span>${adminMemberOne.member_addr3 }</span>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="btn-groupR">
				<button type="button" id="modify_Btn" class="mainBtn">수정</button>
				<button type="button" id="list_Btn" class="mainBtn">목록으로</button>
			</div>
		</section>
		<!-- section [end] -->
		
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
$("#modify_Btn").click(function(){
	location.href = ${root}+"admin/member_edit?member_id=${adminMemberOne.member_id}";
});

// 목록버튼
$("#list_Btn").click(function(){
	location.href = ${root}+"admin/member_list";
});
</script>
</body>
</html>