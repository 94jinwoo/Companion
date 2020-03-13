<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- Font Awesome JS -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<!-- jQuery -->
	<script src="${root}js/jquery-1.12.4.js"></script>
	<!-- Popper.JS -->
	<script src="${root}js/bootstrap/popper.js"></script>
	<!-- Bootstrap JS -->
	<script src="${root}js/bootstrap/bootstrap.js"></script>
	<title>Sidebar</title>
</head>
<body>
	<!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Companion</h3>
                <strong>BS</strong>
            </div>

            <ul class="list-unstyled components">
                <li class="active">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-home"></i>
                        쇼핑하기
                    </a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="#">사료</a>
                        </li>
                        <li>
                            <a href="#">간식</a>
                        </li>
                        <li>
                            <a href="#">장난감</a>
                        </li>
                        <li>
                            <a href="#">미용/목욕용품</a>
                        </li>
                        <li>
                            <a href="#">화장실/위생용품</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#hotelSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-copy"></i>
                        호텔서비스
                    </a>
                    <ul class="collapse list-unstyled" id="hotelSubmenu">
                        <li>
                            <a href="#">이용안내</a>
                        </li>
                        <li>
                            <a href="#">예약하기</a>
                        </li>
                        <li>
                            <a href="#">룸미리보기</a>
                        </li>
                        <li>
                            <a href="#">돌보미정보</a>
                        </li>
                        <li>
                            <a href="#">위치정보</a>
                        </li>
                    </ul>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                        <i class="fas fa-copy"></i>
                        알림
                    </a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="#">공지사항</a>
                        </li>
                        <li>
                            <a href="#">이벤트</a>
                        </li>
                        <li>
                            <a href="#">Q&A</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-image"></i>
                        추가
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-question"></i>
                        추가
                    </a>
                </li>
            </ul>

            <ul class="list-unstyled conn">
                <li>
                    <a href="#" class="login">로그인</a>
                </li>
                <li>
                    <a href="#" class="join">회원가입</a>
                </li>
            </ul>
            <!-- <ul class="list-unstyled CTAs">
                <li>
                    <a href="https://bootstrapious.com/tutorial/files/sidebar.zip" class="download">Download source</a>
                </li>
                <li>
                    <a href="https://bootstrapious.com/p/bootstrap-sidebar" class="article">Back to article</a>
                </li>
            </ul> -->
        </nav>
<script type="text/javascript">
	$(document).ready(function () {
		$('#sidebarCollapse').on('click', function () {
			$('#sidebar').toggleClass('active');
		});
	});
</script>
</body>
</html>