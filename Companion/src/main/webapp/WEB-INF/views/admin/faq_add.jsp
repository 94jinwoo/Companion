<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${root }css/admin/noticeA.css">
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<!-- CKEditor JS -->
 	<script src="${root }resources/ckeditor/ckeditor.js"></script>

	<title>Companion::FAQ 입력</title>
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
			                <a class="nav-link active" href="${root }admin/faq_list">FAQ 목록</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="${root }admin/faq_add">FAQ 등록</a>
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
				<h1>[Admin] FAQ 등록</h1>
			</div>
			
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data" onsubmit="return validation_submit();">
			<!-- tapflksjdfos -->
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
				    	<input class="input--text" type="text" name="article_title" id="article_title" placeholder="제목을 입력하세요" />
				    	</div>
				    </td>	
				  </tr>
				  <tr>
				    <th>
				    	<div>
						<label for="content">글 내용</label>
						</div>
					</th>
				    <td>
				    	<div>
				    	<textarea class="ckeditor" name="article_content" id="article_content" placeholder="내용을 입력하세요" rows="50" cols="80"></textarea>
				    	</div>
				    </td>
				  </tr>
				</tbody>
				</table>

				
				<div class="btn__group">
					<button type="submit"class="btn">입력</button>
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



<script>
<!-- 이미지 등록시 출력 -->	
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
	history.back();
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