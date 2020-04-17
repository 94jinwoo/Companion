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
	<span>글번호</span>
	<p>${ReplyDetail.question_id }</p>
	<span>제목</span>
	<span>${ReplyDetail.question_title }</span>
	<span>작성자</span>
	<span>${ReplyDetail.member_id }</span>
	<span>작성일</span>
	<span><fmt:formatDate value="${ReplyDetail.question_date}" pattern="yyy-MM-dd"/></span>
	<span>내용</span>
	<span>${ReplyDetail.question_content }</span>
	
	<span>상태</span>
	<span>${ReplyDetail.question_state_name }</span>
	<span>비밀글</span>
	<span>${ReplyDetail.question_secret_name }</span>
	<span>답변</span>
	<span>${ReplyDetail.question_answer }</span>
	<span>답변일</span>
	<span><fmt:formatDate value="${ReplyDetail.question_answerdate}" pattern="yyy-MM-dd"/></span>
	<button type="button" id="back_Btn">목록</button>
</body>

<script type="text/javascript">
//목록 버튼
$("#back_Btn").click(function(){
	location.href = ${root}+"order/productDetail/ReplyList?product_id="+${ReplyDetail.product_id};
});
</script>
</html>