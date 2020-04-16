<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<c:set var="product_id" value="${bean.product_id }"></c:set>
					<td>${bean.member_id }</td>
					<td>${bean.question_title }</td>
					<td>${bean.question_content }</td>
				<td><fmt:formatDate value="${bean.question_date}" pattern="yyyy-MM-dd"/></td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
<!-- pagination [start] -->
	    <nav aria-label="Page navigation example">
				<%
					String str = request.getQueryString();
					String result = str.substring(0,5);
					String REALURL = (String)request.getAttribute("trueUrl");
					if(REALURL==null){
						REALURL="";
					}
				%>
	 	   <ul class="pagination">
			<c:if test="${prev }">
		  	     <li class="page-item">
		    	   	<a class="page-link" href="${root }order/productDetail/ReplyList?idx=${product_id}&num=${startPageNum - 1 }" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				    </a>
		   		</li>
			</c:if>
		   		<c:forEach begin="${startPageNum }" end="${endPageNum }" var="num">
					<span>
						<c:if test="${select != num}">
							<li class="page-item">
							
								<a class="page-link" href="${root }order/productDetail/ReplyList?idx=${product_id}&num=${num }">${num }</a>
							</li>	
					  	</c:if>  
					 	<c:if test="${select == num}">
							<li class="page-item">
								<a class="page-link bg-info text-white" href="#" >${num }</a>	
							</li>	
					 	</c:if>		
					</span>
				</c:forEach>
			<c:if test="${next }">
				<li class="page-item">
					<a class="page-link" href="${root }order/productDetail/ReplyList?idx=${product_id}&num=${endPageNum + 1 }" aria-label="Next">
		     		   <span aria-hidden="true">&raquo;</span>
		   			</a>	      
		      </li>
	      	</c:if>
	      </ul>
		</nav>
	<!-- pagination [end] -->	

</body>
<script>
</script>


</html>










