<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/admin/main.css">
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	
	<title>Companion::상품 수정</title>
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
			                <a class="nav-link" href="#">공지사항</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="#">이벤트</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="#">FAQ</a>
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
			<h1>관리자 페이지</h1>
			<aside>
				<ul>
					<li><a href="${root}admin/product_add">상품등록</a></li>
					<li><a href="${root}admin/product_list">상품목록</a></li>
				</ul>
			</aside>
			<h2>상품 수정</h2>
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
				<label>1차 분류</label>
				<select class="category1">
					<option value="">전체</option>
				</select>
				<label>2차 분류</label>
				<select class="category2" name="category_id">
					<option value="">전체</option>
				</select>
				<input type="hidden" name="product_id" value="${adminProductOne.product_id }"/>
				 
				<div class="inputArea">
					<label for="product_price">상품가격</label>
					<input type="text" id="product_price" name="product_price" value="${adminProductOne.product_price }"/>
				</div>
				<div class="inputArea">
					<label for="product_stock">상품수량</label>
					<input type="text" id="product_stock" name="product_stock" value="${adminProductOne.product_stock }"/>
				</div>
				<div class="inputArea">
					<label for="product_name">상품명</label>
					<input type="text" id="product_name" name="product_name" value="${adminProductOne.product_name }"/>
				</div>
				<div class="inputArea">
					<label for="product_content">상품소개</label>
					<textarea rows="5" cols="50" id="product_content" name="product_content">${adminProductOne.product_content }</textarea>
				</div>
				<div class="inputArea">
					<label for="product_option1">상품옵션1</label>
					<input type="text" id="product_option1" name="product_option1" value="${adminProductOne.product_option1 }"/>
				</div>
				<div class="inputArea">
					<label for="product_option2">상품옵션2</label>
					<input type="text" id="product_option2" name="product_option2" value="${adminProductOne.product_option2 }"/>
				</div>
				<div class="inputArea">
					<label for="product_option3">상품옵션3</label>
					<input type="text" id="product_option3" name="product_option3" value="${adminProductOne.product_option3 }"/>
				</div>
				<div class="inputArea">
					<label for="product_option4">상품옵션4</label>
					<input type="text" id="product_option4" name="product_option4" value="${adminProductOne.product_option4 }"/>
				</div>
				<div class="inputArea">
					<label for="product_option5">상품옵션5</label>
					<input type="text" id="product_option5" name="product_option5" value="${adminProductOne.product_option5 }"/>
				</div>
				<div class="inputArea">
					<label for="product_image">이미지</label>
					<input type="file" id="product_image" name="file" />
					<div class="select_img">
						<img src="<spring:url value='${adminProductOne.product_image }'/>" />
						<input type="hidden" name="product_image" value="${adminProductOne.product_image}" />
						<input type="hidden" name="product_thumb" value="${adminProductOne.product_thumb}" /> 
					</div>
				</div>
				<div class="inputArea">
					<button type="submit" id="update_Btn" class="btn btn-primary">수정</button>
					<button type="button" id="back_Btn" class="btn btn-warning">취소</button>
				</div>
			</form>
		</section>
	</div><!-- #content [end] -->
</div><!-- .wrapper [end] -->



<!-- jQuery -->
<script src="${root }js/jquery-1.12.4.js"></script>
<!-- Popper.JS -->
<script src="${root }js/bootstrap/popper.js"></script>
<!-- Bootstrap JS -->
<script src="${root }js/bootstrap/bootstrap.js"></script>
<!-- CKEditor JS -->
<script src="${root }resources/ckeditor/ckeditor.js"></script>

<script>
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

// 숫자 유효성검사 
var regExp = /[^0-9]/gi;
$("#product_price").keyup(function(){ numCheck($(this)); });
$("#product_stock").keyup(function(){ numCheck($(this)); });

function numCheck(selector) {
	var tempVal = selector.val();
	selector.val(tempVal.replace(regExp, ""));
}

/* 카테고리 불러오기 시작*/
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${adminProductCategory}');
var cate1Arr = new Array();
var cate1Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
	if(jsonData[i].category_refid == "0") {
		cate1Obj = new Object();  //초기화
		cate1Obj.category_id = jsonData[i].category_id;
		cate1Obj.category_name = jsonData[i].category_name;
		cate1Arr.push(cate1Obj);
	}
}

// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1");

for(var i = 0; i < cate1Arr.length; i++) {
	cate1Select.append("<option value='" + cate1Arr[i].category_id + "'>"
		+ cate1Arr[i].category_name + "</option>"); 
}

// 1차 분류 선택시 2차 분류 출력
$(document).on("change", "select.category1", function(){
	var cate2Arr = new Array();
	var cate2Obj = new Object();
	$('.category2').attr('disabled', false);
	// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		if(jsonData[i].category_refid != "0") {
			cate2Obj = new Object();  //초기화
			cate2Obj.category_id = jsonData[i].category_id;
			cate2Obj.category_name = jsonData[i].category_name;
			cate2Obj.category_refid = jsonData[i].category_refid;
			cate2Arr.push(cate2Obj);
		}
	}
	var cate2Select = $("select.category2");
	cate2Select.children().remove();
	$("option:selected", this).each(function(){
		var selectVal = $(this).val();  
		cate2Select.append("<option value='"+selectVal+"'>전체</option>");
		for(var i = 0; i < cate2Arr.length; i++) {
			if(selectVal == cate2Arr[i].category_refid) {
			cate2Select.append("<option value='" + cate2Arr[i].category_id + "'>"
				+ cate2Arr[i].category_name + "</option>");
			}
		}
	});
});
/* 카테고리 불러오기 끝*/

// 카테고리 선 입력
var select_category_id = '${adminProductOne.category_id}';
var select_category_refid = '${adminProductOne.category_refid}';
var select_category_name = '${adminProductOne.category_name}';

if(select_category_refid == '0') {
	$(".category1").val(select_category_id);
	$(".category2").children().remove();
	$(".category2").append("<option value='" + select_category_id + "' selected='selected'>전체</option>");
	$('.category2').attr('disabled', true);
}
else{
	$(".category1").val(select_category_refid);
	$(".category2").val(select_category_id);
	$(".category2").children().remove();
	$(".category2").append("<option value='"
		+ select_category_id + "'>" + select_category_name + "</option>");
	$('.category2').attr('disabled', true);
}

// ckeditor
var ckeditor_config = {
	resize_enable : false,
	enterMode : CKEDITOR.ENTER_BR,
	shiftEnterMode : CKEDITOR.ENTER_P,
	// filebrowserUploadUrl : "../../upload/notice"
};
CKEDITOR.replace( 'product_content' );

// 이미지 미리보기
$("#product_image").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
		reader.onload = function(data) {
			$(".select_img img").attr("src", data.target.result).width(500);        
		}
		reader.readAsDataURL(this.files[0]);
	}
});
</script>

</body>
</html>