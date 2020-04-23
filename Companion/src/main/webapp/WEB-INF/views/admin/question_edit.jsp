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
    <link rel="stylesheet" href="${root }css/admin/productA.css">
    <!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<!-- CKEditor JS -->
	<script src="${root }resources/ckeditor/ckeditor.js"></script>

	<title>Companion::Q&A 수정</title>
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
				<h1>[Admin] Q&A 답변</h1>
			</div>
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data" onsubmit="return validation_submit();">
				<!-- table에 잡아넣기시작 -->
				<table>
				<thead>
				</thead>
				<tbody>
				  <tr>
				    <th><label>문의유형</label></th>
				    <td>
				    <select class="type" name="question_type_id">
					<option value="">전체</option>
					</select>
				    </td>	
				    <th>
				    	<div>
				    	<label for="title">비밀글여부</label>
				    	</div>
				    </th>
				    <td>
				    	<div>
				    	<label>${adminQuestionOne.question_secret_name }</label>
				    	<input type="hidden" name="question_secret_name" id="question_secret_name" value="${adminQuestionOne.question_secret_name }"/>
				    	</div>
				    </td>	
				    <th>
				    	<div>
				    	<label for="title">문의상태</label>
				    	</div>
				    </th>
				    <td>
				    	<div>
				    	<label>${adminQuestionOne.question_state_name }</label>
				    	<input type="hidden" name="question_state_name" id="question_state_name" value="${adminQuestionOne.question_state_name }"/>
				    	</div>
				    </td>	
				  </tr>
				  <tr>
				    <th>
				    	<div>
				    	<label for="title">주문ID</label>
				    	</div>
				    </th>
				    <td>
				    	<div>
	  					<label>${adminQuestionOne.order_id }</label>
				    	<input type="hidden" name="order_id" id="order_id" value="${adminQuestionOne.order_id }" />
				    	</div>
				    </td>	
				    <th>
				    	<div>
				    	<label for="title">회원ID</label>
				    	</div>
				    </th>
				    <td>
				    	<div>
  					    	<label>${adminQuestionOne.member_id }</label>
				    	<input type="hidden" name="member_id" id="member_id" value="${adminQuestionOne.member_id }"/>
				    	</div>
				    </td>	
				  </tr>
				  <tr>
				    <th>
				    	<div>
				    	<label for="title">상품명</label>
				    	</div>
				    </th>
				    <td colspan="3">
				    	<div>
	  					<label>${adminQuestionOne.product_name }</label>
				    	<input type="hidden" name="product_name" id="product_name" value="${adminQuestionOne.product_name }"/>
				    	</div>
				    </td>	
				    <th>
				    	<div>
				    	<label for="date">문의일</label>
				    	</div>
				    </th>
				    <td>
				    	<div>
				    	<label>${adminQuestionOne.question_date }</label>
				    	<input type="hidden" name="question_date" id="question_date" value="${adminQuestionOne.question_date }"/>
				    	</div>
				    </td>	
				  </tr>
				  <tr>
				    <th>
				    	<div>
				    	<label for="title">제목</label>
				    	</div>
				    </th>
				    <td colspan="3">
				    	<div>
				    	<label>${adminQuestionOne.question_title }</label>
				    	<input type="hidden" name="question_title" id="question_title" value="${adminQuestionOne.question_title }"/>
				    	</div>
				    </td>
				     <th>
				    	<div>
				    	<label for="date">답변일</label>
				    	</div>
				    </th>
				    <td>
				    	<div>
				    	<c:if test="${adminQuestionOne.question_answerdate == null }">
				    	</c:if>
				    	<c:if test="${adminQuestionOne.question_answerdate != null }">
			    			<label>${adminQuestionOne.question_answerdate }</label>
				    	</c:if>
				    	</div>
				    </td>		
				  </tr>
				  <tr>
				    <th>
				    	<div>
						<label for="content">내용</label>
						</div>
					</th>
				    <td colspan="5">
				    	<div>
				    	<label>${adminQuestionOne.question_content }</label>
				    	<input type="hidden" name="question_content" id="question_content" value="${adminQuestionOne.question_content }"/>
				    	</div>
				    </td>
				  </tr>
				  <tr>
				    <th>
				    	<div>
						<label for="content">답변</label>
						</div>
					</th>
				    <td colspan="5">
				    	<div>
				    	<textarea class="ckeditor" name="question_answer" id="question_answer" rows="10" cols="80">${adminQuestionOne.question_answer }</textarea>
				    	</div>
				    </td>
				  </tr>
				</tbody>
				</table>
				<!-- table에 잡아넣기끝 -->
				<div class="btn__group">
					<button type="submit" class="btn">등록</button>
					<button type="button" id="back_Btn" class="btn">취소</button>
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

/* 카테고리 불러오기 시작*/
//컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${adminQuestionType}');
var typeArr = new Array();
var typeObj = new Object();

//1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
	typeObj = new Object();  //초기화
	typeObj.question_type_id = jsonData[i].question_type_id;
	typeObj.question_type_name = jsonData[i].question_type_name;
	typeArr.push(typeObj);
}

//1차 분류 셀렉트 박스에 데이터 삽입
var typeSelect = $("select.type");

for(var i = 0; i < typeArr.length; i++) {
	typeSelect.append("<option value='" + typeArr[i].question_type_id + "'>"
		+ typeArr[i].question_type_name + "</option>"); 
}

var select_type_id = '${adminQuestionOne.question_type_id}';
var select_type_name = '${adminQuestionOne.question_type_name}';
$(".type").val(select_type_id);


//validation
function validation_submit() {
	if(CKEDITOR.instances.question_answer.getData() == ""){
		alert('답변을 입력해주세요.');
		$('#question_answer').focus();
		return false;
	}
};
</script>

</body>
</html>