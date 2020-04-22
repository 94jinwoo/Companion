<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/" var ="root"></c:url>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>주문 내역 상세</title>

	<%-- <!-- Bootstrap CSS CDN -->
	<link rel="stylesheet" href="${root}css/bootstrap/bootstrap.css">
	<!-- Our Custom CSS -->
	<link rel="stylesheet" href="${root}css/home.css">
	<!-- Our Custom CSS -->
	<link rel="stylesheet" href="${root}css/main.css"> --%>
	
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/main.css">
    <link rel="stylesheet" href="${root }css/mypage/myPurchaseD.css">

	<!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

	<style type="text/css">
		.purchase{
		}
		.btn-order{
		float:right;
		display:block;
		}
	</style>
</head>
<body>
<div class="wrapper">

		 <!-- Sidebar  -->
 	<jsp:include page="../common/sidebar.jsp"/> 
       <!-- sideBar  -->
		<!-- menu  -->
			
<div id="content">			
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
                   <div class="container-fluid">
   
                       <button type="button" id="sidebarCollapse" class="btn btn-info">
                           <i class="fas fa-align-left"></i>
                           <span>메뉴</span>
                       </button>
                       <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse"
                           data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                           aria-expanded="false" aria-label="Toggle navigation">
                           <i class="fas fa-align-justify"></i>
                       </button>
                       
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                           <c:choose>
                              <c:when test="${sessionScope.memberVo.member_id==null }">
                                  <script>
                                     window.location.href="login";
                                  </script>
                              </c:when>
                              <c:otherwise>
                                  <ul class="nav navbar-nav ml-auto">
                                      <li class="nav-item">
                                          <a class="nav-link active" href="${root }mypurchaselist">주문내역</a>
                                      </li>
                                      <li class="nav-item">
                                          <a class="nav-link" href="${root }mypagereserve">예약조회</a>
                                      </li>
                                      <li class="nav-item">
                                          <a class="nav-link" href="${root }mycart">장바구니</a>
                                      </li>
                                      <li class="nav-item">
                                          <a class="nav-link" href="${root }mypagequestion">문의조회</a>
                                      </li>
                                      <li class="nav-item">
                                          <a class="nav-link" href="${root }mypagechk">마이페이지</a>
                                      </li>
                                      <li class="nav-item">
                                          <a class="nav-link" href="${root }logout">로그아웃</a>
                                      </li>
                                  </ul>
                              </c:otherwise>
                              
                          </c:choose>
                      </div>
                  </div>
              </nav>
		<!-- menu -->
			
			<!--content  -->
				<div class="categories">
					<a href="#homeSubmenu"> <i class="fas fa-user"></i> 마이페이지</a> <span>></span> 
					<a href="#"> <i class="fas fa-clipboard"></i> 주문내역</a>
					<hr class="mb-4">
				</div>	
			
			
	<!-- .title-group start-->
  <section class="section">
			<div class="main--title">
				<h1>주문 상세내역</h1><br/>
	        </div>
                      <h5>주문일 : ${myPurchaseDetail.order_date } / 주문번호 : ${myPurchaseDetail.order_id }</h5>
               <table class="table table_layout">
               <colgroup>
               <col class="col1">
               <col class="col2">
               <col class="col3">
               <col class="col4">
               <col class="col5">
               <col class="col6">
               </colgroup>
                   <thead>
                       <tr>
	                       <th>상품 이름</th>
	                       <th>옵션</th>
	                       <th>수량</th>
	                       <th>상품금액</th>
	                       <th>합계금액</th>
	                       <th>상품별 주문번호</th>
                       </tr>
                   </thead>
                   <tbody>
<c:forEach items="${purchaseDetailList }" var="bean">
                       <tr>
                           <td class="imgTbox">
                           <div class="imgBox">
                           		<!-- 썸네일 -->
                           		<a href="${root }order/productDetail?idx=${bean.product_id }" style="text-decoration:none">
                           			<img id="proImg" alt="Img" src="${bean.product_thumb }">
                           		</a>
                           </div>
                           		<!-- 상품이름 --> 
                           		<a href="${root }order/productDetail?idx=${bean.product_id }" style="text-decoration:none">
	                           		${bean.product_name }
	                           	</a>
                           </td>
                           <td>
                           		<!-- 옵션 -->   
                           		${bean.order_detail_option }
                           </td>
                           <td>
                           		<!-- 수량 -->
                           		${bean.order_detail_quantity }
                           </td>
                           <td>
                           		<!-- 금액 -->
                           		${bean.order_detail_price }
                           </td>
                           <td>
                           		<!-- 합계 -->
                           		${bean.order_detail_price*bean.order_detail_quantity }
                           </td>
                           <td>
                           		${bean.order_detail_id }
                           </td>
                       </tr>
</c:forEach>
                   </tbody>
               </table>
               <div class="layB clearfix">
               
               <div class="halfBox float--left">
               	<h5>수령인 정보</h5>
	               <table class="halfTable">
	               <thead></thead>
	               <tbody>
	               		<tr>
	               			<th><label>받는 사람</label></th>
	               			<td>${myPurchaseDetail.order_name }</td>
	               		</tr>
	               		<tr>
	               			<th><label>연락처</label></th>
	               			<td>${myPurchaseDetail.order_phone }</td>
	               		</tr>
	               		<tr>
	               			<th><label>배송주소</label></th>
	               			<td>${myPurchaseDetail.order_addr1 } : ${myPurchaseDetail.order_addr2 } ${myPurchaseDetail.order_addr3 }</td>
	               		</tr>
	               		<tr>
	               			<th><label>배송요청사항</label></th>
	               			<td>${myPurchaseDetail.order_msg }</td>
	               		</tr>
	               	</tbody>	
	               </table>
               </div>
               <div class="halfBox float--right">
               <h5>결제 정보</h5>
               <table class="halfTable">
               <thead></thead>
               <tbody>
               		<tr>
               			<th><label>총 상품가격</label></th>
               			<td>${myPurchaseDetail.order_amount-2500 }</td>
               		</tr>
               		<tr>
               			<th><label>배송비</label></th>
               			<td>2500</td>
               		</tr>
               		<tr>
               			<th><label>총 결제금액</label></th>
               			<td>${myPurchaseDetail.order_amount }</td>
               		</tr>
               		<tr>
               			<th><label>결제수단</label></th>
               			<td>카카오 페이</td>
               		</tr>
               	</tbody>	
               </table>
               </div>
               </div>
               <div class="btnbox">
	            	<button type="button" class="cBtn backBtn" onclick="history.back();">이전으로</button>
	           </div>
      	</section>  
      
       <!-- Footer  -->
		<jsp:include page="../common/footer.jsp"/>
	<!-- Footer end -->
</div>        
<!-- content 끝나는 곳. -->
    </div> <!--Wrapper 끝나는 곳.  -->       
	<!-- jQuery CDN - Slim version (=without AJAX) -->
 	<script src="${root}js/jquery-1.12.4.js"></script> 
	<!-- Popper.JS -->
	<script src="${root}js/bootstrap/popper.js"></script>
	<!-- Bootstrap JS -->
	<script src="${root}js/bootstrap/bootstrap.js"></script>
	<!-- MAIN JS -->
  	<script src="${root }js/main.js"></script>			
</body>

</html>