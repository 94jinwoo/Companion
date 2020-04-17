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
    <link rel="stylesheet" href="${root }css/admin/productA.css">
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
			                <a class="nav-link" href="${root }admin/product_list">상품목록</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="${root }admin/product_add">상품등록</a>
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
				<h1>[Admin] 상품정보 수정</h1>
			</div>
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data" onsubmit="return validation_submit();">
				<input type="hidden" name="product_id" value="${adminProductOne.product_id }"/>
				<table>
				<thead>
				</thead>
				<tbody>
				  <tr>
				  	<th><label for="product_name">상품명</label></th>
				  	<td colspan="3">
						<div class="inputAreaName">
						<input type="text" id="product_name" name="product_name"  value="${adminProductOne.product_name }"/>
						</div>
					</td>
				  </tr>
				  <tr>
				    <th><label>1차 분류</label></th>
				    <td>
				    <select class="category1">
					<option value="">전체</option>
					</select>
				    </td>
				    <th><label>2차 분류</label></th>
				    <td>
				    <select class="category2" name="category_id">
					<option value="">전체</option>
					</select>
					</td>
				  </tr>
				  <tr>
				    <th><label for="product_price">상품가격</label></th>
				    <td>
					    <div class="inputArea">
						<input type="text" id="product_price" name="product_price" value="${adminProductOne.product_price }" />
						</div>
				    </td>
				    <th><label for="product_stock">상품수량</label></th>
				    <td>
					    <div class="inputArea">
						<input type="text" id="product_stock" name="product_stock" value="${adminProductOne.product_stock }" />
						</div>
				    </td>
				  </tr>
				  <tr>
				    <th><label for="product_option1">상품옵션1</label></th>
				    <td>
					    <div class="inputArea">
						<input type="text" id="product_option1" name="product_option1" value="${adminProductOne.product_option1 }"/>
						</div>
				    </td>
				    <th><label for="product_option2">상품옵션2</label></th>
				    <td>
					    <div class="inputArea">
						<input type="text" id="product_option2" name="product_option2" value="${adminProductOne.product_option2 }"/>
						</div>
				    </td>
				    <th><label for="product_option3">상품옵션3</label></th>
				    <td>
					    <div class="inputArea">
						<input type="text" id="product_option3" name="product_option3" value="${adminProductOne.product_option3 }"/>
						</div>
				    </td>
				  </tr>
				  <tr>
				    <th><label for="product_option4">상품옵션4</label></th>
				    <td>
					    <div class="inputArea">
						<input type="text" id="product_option4" name="product_option4" value="${adminProductOne.product_option4 }"/>
						</div>
				    </td>
				    <th><label for="product_option5">상품옵션5</label></th>
				    <td>
					    <div class="inputArea">
						<input type="text" id="product_option5" name="product_option5" value="${adminProductOne.product_option5 }"/>
						</div>
				    </td>
				  </tr>
				  <tr class="detailContent">
				    <th><label for="product_content">상품소개</label></th>
				    <td colspan="5">
						<div class="inputArea">
						<textarea class="ckeditor" rows="5" cols="50" id="product_content" name="product_content">${adminProductOne.product_content }</textarea>
						</div>
					</td>
				  </tr>
				  
				  <tr class="detailImg">
				    <th><label for="file">이미지첨부</label></th>
				    <td colspan="5">
						<div class="inputArea">
							<input type="file" id="product_image" name="file" />
							<div class="select_img">
								<img src="<spring:url value='${adminProductOne.product_image }'/>" />
								<input type="hidden" name="product_image" value="${adminProductOne.product_image}" />
								<input type="hidden" name="product_thumb" value="${adminProductOne.product_thumb}" /> 
							</div>
						</div>
					</td>
				  </tr>
				</tbody>
			</table>
			
			<div class="btn__group">
				<button type="button" id="modify_btn" class="btn">수정</button>
				<button type="button" id="back_Btn" class="btn">취소</button>
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

//수정 버튼
var formObj = $("form[role='form']");
$("#modify_btn").click(function(){
	$(".category2").attr('disabled', false);
	formObj.submit();
});

// 취소 버튼
$("#back_Btn").click(function(){
	history.back();
});

//이미지 미리보기
$("#product_image").change(function(){
	if(this.files && this.files[0]) {
		var reader = new FileReader;
		reader.onload = function(data) {
			$(".select_img img").attr("src", data.target.result).width(500);        
		}
		reader.readAsDataURL(this.files[0]);
	}
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
	$(".category2").attr('disabled', false);
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
	$(".category2").attr('disabled', true);
}
else{
	$(".category1").val(select_category_refid);
	$(".category2").val(select_category_id);
	$(".category2").children().remove();
	$(".category2").append("<option value='"
		+ select_category_id + "'>" + select_category_name + "</option>");
	$(".category2").attr('disabled', true);
}

//validation
function validation_submit() {
	if($("#product_name").val() == ""){
		alert('상품명을 입력해주세요.');
		$('#product_name').focus();
		return false;
	}
	if($(".category1 option:selected").val() == ""){
		alert('1차 분류를 선택해주세요.');
		return false;
	}
	if($(".category2 option").size() != 1 && $(".category2 option").index($(".category2 option:selected")) == 0){
		alert('2차 분류를 선택해주세요.');
		return false;
	}
	if($("#product_price").val() == ""){
		alert('가격을 입력해주세요.');
		$('#product_price').focus();
		return false;
	}
	if($("#product_stock").val() == ""){
		alert('수량을 입력해주세요.');
		$('#product_stock').focus();
		return false;
	}
	if(CKEDITOR.instances.product_content.getData() == ""){
		alert('내용을 입력해주세요.');
		$('#product_content').focus();
		return false;
	}
};
</script>

</body>
</html>