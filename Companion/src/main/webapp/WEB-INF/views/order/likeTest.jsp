<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/" var ="root"></c:url>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>LIKE TEST PAGE</title>
		<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
		<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


	
	</head>
<body>

 <table class="table">
				<thead>
					<tr>
		
						<th>좋아요 갯수 : </th>
						<th>상품 ID </th>
						<th>회원 ID </th>
					</tr>
				</thead>
					<tbody>
						<c:forEach items="${likeTest }" var="bean">
							<tr>
								<td><a>좋아요 갯수 :  ${bean.like_id }</a>	<button> 좋아요!<img alt="없어?" src="${root }imgs/shopping/빈따봉1.jpg"></button></td>
								<td><a>좋아요 갯수 :  ${bean.like_id }</a>	<button> 좋아요!<img alt="없어?" src="${root }imgs/shopping/찬따봉.jpg"></button></td>							<td><a>상품 ID :  ${bean.product_id }</a></td>
								<td><a>회원 ID :  ${bean.member_id }</a></td>
							</tr>
						</c:forEach>
					</tbody>
</table> 


	<button type="button" class="btn">simple 여기@!</button>
	<div id="result"></div>


</body>
</html>
 --%>





























