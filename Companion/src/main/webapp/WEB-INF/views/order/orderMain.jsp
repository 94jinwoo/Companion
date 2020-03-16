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
	
		<title>Collapsible sidebar using Bootstrap 4</title>
	
		<!-- Bootstrap CSS CDN -->
		<link rel="stylesheet" href="${root}css/bootstrap/bootstrap.css">
		<!-- Our Custom CSS -->
		<link rel="stylesheet" href="${root}css/home.css">
		<!-- Our Custom CSS -->
		<link rel="stylesheet" href="${root}css/main.css">
	
		<!-- Font Awesome JS -->
		<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
		<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	
	</head>
	
	<body>
	
		<div class="wrapper">
			<!-- Sidebar  -->
			<nav id="sidebar">
				<div class="sidebar-header">
					<h3>Bootstrap Sidebar</h3>
					<strong>BS</strong>
				</div>
	
				<ul class="list-unstyled components">
					<li class="active">
						<a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
							<i class="fas fa-home"></i>
							Home
						</a>
						<ul class="collapse list-unstyled" id="homeSubmenu">
							<li>
								<a href="#">Home 1</a>
							</li>
							<li>
								<a href="#">Home 2</a>
							</li>
							<li>
								<a href="#">Home 3</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="#">
							<i class="fas fa-briefcase"></i>
							About
						</a>
						<a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
							<i class="fas fa-copy"></i>
							Pages
						</a>
						<ul class="collapse list-unstyled" id="pageSubmenu">
							<li>
								<a href="#">Page 1</a>
							</li>
							<li>
								<a href="#">Page 2</a>
							</li>
							<li>
								<a href="#">Page 3</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="#">
							<i class="fas fa-image"></i>
							Portfolio
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fas fa-question"></i>
							FAQ
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fas fa-paper-plane"></i>
							Contact
						</a>
					</li>
				</ul>
	
				<ul class="list-unstyled CTAs">
					<li>
						<a href="https://bootstrapious.com/tutorial/files/sidebar.zip" class="download">Download source</a>
					</li>
					<li>
						<a href="https://bootstrapious.com/p/bootstrap-sidebar" class="article">Back to article</a>
					</li>
				</ul>
			</nav>
	
			<!-- Page Content  -->
			<div id="content">
	
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div class="container-fluid">
	
						<button type="button" id="sidebarCollapse" class="btn btn-info">
							<i class="fas fa-align-left"></i>
							<span>Toggle Sidebar</span>
						</button>
						<button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<i class="fas fa-align-justify"></i>
						</button>
	
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="nav navbar-nav ml-auto">
								<li class="nav-item active">
									<a class="nav-link" href="#">Page</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">Page</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">Page</a>
								</li>
								<li class="nav-item">
									<a class="nav-link" href="#">Page</a>
								</li>
							</ul>
						</div>
					</div>
				</nav>
				
				
				<!--content  -->
				
		<table class="table">
				<thead>
					<tr>
						<th>주문ID</th>
						<th>회원ID</th>
						<th>주문총가격</th>
						<th>주문수령인</th>
						<th>주문수령인 일반전화</th>
						<th>주문수령인 후대전화</th>
						<th>주문 주소1</th>
						<th>주문 주소2</th>
						<th>주문 주소3</th>
						<th>주문배송메세지</th>
						<th>주문상태 ID</th>
					</tr>
				</thead>
					<tbody>
					<c:forEach items="${orderlist }" var="bean">
						<tr>

							<td><a href="#">${bean.order_id }</a></td>
							<td><a href="#">${bean.member_id }</a></td>
							<td><a href="#">${bean.order_date }</a></td>
							<td><a href="#">${bean.order_amount }</a></td>
							<td><a href="#">${bean.order_name }</a></td>
							<td><a href="#">${bean.order_tel }</a></td>
							<td><a href="#">${bean.order_addr1 }</a></td>
							<td><a href="#">${bean.order_addr2 }</a></td>
							<td><a href="#">${bean.order_addr3 }</a></td>
							<td><a href="#">${bean.order_msg }</a></td>
							<td><a href="#">${bean.order_state_id }</a></td>

								</tr>
							</c:forEach>
					</tbody>
		</table> 
		
		<!--content  -->
		
			</div>
		</div>
	
				
	
		<!-- jQuery CDN - Slim version (=without AJAX) -->
		<script src="${root}js/jquery-1.12.4.js"></script>
		<!-- Popper.JS -->
		<script src="${root}js/bootstrap/popper.js"></script>
		<!-- Bootstrap JS -->
		<script src="${root}js/bootstrap/bootstrap.js"></script>
	
		<script type="text/javascript">
			$(document).ready(function () {
				$('#sidebarCollapse').on('click', function () {
					$('#sidebar').toggleClass('active');
				});
			});
		</script>
	</body>
	
	</html>