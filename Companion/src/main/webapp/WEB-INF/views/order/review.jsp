<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:url value="/" var="root"></c:url>
<c:url var="getList" value="/order/review"></c:url> <!-- 페이지네이션을위한 현재 페이지경로 설정 -->
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
</head>
<body>
	<h3 class="reviewListH3">이용후기 ${ReviewTotal }건</h3>

	<table class="table--reviewList table_layout2">
	<colgroup>
		<col class="col1">
		<col class="col2">
		<col class="col3">
		<col class="col4">
	</colgroup>
		<thead>
		<tr>
			<th scope="row">이미지</th>
			<th scope="row">제목</th>
			<th scope="row">작성자</th>
			<th scope="row">작성날짜</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${ReviewList }" var="bean" varStatus="status">
			<tr>
				<!-- 이미지 -->
				<td>
					<img src="<spring:url value='${bean.article_image }'/>" alt="Img80" width="80px">
				</td>
				
				<!-- 제목 -->
				<td><a href="${root }order/productDetail/ReviewDetail?article_id=${bean.article_id}"
						 class="text-dark d-inline-block align-middle">${bean.article_title }</a></td>
				
				<!-- 작성자 -->
				<td>${bean.member_id }</td>

				<!-- 작성일 -->
				<td><fmt:formatDate value="${bean.article_date}" pattern="yyy-MM-dd"/></td>

			</tr>

		</c:forEach>
		</tbody>
	</table>					
	<br/>
		<!-- pagination [start] -->
		<jsp:include page="../common/pagination_P.jsp">
			<jsp:param value="${pagination_p.prev }" name="prev"/>
			<jsp:param value="${pagination_p.next }" name="next"/>
			<jsp:param value="${pagination_p.page }" name="page"/>
			<jsp:param value="${pagination_p.range }" name="range"/>
			<jsp:param value="${pagination_p.rangeSize }" name="rangeSize"/>
			<jsp:param value="${pagination_p.startPage }" name="startPage"/>
			<jsp:param value="${pagination_p.endPage }" name="endPage"/>
		</jsp:include>
		<!-- pagination [end] -->
	<!-- pagination [end] -->	

</body>

<!-- jQuery -->
<script src="${root }js/jquery-1.12.4.js"></script>
<!-- Popper.JS -->
<script src="${root }js/bootstrap/popper.js"></script>
<!-- Bootstrap JS -->
<script src="${root }js/bootstrap/bootstrap.js"></script>

</html>
