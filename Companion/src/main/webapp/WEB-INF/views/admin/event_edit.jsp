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
    <link rel="stylesheet" href="${root }css/admin/noticeE.css">
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<!-- CKEditor JS -->
	<script src="${root }resources/ckeditor/ckeditor.js"></script>

	<title>Companion::공지사항 수정</title>
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
			                <a class="nav-link" href="${root }admin/event_list">이벤트 목록</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="${root }admin/event_add">이벤트 등록</a>
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
				<h1>[Admin] 이벤트 수정</h1>
			</div>
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data" onsubmit="return validation_submit();">
			<!-- 페이지 유지를 위한 정보 -->
			<input type="hidden" name="page" value="${search.page }"/>
			<input type="hidden" name="range" value="${search.range }"/>
			<input type="hidden" name="searchType" value="${search.searchType }"/>
			<input type="hidden" name="keyword" value="${search.keyword }"/>
			<input type="hidden" name="article_id" id="article_id" value="${adminArticleOne.article_id }">
			<!-- table start-->
			<table>
				<thead>
				</thead>
				<tbody>
				  <tr>
				    <th>
				    	<div>
				    	<label for="title">글 제목</label>
				    	</div>
				    </th>
				    <td>
				    	<div>
				    	<input class="input--text" type="text" name="article_title" id="article_title" value="${adminArticleOne.article_title }"/>
				    	</div>
				    </td>	
				  </tr>
				  <tr>
				    <th>
				    	<div>
				    	<label for="date">작성일</label>
				    	</div>
				    </th>
				    <td>
				    	<div>
				    	<input class="input--text" type="text" name="article_date" id="article_date" value="${adminArticleOne.article_date }" disabled="disabled"/>
				    	</div>
				    </td>	
				  </tr>
				  <tr>
				    <th>
				    	<div>
						<label for="content">게시글 내용</label>
						</div>
					</th>
				    <td>
				    	<div>
				    	<textarea class="ckeditor" name="article_content" id="article_content" rows="10" cols="80">${adminArticleOne.article_content }</textarea>
				    	</div>
				    </td>
				  </tr>
				  <tr>
				    <th>
				    	<div>
						<label for="article_image">파일 첨부</label>
						</div>
					</th>
				    <td>
				    	<div class="file-add">
				    	<input type="file" name="file" id="article_image"/>
						<div class="select_img">
							<img alt="원본이미지" src="<spring:url value='${adminArticleOne.article_image }'/>"/>
							<input type="hidden" name="article_image" value="${adminArticleOne.article_image }"/>
							<input type="hidden" name="article_thumb" value="${adminArticleOne.article_thumb }"/>
						</div>
				    	</div>
				    </td>
				  </tr>
				</tbody>
				</table>
				<!-- table end -->
				<div class="btn__group">
					<button type="submit"class="btn">수정</button>
					<button type="button" id="back_Btn"class="btn">취소</button>
				</div>
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
// .input--text text 전체선택
$(document).ready(function(){
	$(".input--text").on("click", function(){
		$(this).select();
	});
});	
// 이미지 업로드 시 썸네일 출력
$('#article_image').change(function(){
	if(this.files&&this.files[0]){
		var reader = new FileReader;
		reader.onload = function(data){
			$('.select_img img').attr("src",data.target.result).width(500);
		}
		reader.readAsDataURL(this.files[0]);
	}
});

// 취소 버튼
$("#back_Btn").click(function(){
	/* history.back(); */
	event.preventDefault();
	location.href = ${root}+"/admin/event_detail?article_id=${adminArticleOne.article_id}"
		+"&page=${search.page}"
		+"&range=${search.range}"
		+"&searchType=${search.searchType}"
		+"&keyword=${search.keyword}"; 
});

// validation
function validation_submit() {
	if($("#article_title").val() == ""){
		alert('제목을 입력해주세요.');
		$('#article_title').focus();
		return false;
	}
	if(CKEDITOR.instances.article_content.getData() == ""){
		alert('내용을 입력해주세요.');
		$('#article_content').focus();
		return false;
	}
};
</script>

</body>
</html>