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
    <link rel="stylesheet" href="${root }css/mypage/mypagechk.css">

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
		<jsp:include page="../common/sidebar.jsp" />

		<!-- Page Content  -->
		<div id="content">
			<div id="container">

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
							<c:choose>
								<c:when test="${sessionScope.memberVo.member_id==null }">
									<script>
	                                	window.location.href="login";
	                                </script>
								</c:when>
								<c:otherwise>
									<ul class="nav navbar-nav ml-auto">
										<p>${sessionScope.memberVo.member_name }님이로그인 중입니다.</p>
										<li class="nav-item"><a class="nav-link" href="#">주문내역</a>
										</li>
										<li class="nav-item"><a class="nav-link"
											href="${root }mypagereserve">예약조회</a></li>
										<li class="nav-item"><a class="nav-link"
											href="${root }mycart">장바구니</a></li>
										<li class="nav-item"><a class="nav-link"
											href="${root }mypagequestion">문의조회</a></li>
										<li class="nav-item"><a class="nav-link"
											href="${root }mypagechk">나의정보</a></li>
										<li class="nav-item"><a class="nav-link"
											href="${root }logout">로그아웃</a></li>
									</ul>
								</c:otherwise>

							</c:choose>
						</div>
					</div>
				</nav>
				<div class="mytop">
					<!-- 유지정보 -->
					<input type="hidden" name="id_chk" id="id_chk"
						value="${sessionScope.memberVo.member_id }"> <input
						type="hidden" name="pw_chk" id="pw_chk"
						value="${sessionScope.memberVo.member_pw }"> <input
						type="hidden" name="tel_chk" id="tel_chk"
						value="${sessionScope.memberVo.member_tel }"> <input
						type="hidden" name="phone_chk" id="phone_chk"
						value="${sessionScope.memberVo.member_phone }"> <input
						type="hidden" name="email_chk" id="email_chk"
						value="${sessionScope.memberVo.member_email }"> <input
						type="hidden" name="addr1_chk" id="addr1_chk"
						value="${sessionScope.memberVo.member_addr1 }"> <input
						type="hidden" name="addr2_chk" id="addr2_chk"
						value="${sessionScope.memberVo.member_addr2 }"> <input
						type="hidden" name="addr3_chk" id="addr3_chk"
						value="${sessionScope.memberVo.member_addr3 }">
					<!-- 유지정보 -->

					<div id="icon">
						<i class="fas fa-user fa-9x"></i>
					</div>
					<div class="info">
						<ul>
							<li>
								<h3>이름</h3> <span>${sessionScope.memberVo.member_name }</span>
							</li>
							<li>
								<h3>휴대전화</h3> <span>${sessionScope.memberVo.member_phone }</span>
							</li>
							<li>
								<h3>주소</h3> <span>우편번호
									${sessionScope.memberVo.member_addr1 }<br />
									${sessionScope.memberVo.member_addr2 } &nbsp;
									${sessionScope.memberVo.member_addr3 }
							</span>
							</li>
						</ul>
						<div class="editbox">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#exampleModal">정보 변경</button>
						</div>
					</div>
					<!-- 개인정보 변경 확인 비밀번호 창 Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">개인정보 변경을 위해
										비밀번호를 입력해 주세요:)</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">

									<form name="mypagechk" method="post" autocomplete="off">
										<label for="member_pw">Password</label>
										<input type="password" name="member_pw" id="member_pw" placeholder="비밀번호 입력"></br>
										<input type="hidden" name="pw_chk" id="pw_chk"
											value="${sessionScope.memberVo.member_pw }">
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary"
										id="mypagechk_btn">확인</button>
								</div>

								</form>
							</div>
						</div>
					</div>

					<div class="info-box">
						<a href="#"> <i class="fas fa-truck fa-3x"></i> <br />
						<br />
							<h2>배송조회 ></h2>
						</a>
					</div>
					<div class="info-box">
						<a href="#"> <i class="fas fa-clipboard fa-3x"></i> <br />
						<br />
							<h2>예약조회 ></h2>
						</a>
					</div>
					<div class="info-box">
						<a href="#"> <i class="fas fa-edit fa-3x"></i> <br />
						<br />
							<h2>후기작성 ></h2>
						</a>
					</div>
				</div>
				<!-- .mytop [end] -->
				<div class="maincontent">
					<div class="empty">
						<h2>최근 구매 내역</h2>
						<table class="table table-striped table-bordered" style="width:100%">
							<thead>
								<tr>
									<th>이미지</th>
									<th>상품이름</th>
									<th>구매수량</th>
									<th>구매날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>그림2</td>
									<td>옥수수먹고싶다</td>
									<td>1</td>
									<td>2020-04-08</td>
								</tr>
								<tr>
									<td>그림1</td>
									<td>옥수수먹고싶다</td>
									<td>1</td>
									<td>2020-04-08</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align:center">구매내역 자세히>></td>
								</tr>
							</tbody>
						</table>
						
					</div>
				</div>
				<!-- .maincontent [end] -->
			</div>
			<!-- #container [end] -->
			<!-- Footer  -->
			<jsp:include page="../common/footer.jsp" />
			<!-- Footer end -->

		</div>
		<!-- #content end -->
	</div>
	<!-- .wrapper end  -->	
	
	<!-- script start -->
	<!-- jQuery -->
	<script src="${root }js/jquery-1.12.4.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#mypagechk_btn").click(function(){
				var member_pw=$("#member_pw").val();
				var pw_chk=$('#pw_chk').val();
				if(member_pw==""){
					alert("비밀번호를 입력해 주세요.");
					return;
				}else if(member_pw!=pw_chk){
					alert("비밀번호가 일치하지 않습니다.");
					return;
				}else if(member_pw==pw_chk){
					location.replace("mypage");
				}
			});
		});
	</script>
	
	<!-- Popper.JS -->
    <script src="${root }js/bootstrap/popper.js"></script>
    <!-- Bootstrap JS -->
    <script src="${root }js/bootstrap/bootstrap.js"></script>
    <!-- MAIN JS -->
    <script src="${root }js/main.js"></script>

    <!-- script end -->
</body>
</html>