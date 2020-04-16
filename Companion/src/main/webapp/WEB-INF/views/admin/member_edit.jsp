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
				<h1>[Admin] 회원 정보 수정</h1>
			</div>
			<form role="form" method="post" autocomplete="off" action="${root}admin/member_edit" onsubmit="return validation_submit();">
			<table class="reserv_d">
				<thead></thead>
				<tbody>
					<tr>
						<th><label for="member_grade">회원구분</label></th>
						<td colspan="3">
							<div class="inputArea">
								<%-- <input type="hidden" id="member_grade" name="member_grade" value="${adminMemberOne.member_grade }"/> --%>
								
								<c:if test="${adminMemberOne.member_grade == 0}">
									<span>관리자</span>
								</c:if>
								<c:if test="${adminMemberOne.member_grade == 1}">
									<label>운영자</label>
									<input type="radio" name="member_grade" value="1" checked="checked">
									<label>회원</label>
									<input type="radio" name="member_grade" value="2">
								</c:if>
								<c:if test="${adminMemberOne.member_grade == 2}">
									<label>운영자</label>
									<input type="radio" name="member_grade" value="1" >
									<label>회원</label>
									<input type="radio" name="member_grade" value="2" checked="checked">
								</c:if>
								
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="member_name">이름</label></th>
						<td>
							<div class="inputArea">
								<input type="text" id="member_name" name="member_name" value="${adminMemberOne.member_name }"/>
							</div>
						</td>
						<th><label for="member_id">아이디</label></th>
						<td>
							<div class="inputArea">
								<input type="hidden" id="member_id" name="member_id" value="${adminMemberOne.member_id }"/>
								<span>${adminMemberOne.member_id }</span>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="member_tel">일반전화</label></th>
						<td>
							<div class="inputArea">
								<input type="text" id="member_tel" name="member_tel" value="${adminMemberOne.member_tel }"/>
							</div>
						</td>
						<th><label for="member_phone">휴대전화</label></th>
						<td>
							<div class="inputArea">
								<input type="text" id="member_phone" name="member_phone" value="${adminMemberOne.member_phone }"/>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="member_email">이메일</label></th>
						<td colspan="3">
							<div class="inputArea">
								<input type="text" id="member_email" name="member_email" value="${adminMemberOne.member_email }"/>
							</div>
						</td>
					</tr>
					<tr>
						<th><label for="member_addr1">우편번호</label></th>
						<td colspan="3">
							<div class="inputArea">
								<input type="text" id="member_addr1" name="member_addr1" value="${adminMemberOne.member_addr1 }"/>
							</div>
						</td>
					</tr>	
					<tr>	
						<th><label for="member_addr2">기본주소</label></th>
						<td colspan="3">
							<div class="inputArea">
								<input type="text" id="member_addr2" name="member_addr2" value="${adminMemberOne.member_addr2 }"/>
							</div>
						</td>
					</tr>
					<tr>	
						<th><label for="member_addr3">상세주소</label></th>
						<td colspan="3">
							<div class="inputArea">
								<input type="text" id="member_addr3" name="member_addr3" value="${adminMemberOne.member_addr3 }"/>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<button type="submit" id="update_Btn" class="btn">수정</button>
			<button type="button" id="back_Btn" class="btn">취소</button>
			</form>
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
	
 	// 취소 버튼
	$("#back_Btn").click(function(){
		history.back();
	});
 	
 	
	function validation_submit() {
		 console.log("1");
		if($("#member_name").val() == ""){
			alert('이름을 입력해주세요.');
			$('#member_name').focus();
			return false;
		}
		if($("#member_phone").val() == ""){
			alert('휴대전화를 입력해주세요.');
			$('#member_phone').focus();
			return false;
		}
		if($("#member_email").val() == ""){
			alert('이메일을 입력해주세요.');
			$('#member_email').focus();
			return false;
		}
		if($("#member_addr1").val() == ""){
			alert('우편번호를 입력해주세요.');
			$('#member_addr1').focus();
			return false;
		}
		if($("#member_addr2").val() == ""){
			alert('기본주소를 입력해주세요.');
			$('#member_addr2').focus();
			return false;
		}
		if($("#member_addr3").val() == ""){
			alert('상세주소를 입력해주세요.');
			$('#member_addr3').focus();
			return false;
		}
	};
	function validation() {
		$("#member_phone").on("change", function() {
			var regExp = /^[0-9]*$/
			var	chk = $(this).val();
			if( !regExp.test(chk) ) {
				alert("숫자만 입력해주세요.");
				$(this).val("");
				$(this).focus();
			}
		});
		$("#member_tel").on("change", function() {
			var regExp = /^[0-9]*$/
			var	chk = $(this).val();
			if( !regExp.test(chk) ) {
				alert("숫자만 입력해주세요.");
				$(this).val("");
				$(this).focus();
			}
		});
		$("#member_email").on("change", function() {
			var regExp=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
			var	chk = $(this).val();
			if( !regExp.test(chk) ) {
				alert("이메일주소 형식이 올바르지 않습니다.");
				$(this).val("");
				$(this).focus();
			}
		});
	};
	validation();
</script>
</body>
</html>