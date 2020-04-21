<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<!-- jQuery-UI -->
	<link rel="stylesheet" href="${root }css/jquery-ui.css">
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="${root}css/bootstrap/bootstrap.css">
	<!-- Our Custom CSS -->
	<link rel="stylesheet" href="${root}css/main.css">
	<link rel="stylesheet" href="${root}css/hotel/hotelreserv.css">
	<!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<!-- user add css -->
	<style type="text/css">
		.msg {
		    margin-top: 5px;
		    font-size: 14px;
		    -webkit-transition: opacity .3s linear;
		    transition: opacity .3s linear;
		  }
		.msg.err {
		  color: #ff0000;
		}
		.msg.ok {
		  color: #08a600;
		}
	</style>

    <title>컴패니언::Companion::예약하기</title>
</head>
<body>
<!-- .wrapper start  -->
<div class="wrapper">
	<!-- Sidebar -->
	<jsp:include page="../common/sidebar.jsp"/>
	<!-- #content start -->
	<div id="content">
		<!-- #container start -->
		<div id="container">
			<!-- nav start -->
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<!-- .container-fluid start -->
			    <div class="container-fluid">
					<!-- menu toggle button start -->
			        <button type="button" id="sidebarCollapse" class="btn btn-info">
			            <i class="fas fa-align-left"></i>
			            <span>메뉴</span>
			        </button>
			        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
			            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
			            aria-expanded="false" aria-label="Toggle navigation">
			            <i class="fas fa-align-justify"></i>
			        </button>
			        <!-- menu toggle button end -->
			        <!-- top menu bar start -->
			         <div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="nav navbar-nav ml-auto">
							<li class="nav-item">
								<a class="nav-link" href="${root }hotel/infouse">이용안내</a>
							</li>
							<li class="nav-item active">
								<a class="nav-link" href="${root }hotel/reservation">예약하기</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${root }hotel/preroom">룸미리보기</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${root }hotel/infocare">돌보미정보</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${root }hotel/infoloc">위치정보</a>
							</li>
						</ul>
			        </div>
			        <!-- top menu bar end -->
			    </div>
			    <!-- .container-fluid end -->
			</nav>
			<!-- nav end -->
			<div class="categories">
                <a href="#homeSubmenu">
                    <i class="fas fa-building"></i>
                    호텔서비스
                </a>
                <span>></span>
                <a href="#">
                    <i class="fas fa-clipboard-list"></i>
                    예약하기
                </a>
                <hr class="mb-4">
            </div>
			<!-- section start -->
			<div class="maincontent">
				<!-- .row start -->
				<div class="reservHotel row">
					<!-- 예약하기 왼쪽(호텔예약설명) start -->
					<div class="reserve--left col-md-6" id="reservImg">
						<h1>예약하기</h1><br/>
                        <h3>컴패니언 고객센터</h3>
						<p>1588-0000</p>
						<h3>예약 및 상담시간</h3>
                        <p>09:00~20:00</p>
                        <br/>
						<h2>안내사항</h2>
						<p>컴패니언 이용 시 주의사항</p>
						<table class="table">
							<tbody>
								<tr>
									<td>1년 이내 5가지 접종(종합, 코로나, 켄넬코프, 신종 인플루엔자, 광견병) 받지<br/>않은 반려견은 입실이 제한됩니다.<br/>* 접종기록은 접종병원명이 꼭 필요하므로 증빙 자료는 미리 준비해주세요.</td>
								</tr>
								<tr>
									<td>1살 미만의 반려동물인 경우 항체 검사가 필수 입니다.<br/>(단, 1살 이상 시 재접종 기록 확인)</td>
								</tr>
								<tr>
									<td>생리, 건강문제 또는 공격성이 강해 타 고객의 이용에 피해가 되는 반려동물 일 경우 입실이 제한됩니다.</td>
								</tr>
							</tbody>
						</table>
                    </div>
					<!-- 예약하기 왼쪽(호텔예약설명) end -->
					<!-- 예약하기 오른쪽(입력폼) start -->
					<div class="col-md-6 reserve--right" id="reserText">
						<!-- 예약하기 form -->
						<form class="form-horizontal" method="POST" onsubmit="return validation_submit();">
							<div class="form-group">
								<label for="service_id" class="h4 col-sm-5 control-label">희망 서비스</label>
								<div class="col-sm-11">
									<select id="service_id" class="form-control" name="service_id">
										<option value="0">호텔&데이케어</option>
										<option value="1">유치원</option>
										<option value="2">독파크</option>
										<option value="3">아카데미</option>
										<option value="4">그루밍&스파</option>
										<option value="5">스튜디오</option>
										<option value="6">메디컬센터</option>
										<option value="7">스페셜케어</option>
									</select>
								</div>
							</div>
							<!-- Datepicker -->
							<div class="form-group">
								<label for="reserve_checkin" class="h4 col-sm-5 control-label">체크인</label>
								<div class="col-sm-11">
								<input type="text" class="form-control" name="reserve_checkin" id="from" placeholder="체크인 날짜를 선택하세요.">
								<p class="msg err"></p>
								</div>
							</div>
							<div class="form-group">
								<label for="reserve_checkout" class="h4 col-sm-5 control-label">체크아웃</label>
								<div class="col-sm-11">
								<input type="text" class="form-control" name="reserve_checkout" id="to" placeholder="체크아웃 날짜를 선택하세요.">
								<p class="msg err"></p>
								</div>
							</div>
							<!-- 반려동물 품종 -->
							<div class="form-group">
								<label for="reserve_dogtype" class="h4 col-sm-5 control-label">반려동물 품종</label>
								<div class="col-sm-11">
								<input type="text" class="form-control" name="reserve_dogtype" id="animalBreed" placeholder="반려동물 품종을 입력하세요.">
								<p class="msg err"></p>
								</div>
							</div>
							<!-- 반려동물 나이 -->
							<div class="form-group">
								<label for="reserve_dogage" class="h4 col-sm-5 control-label">반려동물 나이</label>
								<div class="col-sm-11">
								<input type="number" class="form-control" name="reserve_dogage" id="animalAge" placeholder="반려동물 나이를 입력하세요.">
								<p class="msg err"></p>
								</div>
							</div>
							<!-- 기타/주의사항 -->
							<div class="form-group">
								<label for="reserve_msg" class="h4 col-sm-5 control-label">기타</label>
								<div class="col-sm-11">
									<textarea name="reserve_msg" id="reserve_msg" cols="56" rows="10" placeholder="효과적인 서비스 추천을 위해 반려견 이름, 중성화 여부, 문제행동 등의 자세한 사항을 작성해주세요."></textarea><br/>
								</div>
							</div>
							
							<!-- 예약상담신청 버튼 -->
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-11">
								<!-- 로그인 세션 검사 -->
								<c:choose>
									<c:when test="${memberVo.member_id==null}">
										<a class="btn btn-success btn-lg btn-block" href="${root }login" role="button" id="noneLogin_btn" aria-pressed="true">예약상담신청</a>
									</c:when>
									<c:when test="${memberVo.member_id!=null}">
										<button class="btn btn-success btn-lg btn-block" id="btn_submit" type="submit">예약상담신청</button>
									</c:when>
								</c:choose>
								<!-- 로그인 세션 검사 -->
								</div>
							</div>
						</form>
					</div>
					<!-- 예약하기 오른쪽(입력폼) end -->
				</div>
				<!-- .row end -->
			</div>
			<!-- section end -->
		</div>
		<!-- #container end -->
		<!-- Footer  -->
			<jsp:include page="../common/footer.jsp"/>
		</div>
		<!-- Footer end -->
	</div>
	<!-- #content end -->
<!-- .wrapper end  -->
<!-- jQuery -->
<script src="${root}js/jquery-1.12.4.js"></script>
<!-- jQuery-UI -->
<script src="${root }js/jquery-ui.js"></script>
<!-- Popper.JS -->
<script src="${root}js/bootstrap/popper.js"></script>
<!-- Bootstrap JS -->
<script src="${root}js/bootstrap/bootstrap.js"></script>
<!-- MAIN JS -->
<script src="${root }js/main.js"></script>
<!-- user add JS -->
<script type="text/javascript" src="${root }js/site.js"></script>
<script type="text/javascript">

/*   로그인 여부 체크  */
$("#noneLogin_btn").click(function(){
	alert('로그인이 필요합니다.');
})

//validation
function validation_submit() {
	if($("#animalBreed").val() == ""){
		alert('반려견 품종을 입력해주세요.');
		$('#animalBreed').focus();
		return false;
	}
	if($("#animalAge").val() == ""){
		alert('반려동물 나이를 입력해주세요.');
		$('#animalAge').focus();
		return false;
	}
	alert('예약이 완료되었습니다.');
};

</script>
</body>
</html>