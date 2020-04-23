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
		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="${root}css/bootstrap/bootstrap.css">
		<!-- Our Custom CSS -->
		<link rel="stylesheet" href="${root}css/home.css">
		<!-- Our Custom CSS -->
		<link rel="stylesheet" href="${root}css/main.css">
		<!-- Font Awesome JS -->
		<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
		<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
		<style type="text/css">
		.btn {
			    height: 34px;
			    background: #eee linear-gradient(to bottom, #fcfcfc, #eee);
			    border: 1px solid #d5d5d5;
			    border-radius: 4px;
			    display: inline-flex;
			    align-items: center;
			    padding: 0 12px;
			    font-size: 14px;
			    font-weight: 500;
			    line-height: 1.5;
			    cursor: pointer;
			    box-sizing: border-box;
			    position: relative;
			    color: #333;
			}
			
		textarea {
			width:80%;
			height:100px;
		}	
			
			
		</style>

	</head>
<body>
<h1>상품문의 내역을 작성해주세요.</h1>
	<form>
			<p><textarea placeholder="문의 내용을 입력해주세요."></textarea></p>		
			<input type="submit" value="문의등록">
			<input type="submit" value="취소">
			<div class="custom-control custom-switch">
			  <input type="checkbox" class="custom-control-input" id="customSwitch1">
			  <label class="custom-control-label" for="customSwitch1">비밀글</label>
			</div>
	</form>
	<h4>◎ 상품 문의 작성 유의사항
	전화번호, 이메일 등 개인 정보가 포함된 글 작성이 필요한 경우 관리자만 볼 수 있도록 비밀글로 문의해 주시기 바랍니다.
	</h4>
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






























