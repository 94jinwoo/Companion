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
	                                        <a class="nav-link" href="${root }mypagechk">마이페이지</a>
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
		<div class="categories">
			<a href="${root }mypagechk"> <i class="fas fa-user"></i> 마이페이지</a>
			<span>></span> 
			<a href="${root }mypurchaselist"> <i class="fas fa-clipboard"></i> 주문내역</a>
			<span>></span> 
			<a href="#"> <i class="fas fa-edit"></i> 후기작성</a>
			<hr class="mb-4">
		</div>	
		<!-- section [start] -->
		<section class="section">
			<div class="main--title">
				<h1>상품 후기작성</h1>
			</div>
			<form name="myReview" role="form" method="post" autocomplete="off" enctype="multipart/form-data">
				<input type="hidden" name="product_id" id="product_id" value="${product_id }">
				<table class="table">
				<thead></thead>
				<tbody>
				  <tr>
				    <th>
				    	<div>
				    	<label for="review_title">제목</label>
				    	</div>
				    </th>
				    <td>
				    	<div>
				    	<input type="text" name="review_title" id="review_title" class="input--text textT" placeholder="제목을 입력해 주세요."/>
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
					    	<textarea name="review_content" id="review_content" rows="10" cols="80" class="input--text textA"></textarea>
				    	</div>
				    </td>
				  </tr>
				  <!-- 이미지 업로드 구현해보기 -->
				  <tr>
				    <th>
				    	<div>
						<label for="question_image">사진 첨부</label>
						</div>
					</th>
				    <td>
				    	<div class="file-add">
				    	<input type="file" multiple name="file" id="question_image"/>
						<div class="inputArea">
							<div class="select_img"><img src=""/></div>
						</div>
					</div>
				    </td>
				    
				  </tr>
				  
				</tbody>
				</table>
				<div class="btnbox">
					<button type="button" id="review_btn" class="Cbtn">등록</button>
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
$('#question_image').change(function(){
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

$("#review_btn").click(function(){
	var review_title=$("#review_title").val();
	var review_content=$("#review_content").val();
	if(review_title=="") {
		alert("입력된 제목이 없습니다.");
		return;
	}
	if(review_content==""){
		alert("입력된 내용이 없습니다.");
		return;
	}
	document.myReview.submit();
});
</script>

</body>
</html>