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
    <link rel="stylesheet" href="${root }css/admin/questionD.css">
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<!-- CKEditor JS -->
 	<script src="${root }resources/ckeditor/ckeditor.js"></script>

	<title>Companion::Q&A 조회</title>
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
			                <a class="nav-link" href="${root }admin/question_list">Q&A 목록</a>
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
				<h1>[Admin] Q&A 상세</h1>
			</div>
			<form role="form" method="post" autocomplete="off" action="${root}admin/question_delete">
				<div class="btn__group">
					<button type="button" id="modify_Btn" class="mainBtn">답변</button>
				 	<button type="submit" id="delete_Btn" class="mainBtn">삭제</button>
				</div>
				<input type="hidden" name="question_id" id="question_id" value="${adminQuestionOne.question_id }">
				<table class="table">
				<thead>
					<tr>
						<th class="clearfix">
						<div class="float--left">
							<label for="title">[제목]&nbsp;</label><span>${adminQuestionOne.question_title }</span>
						</div>
						<div class="float--right">
							<label for="date">[작성일]&nbsp;</label><span>${adminQuestionOne.question_date }</span>
						</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="clearfix">
						<div class="float--left">
							<label>[문의유형]&nbsp;</label><span>${adminQuestionOne.question_type_name }</span>&nbsp;&nbsp;
							<label>[문의상태]&nbsp;</label><span>${adminQuestionOne.question_state_name }</span>&nbsp;&nbsp;
						</div>
						<div class="float--right">
							<label>[비밀글여부]&nbsp;</label>
							<span>${adminQuestionOne.question_secret_name }&nbsp;</span>
						</div>
						</td>
					</tr>
				</tbody>
				</table>
					<div class="contentB">
						<div class="imgBox">
							<img alt="원본이미지" src="<spring:url value='${adminQuestionOne.question_image }'/>"/>
						</div>
						<div class="textB">
							<div>
								<label>[주문ID]&nbsp;</label><span>${adminQuestionOne.order_id }</span>
							</div>
							<div>
								<label>[회원ID]&nbsp;</label><span>${adminQuestionOne.member_id }</span>
							</div>
							<div>
								<label>[상품명]&nbsp;</label><span>${adminQuestionOne.product_name }</span>
							</div>
						</div>
					</div>
					<div class="contentB">
					<label for="content" class="sr-only">content</label>
					<span>${adminQuestionOne.question_content }</span>
					</div>
					<table class="table">
					<tbody>
					<tr>
						<td class="clearfix">
						<div class="float--left">
							<label for="date">[답변일]&nbsp;</label><span>${adminQuestionOne.question_answerdate }</span>
						</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<label for="content">[답변]</label>
								<span>${adminQuestionOne.question_answer }</span>
							</div>
						</td>
					</tr>
				</tbody>
				</table>
				<button type="button" id="list_Btn" class="mainBtn btn-back">목록으로</button>
			</form>
	
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
//수정 버튼
$("#modify_Btn").click(function(){
	location.href = ${root}+"admin/question_edit?question_id=${adminQuestionOne.question_id}";
});  

// 목록버튼
$("#list_Btn").click(function(){
	location.href = ${root}+"/admin/question_list";
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