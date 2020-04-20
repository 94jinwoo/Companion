<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/" var="root"></c:url>
<c:url var="getList" value="/event/list">></c:url> <!-- 페이지네이션을위한 현재 페이지경로 설정 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="${root}css/bootstrap/bootstrap.css">
	<!-- Our Custom CSS -->
	<link rel="stylesheet" href="${root}css/main.css">
	<link rel="stylesheet" href="${root}css/notice/bbsE.css">
	<!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<!-- jQuery -->
	<script src="${root}js/jquery-1.12.4.js"></script>
	<!-- Popper.JS -->
	<script src="${root}js/bootstrap/popper.js"></script>
	<!-- Bootstrap JS -->
	<script src="${root}js/bootstrap/bootstrap.js"></script>
    <title>Companion::컴패니언::EVENT</title>
</head>
<body>
<div class="wrapper">
	<!-- Sidebar -->
	<jsp:include page="../common/sidebar.jsp"/>
	<!-- Content [start] -->
	<div id="content">
		<!-- Navbar [start] -->
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
			        <ul class="nav navbar-nav ml-auto">
			            <li class="nav-item">
			                <a class="nav-link" href="${root }notice/">공지사항</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link active" href="${root }event/">이벤트</a>
			            </li>
			            <li class="nav-item">
			                <a class="nav-link" href="${root}faq/">FAQ</a>
			            </li>
			        </ul>
			    </div>
			</div>
		</nav>
		<!-- Navbar [end] -->
		<div class="categories">
			<a href="#homeSubmenu">
            	<i class="fas fa-clipboard-list"></i>
                알림
            </a>
            <span>></span>
            <a href="#">
                이벤트
            </a>
            <hr class="mb-4">
        </div>
		<!-- Section [start] -->
		<section class="section">
			<div class="main--title">
				<h1>- 이벤트 알림 -</h1>
			</div>
			<div class="sub-group clearfix">
				<div class="total-count float--left">
					<h4>총 ${total } 건</h4>
				</div>
			</div>
			<table class="table-bbs table_layout">
			<colgroup>
        		<col class="col1">
        		<col class="col2">
        		<col class="col3">
        		<col class="col4">
        		<col class="col5">
    		</colgroup>
	            <thead>
	                <tr>
	                    <th scope="row" >글번호</th>
	                    <th scope="row" >제목</th>
	                    <th scope="row" >작성일</th>
	                    <th scope="row" >작성자</th>
	                    <th scope="row" >조회수</th>
	                </tr>
	            </thead>
	            <tbody>
 	            <c:forEach items="${list }" var="bean" varStatus="status">
	                <tr>
	                    <td><a href="detail/${bean.article_id}">${(total-status.index)-(pagination.page-1)*pagination.listSize}</a></td>
	                    <td><a href="detail/${bean.article_id}">${bean.article_title }</a></td>
	                    <td><a href="detail/${bean.article_id}">${bean.article_date }</a></td>
	                    <td><a href="detail/${bean.article_id}">${bean.member_id }</a></td>
	                    <td><a href="detail/${bean.article_id}">${bean.article_count }</a></td>
	                </tr>
	            </c:forEach>
	            </tbody>
	        </table>
		</section>
		<!-- Section [end] -->
	    <!-- pagination [start] -->
		<jsp:include page="../common/pagination.jsp">
			<jsp:param value="${pagination.prev }" name="prev"/>
			<jsp:param value="${pagination.next }" name="next"/>
			<jsp:param value="${pagination.page }" name="page"/>
			<jsp:param value="${pagination.range }" name="range"/>
			<jsp:param value="${pagination.rangeSize }" name="rangeSize"/>
			<jsp:param value="${pagination.startPage }" name="startPage"/>
			<jsp:param value="${pagination.endPage }" name="endPage"/>
		</jsp:include>
		<!-- pagination [end] -->
		<!-- Footer  -->
			<jsp:include page="../common/footer.jsp"/>
		<!-- Footer end -->
	</div>
	<!-- Content [end] -->
</div>
    <!-- jQuery -->
    <script src="${root }js/jquery-1.12.4.js"></script>
    <!-- Popper.JS -->
    <script src="${root }js/bootstrap/popper.js"></script>
    <!-- Bootstrap JS -->
    <script src="${root }js/bootstrap/bootstrap.js"></script>
    <!-- MAIN JS -->
    <script src="${root }js/main.js"></script>
</body>
</html>