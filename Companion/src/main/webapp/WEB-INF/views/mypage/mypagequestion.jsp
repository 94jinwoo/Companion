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
    <link rel="stylesheet" href="${root }css/mypage/mypagequestion.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
        integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
        crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
        integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
        crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
        
        <!-- Sidebar  -->
		<jsp:include page="../common/sidebar.jsp"/>

        <!-- Page Content  -->
        <div id="content">
            <div id="container">

	            <nav class="navbar navbar-expand-lg navbar-light bg-light">
	                <div class="container-fluid">
	
	                    <button type="button" id="sidebarCollapse" class="btn btn-info">
	                        <i class="fas fa-align-left"></i>
	                        <span>메뉴</span>
	                    </button>
	                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
	                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
	                        aria-expanded="false" aria-label="Toggle navigation">
	                        <i class="fas fa-align-justify"></i>
	                    </button>
	                    
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
	                                        <a class="nav-link active" href="${root }mypagequestion">문의조회</a>
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
	                </div>
	            </nav>
	            <!-- .categories start -->
	            <div class="categories">
                <a href="#homeSubmenu">
                	<i class="fas fa-clipboard"></i>
                    문의조회
                </a>
                <hr class="mb-4">
            	</div>
            	<!-- .categories start -->
	            <!-- section start -->
				<section class="section">
		            <!-- main title -->
					<div class="main--title">
							<h1>나의 문의내역</h1>
	                </div>
	            	<ul class="list-group list-unstyled components">
						<c:forEach items="${questionList }" var="bean">
							<ul>
								<li class="list-group-item list-group-item-primary">
									<div class="row">
										<!-- 나중에 해당 상품페이지로 이동하게 앵커달기 -->
										<div class="col-2">
											<a href="${root }order/productDetail?idx=${bean.product_id }" style="text-decoration:none">
												<img id="proImg" src="${bean.product_thumb }"alt="Img"/>
											</a>
										</div>
										<div class="col-4">
											<a href="${root }order/productDetail?idx=${bean.product_id }">
												${bean.product_name }
											</a>
										</div>
										<c:choose>
											<c:when test="${bean.question_type_id=='0' }">
												<div class="col-2">교환</div>
											</c:when>
											<c:when test="${bean.question_type_id=='1' }">
												<div class="col-2">환불</div>
											</c:when>
											<c:when test="${bean.question_type_id=='2' }">
												<div class="col-2">출하 전 취소</div>
											</c:when>
											<c:when test="${bean.question_type_id=='3' }">
												<div class="col-2">배송</div>
											</c:when>
											<c:when test="${bean.question_type_id=='4' }">
												<div class="col-2">불량 A/S</div>
											</c:when>
											<c:when test="${bean.question_type_id=='5' }">
												<div class="col-2">주문/결제</div>
											</c:when>
											<c:when test="${bean.question_type_id=='6' }">
												<div class="col-2">상품/재입고</div>
											</c:when>
											<c:when test="${bean.question_type_id=='7' }">
												<div class="col-2">쿠폰/적립금</div>
											</c:when>
											<c:when test="${bean.question_type_id=='8' }">
												<div class="col-2">회원 관련</div>
											</c:when>
											<c:when test="${bean.question_type_id=='9' }">
												<div class="col-2">기타 문의</div>
											</c:when>
											<c:when test="${bean.question_type_id=='100' }">
												<div class="col-2">상품/문의</div>
											</c:when>
										</c:choose>
										<div class="col-2">${bean.question_date }</div>
										<div class="col-2">
											<button class="btn btn-primary" style="width:120px;" onclick="toggleQuestion(${bean.question_id })" id="questionBtn_${bean.question_id }">
												문의내용 보기
											</button>
										</div>
									</div>
								</li>
								<ul class="list-group-item list-group-item-secondary list-unstyled" id="${bean.question_id }" style="display:none">
										<li class="row">
											<div class="col-1">Q.</div>
											<div class="col-11">
												${bean.question_title }
											</div>
											<div class="col-1"></div>
											<div class="col-10">
												${bean.question_content }
											</div>
				                           	<div class="col-1">
				                           		<button onclick="deleteQuestion(${bean.question_id})">삭제</button>
				                           	</div>
										</li>
<c:choose>
<c:when test="${bean.question_answer != null }">
									<li class="row">
			                           	<div class="col-1">A.</div>
			                           	<div class="col-10">
			                           		${bean.question_answer }
			                           	</div>
									</li>
</c:when>
<c:otherwise>
									<li class="row">
			                           	<div class="col-1">A.</div>
			                           	<div class="col-10">
			                           		답변 대기중입니다. 신속히 답변드릴 수 있도록 하겠습니다.
			                           	</div>
									</li>
</c:otherwise>
</c:choose>
								</ul>
							</ul>
						</c:forEach>	            
	            	</ul>
	            </section>
			</div>
			
        <div id="footer">
            <!-- test main content end-->
            <hr class="mb-2">
            <footer class="companion-footer">
                    <div class="paragraph-group">
                        <p>상호:COMPANION | 대표 : 최길동 | 개인정보보호관리책임자 : 최길동 | 전화 : 02-000-000 ㅣ 이메일 : <a href="mailto:companion@companion.com" target="_top">companion@companion.com</a></p>
                        <p>주소:서울특별시 서초구 강남대로 459 (서초동, 백암빌딩) 3층 | 사업자등록번호 : 000-00-00000 | 통신판매 : 2020-서울강남-0000</p>
                        <p>호스팅제공자:(주)Companion</p>
                        <br/>
                        <a href="#">[홈페이지 이용약관]</a> <a href="#">[개인정보취급방침]</a><br/>
                        <p>Copyright ⓒ 2020 COMPANION All rights reserved.</p>
                    </div>
            </footer>
        </div>

		</div>
	</div>
	<!-- content -->
	
	<!-- script start -->
	<!-- jQuery -->
    <script src="${root }js/jquery-1.12.4.js"></script>
	<!-- Popper.JS -->
    <script src="${root }js/bootstrap/popper.js"></script>
    <!-- Bootstrap JS -->
    <script src="${root }js/bootstrap/bootstrap.js"></script>
    <!-- MAIN JS -->
    <script src="${root }js/main.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
        
        function toggleQuestion(question_id){
        	if($('#'+question_id).css("display")=="none"){
        		$('#'+question_id).show();
        		$('#questionBtn_'+question_id).text("닫 기");
        	}else{
        		$('#'+question_id).hide();
        		$('#questionBtn_'+question_id).text("문의내용 보기");
        	}
        }
        
        function deleteQuestion(question_id){
        	var confirm_val=confirm("정말 삭제하시겠습니까??");
        	
        	if(confirm_val){
        		$.ajax({
        			type : "POST",
        			url : "/companion/mypage/deleteOneQuestion",
        			data : {question_id : question_id},
        			success : function(result){
        				if(result==0){
        					alert("삭제실패");
        				}else{
        					alert("삭제완료");
        					location.reload();
        				}
        			}
        		});
        	}
        }
    </script>
    <!-- script end -->

</body>
</html>