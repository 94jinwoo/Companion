<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*" %>
<c:url value="/" var="root"></c:url>
<head>

</head>
<body>
<!-- Right-Sidebar Start -->




<nav id="scroll-right">
	<div class="scroll-right-header">
		<p>TODAY VIEW</p>
	</div>
	
		<div class="scroll-right-content">
		
<%-- 		<%
			ArrayList list = (ArrayList)session.getAttribute("productList");
			if(list==null){
				out.println("조회안함.");
				
			}else{
				for(int i=0;i<list.size();i++){
					out.println(list.get(i));
				}
			}
		%> --%>
		
		
 	<c:forEach items="${sessionList }" var="bean"> 
 		<p>${bean.product_id }</p>
			 <div class="goods-content">
<%-- 				<a href="#"><img src="${root }imgs/TEST11.jpg" alt="70x70"></a> --%>
 				<a href="${root }order/productDetail?idx=${bean.product_id}&num=1"><img src="${bean.product_image }" alt="70x70"></a> 
			</div> 
			<div class="goods-content">
				<a href="#"><img src="${root }imgs/infochk.png" alt="70x70"></a>
			</div>
 	</c:forEach> 
			<div class="scroll-up" id="topBtn">
				<a href="#" role="button"><h3 class="up">↑</h3></a>
			</div>
		</div>
</nav>
<!-- Right-Sidebar End -->
</body>























