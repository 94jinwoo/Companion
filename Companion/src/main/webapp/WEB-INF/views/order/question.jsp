<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/" var="root"></c:url>
<c:url var="getList" value="/order/question"></c:url> <!-- 페이지네이션을위한 현재 페이지경로 설정 -->
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

<style type="text/css">

</style>
</head>
<body>
	<h4>최근 문의글 목록</h4>
	<table class="table--replyList table_layout">
	<colgroup>
		<col class="col1">
		<col class="col2">
		<col class="col3">
		<col class="col4">
	</colgroup>
		<thead>
			<tr>
				<th scope="row">글번호</th>
				<th scope="row">문의 제목</th>
				<th scope="row">아이디</th>
				<th scope="row">작성날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ReplyList}" var="bean" varStatus="status">
				<tr>
					<td>${(ReplyTotal-status.index)-(pagination_p.page-1)*pagination_p.listSize}</td>
					<!-- 공개 -->
					<c:if test="${bean.question_secret_id == 0 }">
						<td><a href="${root }order/productDetail/ReplyDetail?question_id=${bean.question_id}">${bean.question_title }</a></td>
					</c:if>
					<!-- 비공개 -->
					<c:if test="${bean.question_secret_id == 1 }">
						<c:if test="${memberVo.member_id == bean.member_id}">
							<td><a href="${root }order/productDetail/ReplyDetail?question_id=${bean.question_id}" class="mySecret">${bean.question_title }</a></td>
						</c:if>
						<c:if test="${memberVo.member_id != bean.member_id}">
							<td class="othersBlock"><a href=javascript:; class="secret">비밀글입니다</a></td>
						</c:if>
					</c:if>
					<td>${bean.member_id }</td>
					<td><fmt:formatDate value="${bean.question_date}" pattern="yyyy-MM-dd"/></td>
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
</body>

<!-- jQuery -->
<script src="${root }js/jquery-1.12.4.js"></script>
<!-- Popper.JS -->
<script src="${root }js/bootstrap/popper.js"></script>
<!-- Bootstrap JS -->
<script src="${root }js/bootstrap/bootstrap.js"></script>

<script type="text/javascript">
$(".secret").click(function(){
	alert("비밀글로 작성자만 조회할 수 있습니다.");
});
</script>
</html>
