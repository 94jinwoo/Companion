<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<style type="text/css">
.replyList h4{
	margin-top:20px;
	
}
.table--replyList{
	text-align: center;
	width:100%;
	
}
.table--replyList tr{
	border-bottom: 1px solid #b3b7bb;
	
}
.table--replyList th{
	width:200px;
	line-height: 1;
	font-size:20px;
}
.table--replyList td{
	line-height: 2;
	font-size:18px;
}


</style>



</head>
<body>
	<table class="table--replyList">
		<thead>
			<tr>
				<th scope="col" class="border-0 bg-light">
					<div class="p-2 px-3 text-uppercase">아이디</div>
				</th>
				<th scope="col" class="border-0 bg-light">
					<div class="p-2 px-3 text-uppercase">문의 제목</div>
				</th>
				<th scope="col" class="border-0 bg-light">
					<div class="py-2 text-uppercase">문의 내용</div>
				</th>
				<th scope="col" class="border-0 bg-light">
					<div class="p-2 px-3 text-uppercase">작성 날짜</div>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ReplyList}" var="bean">
				<tr>
					<td>${bean.member_id }</td>
					<td>${bean.question_title }</td>
					<td>${bean.question_content }</td>
					<td id="question_date">${bean.question_date }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
<script>
var question_date = $("#question_date").val();
		question_date = new Date(this.question_date);
		question_date = question_date.toLocaleDateString("ko-US");
	console.log(question_date);
</script>


</html>










