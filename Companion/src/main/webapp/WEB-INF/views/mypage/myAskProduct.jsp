<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>컴패니언::Companion</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/main.css">
    <link rel="stylesheet" href="${root }css/mypage/questionF.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
        integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
        crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
        integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
        crossorigin="anonymous"></script>
</head>
<body>
<!-- .wrapper [start] -->
<div class="wrapper">
	<!-- Sidebar -->
	<jsp:include page="../common/sidebar.jsp"/>
	<!-- #content [start] -->
	<div id="content">
		<!-- nav [start] -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<!-- .container-fluid [start] -->
			<div class="container-fluid">
				<!-- menu toggle button [start] -->
			    <button type="button" id="sidebarCollapse" class="btn btn-info">
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
			        <c:choose>
	                            <c:when test="${sessionScope.memberVo.member_id==null }">
	                                <script>
	                                	window.location.href="login";
	                                </script>
	                            </c:when>
	                            <c:otherwise>
	                                <ul class="nav navbar-nav ml-auto">
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypurchaselist">주문내역</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagereserve">예약조회</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mycart">장바구니</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagequestion">문의조회</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }mypagechk">나의정보</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }logout">로그아웃</a>
	                                    </li>
	                                </ul>
	                            </c:otherwise>
	                            
	                        </c:choose>
			    </div>
			    <!-- top menu bar [end] -->
			</div>
			<!-- .container-fluid [end] -->
		</nav>
		<!-- nav [end] -->
		
		<!-- section [start] -->
		<section class="section">
			<div class="main--title">
				<h1>상품 문의하기</h1>
			</div>
			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
				<input type="hidden" name="product_id" id="product_id" value="${product_id }">
				<input type="hidden" name="order_id" id="order_id" value="${order_id }">
				<input type="hidden" name="question_type_id" id="question_type_id" value="">
				  <!-- 문의 유형 select -->
				  <!-- 문의 유형 select -->
				<table class="table">
				<thead></thead>
				<tbody>
					<tr>
						<th><label for="selectOption">문의유형</label></th>
						<td>
							<div class="opBox">
			                    	<select name="selectOption" id="selectOption" class="form-control selec" onchange="changeOption()">
			                    		<option value="" selected disabled>문의 유형 선택</option>
			                    		<option value="0">교환</option>
			                    		<option value="1">환불</option>
			                    		<option value="2">출하 전 취소</option>
			                    		<option value="3">배송</option>
			                    		<option value="4">불량 A/S</option>
			                    		<option value="5">주문/결제</option>
			                    		<option value="6">상품/재입고</option>
			                    		<option value="7">쿠폰/적립금</option>
			                    		<option value="8">회원 관련</option>
			                    		<option value="9">기타 문의</option>
			                    	</select>				  
						  	</div>
						</td>
						
					</tr>
				  <tr>
				    <th>
				    	<div>
				    	<label for="ask_title">제목</label>
				    	</div>
				    </th>
				    <td>
				    	<div>
				    	<input type="text" name="ask_title" id="ask_title" class="input--text textT" placeholder="제목을 입력해 주세요."/>
				    	</div>
				    </td>	
				  </tr>
				  <tr>
				    <th>
				    	<div>
						<label for="content">내용</label>
						</div>
					</th>
				    <td>
				    	<div>
					    	<textarea name="ask_product" id="ask_product" rows="10" cols="80" class="input--text textA"></textarea>
				    	</div>
				    </td>
				  </tr>
				  <!-- 이미지 업로드 구현해보기 -->
				  <%-- <tr>
				    <th>
				    	<div>
						<label for="article_image">파일 첨부</label>
						</div>
					</th>
				    <td>
				    	<div class="file-add">
				    	<input type="file" name="file" id="question_image"/>
						<div class="select_img">
							<img alt="원본이미지" src="<spring:url value='${adminQuestionOne.question_image }'/>"/>
							<input type="hidden" name="question_image" value="${adminQuestionOne.question_image }"/>
						</div>
					</div>
				    </td>
				  </tr> --%>
				</tbody>
				</table>
				<div class="btnbox">
					<button type="button" id="ask_btn" class="Cbtn">등록</button>
					<button type="button" id="back_btn" class="Cbtn">취소</button>
				</div>
			</form>
			
		</section>
		<!-- section [end] -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
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
$("#back_btn").click(function(){
	history.back();
});

$("#ask_btn").click(function(){
	var product_id=$("#product_id").val();
	var order_id=$("#order_id").val();
	var question_type_id=$("#question_type_id").val();
	var question_title=$("#ask_title").val();
	var question_content=$("#ask_product").val();
	var askData={"product_id" : product_id, "order_id" : order_id, "question_type_id" : question_type_id, "question_title" : question_title, "question_content" : question_content};
	if(ask_title=="") {
		alert("입력된 제목이 없습니다.");
		return;
	}
	if(ask_product==""){
		alert("입력된 내용이 없습니다.");
		return;
	}
	$.ajax({
		type : "POST",
		url : "/companion/askProduct",
		data : askData,
		success : function(result){
			if(result==1){
				alert("문의 등록완료");
				history.back();
			}else{
				alert("에러.");
			}
		}
	});
});

/* 문의 유형 선택 */
function changeOption(){
	var changeOptionValue=document.getElementById("selectOption");
	
	var selectValue=changeOptionValue.options[changeOptionValue.selectedIndex].value;
	document.getElementById("question_type_id").value=selectValue;
}
				  
</script>

</body>
</html>