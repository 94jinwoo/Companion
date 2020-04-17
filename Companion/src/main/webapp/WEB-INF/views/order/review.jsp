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
	<nav class="navbar navbar-expand-lg">
		<h2 class="navbar-brand">
			이용후기 ${ReviewTotal }건
		</h2>
	</nav>
	<hr class="my-1">

	<div class="row">
		<!-- 후기글 start -->
		<div class="col-lg-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							<div class="p-2 px-3 text-uppercase">이미지</div>
						</th>
						<th>
							<div class="py-2 text-uppercase">제목</div>
						</th>
						<th>
							<div class="p-2 px-3 text-uppercase">작성자</div>
						</th>
						<th>
							<div class="py-2 text-uppercase">날짜</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ReviewList }" var="bean" varStatus="status">
						<tr>
							<!-- 이미지 -->
							<td>
								<img src="<spring:url value='${bean.article_image }'/>" alt="이미지90x90" width="90">
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
		</div>
		<!-- col-lg-12 end -->
	</div>
	<!-- row end -->
						
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
