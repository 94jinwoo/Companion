<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${root}css/bootstrap/bootstrap.css">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="${root}css/main.css">
<link rel="stylesheet" href="${root}css/order/goodsdetail.css">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
		<!-- jQuery -->
	<script src="${root}js/jquery-1.12.4.js"></script>
	<!-- Popper.JS -->
	<script src="${root}js/bootstrap/popper.js"></script>
	<!-- Bootstrap JS -->
	<script src="${root}js/bootstrap/bootstrap.js"></script>
	<!-- MAIN JS -->
	<script src="${root }js/main.js"></script>
</head>

<body>

	<div class="wrapper">
		<!-- Sidebar  -->
		<jsp:include page="../common/sidebar.jsp" />

		<!-- Page Content  -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="btn btn-info">
						<i class="fas fa-align-left"></i> <span>메뉴</span>
					</button>
					<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
						type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fas fa-align-justify"></i>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="nav navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link active"
								href="/companion/order/productMain?c=100&num=1">사료</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/companion/order/productMain?c=200&num=1">간식</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/companion/order/productMain?c=300&num=1">장난감</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/companion/order/productMain?c=400&num=1">미용용품</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/companion/order/productMain?c=500&num=1">목욕용품</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/companion/order/productMain?c=600&num=1">위생용품</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/companion/order/productMain?c=700&num=1">산책용품</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<div class="categories">
				<a href="/companion/order/productMain?c=100"> <i
					class="fas fa-shopping-cart"></i> 쇼핑하기
				</a> <span>></span> <a href="/companion/order/productMain?c=100"> 사료
				</a>
				<hr class="mb-4">
			</div>

			<!-- Right-Scrollbar  -->
			<jsp:include page="../common/scrollbar.jsp" />

			<!-- main content start -->
			<div class="maincontent">
				<div class="row">
					<div class="col-md-5" id="imgbox">
						<div class="goodsImg">
							<!-- lay 380x440, imgsize 355x415 -->
							<!-- 이미지 반 글 반 먹고 나머지는 밑에 푸터처럼. -->
							<%-- 	<img src="${root }imgs/shopping/dogTestImage.jpg"
								class="img-fluid" alt="Responsive image"> --%>
							<%-- 		<p><img src="${productDetailOne.product_thumb }" class="img-fluid" alt=""/></p> --%>
							<img src="${productDetailOne.product_image }" alt="왜안돼?" />
							<!-- 이미지는 DB에 이미지 경로를 넣어야 함.  -->
						</div>
					</div>
					<div class="col-md-7" id="descrip">
						<!--  상품 정보 -->
						<h2 class="goods-title">${productDetailOne.product_name }</h2>
							<!-- 상품 번호 ${productDetailOne.product_id } -->
						<%-- <h4>[ 카테고리NUM=${productDetailOne.category_id } ]</h4> --%>
						<p class="goos-text">상품 설명은 하단에 있습니다.</p><br/>

						<!-- 셀렉트박스 옵션 값 가져오기.  -->

						<form name="formName" id="formId" method="POST"
							action="${root }order/orderPurchase?idx=${productDetailOne.product_id }"
							role="form">
							<div class="goods-text row">
								<div class="col-sm-4 title">배송비</div>
								<div class="col-sm-8">2,500원 (5만원이상 구매 시 무료)</div>
								<div class="col-sm-4 title">재 고</div>
								<div class="col-sm-8">${productDetailOne.product_stock }</div>
								<input type="hidden" name="product_stock"
									value="${productDetailOne.product_stock }" />
								<div class="col-sm-4 title">옵션</div>
								<div class="col-sm-8">

									<select name="selectBox" id="selectBox"
										class="form-control col-sm-8"
										onchange="getSelectValue(this.form);">
										<!-- 옵션이랑 수량 어떻게 처리???  -->
										<option value="옵션 1">옵션1</option>
										<option value="옵션 2">옵션2</option>
										<option value="옵션 3">옵션3</option>
										<option value="옵션 4">옵션4</option>
										<option value="옵션 5">옵션5</option>
									</select> <input type="hidden" name="product_option"> <input
										type="hidden" name="optionValue">



								</div>
								<!-- 수량도 받아서 처리해야함.  -->
								<div class="col-sm-4 title">수량</div>
								<div class="col-sm-8">
									<!-- 수량 -->
									<table class="col-sm-8">
										<tr>
											<td><input type="text" name="order_detail_quantity"
												value="1" id="order_detail_quantity"
												class="num form-control" /></td>
											<td>
												<div width="10" height="10" class="bt_down">
													<button type="button" class="btn">▼</button>
												</div>
											</td>
											<td>
												<div width="10" height="10" class="bt_up">
													<button type="button" class="btn">▲</button>
												</div>
											</td>
										</tr>
									</table>
									<!-- 수량 -->

								</div>
								<div class="col-sm-4 title">가격</div>
								<div class="col-sm-8">${productDetailOne.product_price }</div>
								<!-- btn group start-->
								<div class="btn--group">
									<!-- 구매 로그인 세션 검사 -->
									<c:choose>
										<c:when test="${memberVo.member_id==null}">
											<a class="btn btn-primary btn-lg active navbar-btn mx-center"
												href="${root }login" role="button" aria-pressed="true">구매하기</a>
										</c:when>
										<c:when test="${memberVo.member_id!=null}">
											<!-- product_id 정보 GET 방식으로 넘길것.  -->
											<button class="btn btn-primary btn-lg" id="purchaseBtn"
												type="submit">구매하기</button>
											<%-- 										<button type="submit"> href="${root }order/orderPurchase?idx=${productDetailOne.product_id }" role="button" type="submit" aria-pressed="true">구매하기</a> </button> --%>
										</c:when>
									</c:choose>
									<!-- 구매 로그인 세션 검사 -->

									<!-- 장바구니  -->

									<c:choose>
										<c:when test="${memberVo.member_id==null }">
											<button type="button" class="btn btn-primary btn-lg"
												onclick="location.href= '${root}login'">장바구니=로그인.</button>
										</c:when>
										<c:when test="${memberVo.member_id!=null}">
											<!-- 장바구니 로그인 세션 검사. -->
											<button type="button" id="cartBtn"
												class="btn btn-primary btn-lg" data-toggle="modal"
												data-target="#exampleModalCenter">장바구니에 담기</button>
											<input type="hidden" name="product_id"
												value="${productDetailOne.product_id }" />
										</c:when>
									</c:choose>
									<!-- Modal(장바구니_) -->
									<div class="modal" id="exampleModalCenter" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">장바구니에
														담기</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>

												<div class="modal-body">
													${productDetailOne.product_name } 을 장바구니에 담을까요?.<br>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">취소</button>
													<button onclick="goForm()" type="submit"
														class="btn btn-primary">확인</button>
												</div>
											</div>
										</div>
									</div>
									<!-- modal-(장바구니) end -->
									<!-- 좋아요... 만들기 시러... -->

									<!-- 장바구니 버튼 눌렀을 때 넘어가야 하는 것들 -->
									<input type="hidden" name="cart_quantity" id="cart_quantity"
										value="1" /> <input type="hidden" name="cart_option"
										id="cart_option" value="1" /> <input type="hidden"
										name="order_detail_option" id="order_detail_option" value="1" />
									<!-- 장바구니 버튼 눌렀을 때 넘어가야 하는 것들 end -->
									<!--로그인 검사  -->
									<c:choose>
										<c:when test="${memberVo.member_id!=null }">
											<button id="like_btn" type="button"
												class="btn btn-outline-danger btn-lg" data-toggle="modal"
												data-target=".bd-example-modal-sm">♥ ( ${productDetailOne.like_id } )</button>
										</c:when>
										<c:when test="${memberVo.member_id==null }">
											<button id="noneLgnLike_btn" type="button"
												class="btn btn-outline-danger" data-toggle="modal"
												data-target=".bd-example-modal-sm">좋아요! (
												${productDetailOne.like_id } )</button>
										</c:when>
									</c:choose>
								</div>
								<!-- btn group end-->
								<!-- 상품 추천 목록.  -->
								<!--상품 추천 목록.  -->
						</form>
					</div>
					<!-- product Detail 페이지로 넘어올 떄 추천 상품 목록을 가지고 넘어와야 함. 해당 상품에 대해서! 로그인 안해도! -->

				</div>
			</div>

			<div class="p-12 rounded mb-5">
				<!-- Lined tabs-->
				<ul id="myTab2" role="tablist"
					class="nav nav-tabs nav-pills with-arrow lined flex-column flex-sm-row text-center">
					<li class="nav-item flex-sm-fill"><a id="product-info-tab"
						data-toggle="tab" href="#product-info" role="tab"
						aria-controls="product-info" aria-selected="true"
						class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0 active">상품설명</a>
					</li>
					<li class="nav-item flex-sm-fill"><a id="post-use-tab"
						data-toggle="tab" href="#post-use" role="tab"
						aria-controls="post-use" aria-selected="false"
						class="nav-link text-uppercase font-weight-bold mr-sm-3 rounded-0">이용후기</a>
					</li>
					<li class="nav-item flex-sm-fill"><a id="contact2-tab"
						data-toggle="tab" href="#contact2" role="tab"
						aria-controls="contact2" aria-selected="false"
						class="nav-link text-uppercase font-weight-bold rounded-0">문의하기</a>
					</li>
				</ul>
				<div id="myTab2Content" class="tab-content">
					<div id="product-info" role="tabpanel" aria-labelledby="home-tab"
						class="tab-pane fade py-5 show active">
						<!-- 상품설명 start   -->
						<!-- 상품설명 -->
						<div class="inputAreaC">${productDetailOne.product_content }
						</div>

					</div>
					<!-- 상품설명   end -->

					<!-- product-info end -->

					<div id="post-use" role="tabpanel" aria-labelledby="post-use-tab"
						class="tab-pane fade px-4 py-5">
						<nav class="navbar navbar-expand-lg">
							<h2 class="navbar-brand">
								이용후기
								<c:forEach begin="1" end="1" items="${orderReviewList }"
									var="bean">${bean.review_count }</c:forEach>
								건
							</h2>
							<div class="collapse navbar-collapse" id="navbarText">
								<ul class="navbar-nav mr-auto">
									<li class="nav-item"><a class="nav-link" href="#"></a></li>
								</ul>
								<span class="navbar-text"> <a href="#" class="mx-1">최신순</a>
									<span>/</span> <a href="#" class="mx-1">평점높은순</a> <span>/</span>
									<a href="#" class="mx-1">평점낮은순</a>

								</span>
							</div>
						</nav>
						<hr class="my-1">


						<div class="row">
							<!-- 후기글 start -->
							<div class="col-lg-12">
								<table class="table">
									<thead>
										<tr>
											<th scope="col" class="border-0 bg-light">
												<div class="p-2 px-3 text-uppercase">이용후기</div>
											</th>
											<th scope="col" class="border-0 bg-light">
												<div class="py-2 text-uppercase">구매상품 : (product_name)</div>
											</th>
											<th scope="col" class="border-0 bg-light">
												<div class="p-2 px-3 text-uppercase">아이디(member_id)</div>
											</th>
											<th scope="col" class="border-0 bg-light">
												<div class="py-2 text-uppercase">날짜 (후기작성date)</div>
											</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${orderReviewList }" var="bean">
											<!--C;FOREACH  -->
											<tr>
												<th scope="row" class="border-0">
													<div class="p-2">
														<img src="#" alt="이미지90x90" width="90"
															class="img-fluid rounded shadow-sm">
														<div class="ml-3 d-inline-block align-middle">
															<h5 class="mb-0">
																<a href="#"
																	class="text-dark d-inline-block align-middle">
																	${bean.article_title } </a>
															</h5>
															<span
																class="text-muted font-weight-normal font-italic d-block">
																옵션 (product_option1) </span>
														</div>
													</div>
												</th>

												<td class="border-0 align-middle"><strong>
														[${productDetailOne.product_name }] 상품 번호
														${bean.product_id }
												</strong></td>
												<!-- 상품번호 출력 -->

												<td class="border-0 align-middle"><strong>${bean.member_id }</strong>
												</td>
												<!-- 후기작성자 아이디 출력 -->

												<td class="border-0 align-middle"><a href="#"
													class="text-dark">${bean.article_date }</a></td>
												<!-- 후기작성날짜 출력 -->

											</tr>

										</c:forEach>
										<!--C;FOREACH  -->
									</tbody>
								</table>
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">4</a></li>
									<li class="page-item"><a class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</div>
							<!-- col-lg-12 end -->
						</div>
						<!-- row end -->
					</div>
					<!-- #post-use end  -->
					<!-- 후기글 End -->



					<!-- 문의글 start-->
					<div id="contact2" role="tabpanel" aria-labelledby="contact-tab"
						class="tab-pane fade px-4 py-5">
						<div class="row">
							<div class="col-lg-12" id="inquiry">
								<!-- 테이블로 넣자  -->
								<div class="row">
									<div class="col-sm-6">
										<h4>문의하기</h4>
									</div>
									<div class="col-sm-6">구매하시려는 상품에 대해 궁금하신 점이 있으신 경우 문의 해
										주세요</div>

								</div>


								<div id="reply">
									<c:if test="${memberVo.member_id==null}">
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#exampleModal">문의하기</button>
										<div class="modal" id="exampleModal" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">문의글 작성</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<p>소감을 남기려면 로그인 해주세요!</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">닫기</button>
														<button type="button" class="btn btn-primary"
															onclick="location.href= '${root}login'">로그인하기</button>
													</div>
												</div>
											</div>
										</div>

										<section class="replyList">
											<!-- null 값이어도 값이 들어가야함. -->
											<!-- 근데 뭐가 문제인지 모르겠음. -->
											<table class="table--replyList">
												<thead>
												</thead>
												<tbody>

												</tbody>
											</table>
										</section>
									</c:if>
									<c:if test="${memberVo.member_id!=null}">
										<!-- 문의하기 창 생셩 modal test -->
										<button id="questionModal" type="button" class="btn btn-primary">문의하기</button>
										<div class="modal" id="questionModalForm" tabindex="-1"
											role="dialog" aria-labelledby="questionModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="questionModalLabel">문의글
															작성</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="replyForm">
														<form role="form" method="post" autocomplete="off">
															<div class="modal-body">
																<input type="hidden" name="product_id" id="product_id"
																	value="${productDetailOne.product_id}" /> <input
																	type="hidden" name="member_id" id="member_id"
																	value="${memberVo.member_id }" />
																<div class="form-group input_area">
																	<label for="question_title" id="question_label"
																		class="col-form-label">문의제목</label> <input type="text"
																		name="question_title" class="form-control"
																		id="question_title">
																	<textarea name="question_content" class="form-control"
																		id="question_content" placeholder="문의하실 내용을 입력해주세요."></textarea>
																	<label for="question_secret2" id="question_secret2" class="col-form-label">공개글</label>
																	<input type="radio" name="question_secret_id" value="0" checked="checked">
																	<label for="question_secret1" id="question_secret1" class="col-form-label">비밀글</label>
																	<input type="radio" name="question_secret_id" value="1" >
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">닫기</button>
																<button type="button" class="btn btn-primary"
																	id="reply_btn">문의글 달기</button>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>

										<!-- 문의하기 창 생셩 modal test -->
									</c:if>
									<!-- 여기에 문의글 ajax 들어감 -->
									<section class="replyList">
										<h4>최근 문의글 목록</h4>
	
    <iframe name="question.jsp" id="question.jsp" src="${root }order/productDetail/ReplyList?product_id=${productDetailOne.product_id}" width="1000px" height="700px"  frameborder="0" scrolling="no"></iframe>
						
										 
									</section>
									<!-- 여기에 문의글 ajax 들어감. -->
								</div>
								<!-- reply end -->
							</div>
							<!-- col-lg-12 end -->
						</div>
						<!-- row end -->
					</div>
					<!-- 문의 엔드 -->
				</div>
				<!-- End lined tabs -->

				<!-- 위치테스트여 -->
				<table class="recomB">
					<thead>
						<tr>
							<!-- <td>thumb</td>
									<td>thumb</td>
									<td>thumb</td>
									<td>thumb</td>
									<td>ID</td>
									<td>thumb</td> -->
						</tr>
						<tr>
							<th colspan="5">다른 고객이 함께 본 상품</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<!-- 상품 추천 목록 LIST UPDATE  -->
							<c:forEach items="${productRecommendList }" var="bean">
								<td><a
									href="${root }order/productDetail?idx=${bean.product_id}">
										<img src="${bean.product_image }"
										width="180" height="60" class="img-fluid"
										alt="dummy에 이미지가 없어서 그래요.." style="display: block;">
										<p style="text-align: center;">${bean.product_name }</p>
								</a></td>
							</c:forEach>
						</tr>
					</tbody>
				</table>

				<!-- 위치테스트여 -->
							<!-- 조회한 상품 세션 저장용입니당. -->
							<%
							int product_id = (int)(request.getAttribute("Product_id"));
							session.setAttribute("Session",product_id);
							
							ArrayList<Object> list = new ArrayList<Object>();
							list = (ArrayList)session.getAttribute("productList");

							for(int i=0;i<list.size();i++){
									out.println(list.get(i));
								}
							%>
							<!-- 조회한 상품 세션 저장용입니당. -->
			</div>
			<!-- #myTab2Content end-->
		</div>
		<!--main content END  -->
		<!-- 후기글 -->
		<!-- 문의글 -->
		<!-- 3tap layer end -->

		<!-- Footer  -->
		<jsp:include page="../common/footer.jsp" />
		<!-- Footer end -->
	</div>
	<!-- #content end -->
	<!-- wrapper end -->

	<!-- jQuery -->
	<script src="${root}js/jquery-1.12.4.js"></script>
	<!-- Popper.JS -->
	<script src="${root}js/bootstrap/popper.js"></script>
	<!-- Bootstrap JS -->
	<script src="${root}js/bootstrap/bootstrap.js"></script>
	<!-- MAIN JS -->
	<script src="${root }js/main.js"></script>
	<!-- productDetail JS -->
	<script src="${root}js/order/productDetail.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.bt_up').click(function() {
				var n = $('.bt_up').index(this);
				var num = $(".num:eq(" + n + ")").val();
				num = $(".num:eq(" + n + ")").val(num * 1 + 1);
			});
			$('.bt_down').click(function() {
				var n = $('.bt_down').index(this);
				var num = $(".num:eq(" + n + ")").val();
				num = $(".num:eq(" + n + ")").val(num * 1 - 1);
			});
		})
	</script>

	<!-- select Box Option  -->
	<script type="text/javascript">
		function getSelectValue(frm) {
			frm.textValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].text;
			frm.optionValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].value;
		}

		$("#cartBtn").click(function() {
							/* selectBox test */
							console.log("장바구니 버튼 클릭");

							var cart_quantity = $("#order_detail_quantity").val();
							var selectbox = $("#selectBox option:selected").text();

							$("#selectBox option:selected").text();
							console.log($("#selectBox option:selected").text());
							document.getElementById("cart_quantity").value = cart_quantity;
							document.getElementById("cart_option").value = selectbox;
							document.getElementById("order_detail_quantity").value = cart_quantity;
							document.getElementById("order_detail_option").value = selectbox;
							console.log(document.getElementById("cart_option"));
						});
	</script>
	<!--  form 다중 액션 처리 -->
	<script type="text/javascript">
		var modal = document.getElementById("");

		var cart_quantity = $("#order_detail_quantity").val();
		var selectbox = $("#selectBox option:selected").text();

		function goForm() {
			document.formName.action = "${root}order/orderCart";
			modal.style.display = "block";

			document.getElementById("cart_quantity").value = cart_quantity;
			document.getElementById("cart_option").value = selectbox;

		};
	</script>

<!-- ajax 문의글 리스트 출력. -->
		<script type="text/javascript">
	var overlap = false;

	/* 중복 입력 방지 */	
 	$("#questionModal").off().on('click', function(){ 
	 		$('#questionModalForm').modal('show');
	 				
	 				var doSomething = $("#reply_btn").off().on('click', function(){
	 					
	 					console.log("믿었던 너가 두번 실행하는 배신을 하는거냐?");
	 					
	 			/* 				$('#questionModal').bind('click'); */
			 						console.log("어디가 오류일까?? 버튼이녀석이니??");
								/* 	var formObj = $(".replyForm form[role='form']"); */
									var product_id = $("#product_id").val();
									if (member_id == null) {
										var member_id = "";
									} else if (member_id != null) {
										var member_id = $("#member_id").val();
									}
									var question_title = $("#question_title").val();
									var question_content = $("#question_content").val();
									var question_secret_id = $('input[name="question_secret_id"]:checked').val();
									var data = {
										product_id : product_id,
										question_title : question_title,
										question_content : question_content,
										member_id : member_id,
										question_secret_id : question_secret_id
									};
										$.ajax({
											url : "${root }order/productDetail/question",
											type : "post",
											data : data,
											contentType : "application/x-www-form-urlencoded; charset=UTF-8",
											success : function() {
												$("#question_content").val("");
												$("#question_title").val("");
												alert('문의 글이 정상 등록되었습니다.');  
												$('#questionModalForm').modal('hide');
												 document.getElementById("question.jsp").contentDocument.location.reload(true); 	
												/* var url = '${root }order/productDetail/ReplyList?idx=${productDetailOne.product_id}'; 
												$('#question.jsp').attr('src',url); */ 
											
											}
										});
							console.log(data);
	 						});
	 			/* 	$('#questionModal').unbind('click',function(){
						 doSomething();
					});	 */
	 				
		/* ajax end  */
 		});
	</script>


	<!-- 그 그 좋아요버튼 AJAX 처리. 아 에이젝스 개빡세네 왤케 많아 근데 미치겠네 진짜 -->
	<script type="text/javascript">
		/* 구매시에 옵션 값 validation */
		$("#purchaseBtn").click(function(){
			var puchaseNumber = $('#order_detail_quantity').val();
			
			if(puchaseNumber<=0){
				alert('구매 수량은 0 이하가 될 수 없습니다.');
				return false;				
			}
		});
	
		/*   로그인 여부 체크  */
		$("#noneLgnLike_btn").click(function() {
			alert('로그인이 필요합니다.');
		})
		/* 매퍼에서 못 거를 경우 여기에서 다시 거름.  */
		$(document).ready(function() {
			var clickNum = 1;
			$("#like_btn").click(function() {

				if (clickNum == 2 || clickNum > 2) {
					alert('이미 추천을 하신 상품입니다!');
					console.log('추천수 중복 허용할까그냥...');
					return false;

				} else {

					console.log(clickNum);
					var member_id = '${memberVo.member_id}';
					var product_id = $("#product_id").val();
					var data = {
						member_id : member_id,
						product_id : product_id
					}
					$.ajax({
						url : "${root}order/likeInsert",
						type : "post",
						data : data,
						success : function(result) {
							clickNum = clickNum + 1;

							if (result == 0) {
								alert('좋아요! 버튼 클릭');
								location.reload();
							} else {
								alert('좋아요!가 취소되었습니다!');
								location.reload();
							}
						}
					});
					console.log(data);
				}
				;

			});

		});
	</script>

</body>
</html>





























