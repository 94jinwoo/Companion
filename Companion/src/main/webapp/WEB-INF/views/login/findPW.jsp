<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>컴패니언::Companion</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${root }css/bootstrap/bootstrap.css">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="${root }css/main.css">
    <link rel="stylesheet" href="${root }css/login/find.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
        integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
        crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
        integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
        crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
        
        <!-- Sidebar  -->
		<jsp:include page="../common/sidebar.jsp"/>

        <!-- Page Content  -->
        <div id="content">
            <div id="container">

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
	                                <ul class="nav navbar-nav ml-auto">
	                                    <li class="nav-item">
	                                        <a class="nav-link active" href="${root }login">로그인</a>
	                                    </li>
	                                    <li class="nav-item">
	                                        <a class="nav-link" href="${root }login/memberadd">회원가입</a>		
	                                    </li>
	                                </ul>
	                            </c:when>
	                            <c:otherwise>
	                            	<script>
	                                	window.history.back();
	                                </script>
	                            </c:otherwise>
	                            
	                        </c:choose>
	                    </div>
	                </div>
	            </nav>
	            <section class="section">
	            	
	            	<form class="form-signin" name="idCheck" method="post" autocomplete="off">
		                <h1 class="h3 mb-3 font-weight-normal">비밀번호 찾기</h1>
		                <label for="name_check">이름</label>
		                <input type="text" id="name_check" name="name_check" class="form-control" placeholder="이름를 입력해주세요." required autofocus/><br/>
		                <label for="id_check">아이디</label>
		                <input type="text" id="id_check" name="id_check" class="form-control" placeholder="아이디를 입력해주세요." required/><br/>
		                <label for="email_check">이메일</label>
		                <input type="text" name="email_check"  id="email_check" class="form-control" placeholder="이메일 주소를 입력해 주세요." required/><br/>
		                <div class="float-right">
			                <button class="Cbtn" onclick="history.back();">뒤로</button>
			                <button class="Cbtn btn-primary" type="button" id="check_btn">확인</button>
		                </div>
		            </form>
		
	            </section>
			</div>
		<!-- #container end -->
		<!-- Footer  -->
			<jsp:include page="../common/footer.jsp"/>
		<!-- Footer end -->
	</div>
	<!-- #content end -->
</div>
<!-- .wrapper end  -->
	
	
	<!-- script start -->
	<!-- jQuery -->
	<script src="${root }js/jquery-1.12.4.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			//email validation 처리 함수
			function verifyEmail(member_email){
				var regExp=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				
				if(member_email.match(regExp) != null){
					return "ok";
				}else{
					return "no";
				}
			}
			
			$("#check_btn").click(function(){
				var name_check=$("#name_check").val();
				var id_check=$("#id_check").val();
				var email_check=$("#email_check").val();
				if(name_check==""){
					alert("이름를 입력해 주세요.");
					return;
				}
				if(id_check==""){
					alert("아이디를 입력해 주세요.");
					return;
				}
				if(email_check==""){
					alert("이베일 주소를 입력해 주세요.");
					return;
				}
				console.log(verifyEmail(email_check));
				if(verifyEmail(email_check)=="no"){
					alert("이메일 양식이 올바르지 않습니다.");
					return;
				}
				document.idCheck.submit();
			});
		});
	</script>
	
    <!-- Popper.JS -->
    <script src="${root }js/bootstrap/popper.js"></script>
    <!-- Bootstrap JS -->
    <script src="${root }js/bootstrap/bootstrap.js"></script>
    <!-- MAIN JS -->
    <script src="${root }js/main.js"></script>
    <!-- script end -->
</body>
</html>