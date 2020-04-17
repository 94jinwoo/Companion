<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
	<span>${ReviewDetail.article_id }</span>
	<span>제목</span>
	<span>${ReviewDetail.article_title }</span>
	<span>작성자</span>
	<span>${ReviewDetail.member_id }</span>
	<span>작성일</span>
	<span><fmt:formatDate value="${ReviewDetail.article_date}" pattern="yyy-MM-dd"/></span>

	<span>이미지</span>
	<span><img src="<spring:url value='${ReviewDetail.article_image }'/>"></span>
	<span>내용</span>
	<span>${ReviewDetail.article_content }</span>
	
	<button type="button" id="back_Btn">목록</button>
</body>

<script type="text/javascript">
//목록 버튼
$("#back_Btn").click(function(){
	location.href = ${root}+"order/productDetail/ReviewList?product_id="+${ReviewDetail.product_id};
});
</script>
</html>