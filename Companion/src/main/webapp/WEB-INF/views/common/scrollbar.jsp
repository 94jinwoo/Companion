<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="root"></c:url>
<!-- Right-Sidebar Start -->
<nav id="scroll-right">
	<div class="scroll-right-header">
		<p>TODAY VIEW</p>
	</div>
	
		<div class="scroll-right-content">
 	<c:forEach items="${sessionList }" var="bean" begin="1" end="2"> 
 		<p>${bean.product_id }</p>
 	</c:forEach> 
			 <div class="goods-content">
				<a href="#">아니 왜?<img src="" alt="70x70"></a>
<%-- 				<a href="#"><img src="${bean.product_image }" alt="70x70"></a> --%>
			</div> 
			<div class="goods-content">
				<a href="#"><img src="${root }imgs/infochk.png" alt="70x70"></a>
			</div>
			<div class="scroll-up" id="topBtn">
				<a href="#" role="button"><h3 class="up">↑</h3></a>
			</div>
		</div>
</nav>
<!-- Right-Sidebar End -->