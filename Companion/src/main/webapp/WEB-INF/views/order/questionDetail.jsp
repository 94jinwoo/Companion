<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!-- jQuery -->
	<script src="${root}js/jquery-1.12.4.js"></script>
	<!-- Popper.JS -->
	<script src="${root}js/bootstrap/popper.js"></script>
	<!-- Bootstrap JS -->
	<script src="${root}js/bootstrap/bootstrap.js"></script>
	<!-- MAIN JS -->
	<script src="${root }js/main.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${root}css/bootstrap/bootstrap.css">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="${root}css/main.css">
<link rel="stylesheet" href="${root}css/order/goodsdetail.css">
<title>Insert title here</title>
</head>
<body>
	<table class="quesDetailT">
		<thead>
			<tr>
				<th class="clearfix">
				<div class="float--left">
						<label>&nbsp;[제목]&nbsp;</label>
						<span>${ReplyDetail.question_title }</span>
					</div>
					<div class="float--right">
						<label>&nbsp;[글번호]&nbsp;</label>
						<span>${ReplyDetail.question_id }&nbsp;</span>
					</div>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="clearfix">
					<div class="float--left">
						<label>&nbsp;[작성자]&nbsp;</label>
						<span>${ReplyDetail.member_id }</span>
					</div>
					<div class="float--right">
						<label>&nbsp;[작성일자]&nbsp;</label>
						<span><fmt:formatDate value="${ReplyDetail.question_date}" pattern="yyy-MM-dd"/>&nbsp;</span>
					</div>
				</td>
			</tr>
			<tr>
				<td class="clearfix">
					<div class="float--right">
						<label>&nbsp;[비밀글]&nbsp;</label>
						<span>${ReplyDetail.question_secret_name }&nbsp;</span>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4">${ReplyDetail.question_content }</td>
			</tr>
		</tbody>
	</table>
	<hr class="mb-3" style="width:920px">
	<table class="quesDetailT">
		<thead>
			<tr>
				<th class="clearfix">
				<div class="float--left">
						<label>&nbsp;[답변상태]&nbsp;</label>
						<span>${ReplyDetail.question_state_name }</span>
					</div>
					<div class="float--right">
						<label>&nbsp;[답변일]&nbsp;</label>
						<span><fmt:formatDate value="${ReplyDetail.question_answerdate}" pattern="yyy-MM-dd"/></span>
					</div>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>답변</th>
				<td>${ReplyDetail.question_answer }</td>
				
			</tr>
		</tbody>
	</table>
	<div class="btn__group">
		<button type="button" id="back_Btn" class="mainBtn">이전으로</button>
	</div>
</body>

<script type="text/javascript">
//목록 버튼
$("#back_Btn").click(function(){
	location.href = ${root}+"order/productDetail/ReplyList?product_id="+${ReplyDetail.product_id};
});
</script>
</html>