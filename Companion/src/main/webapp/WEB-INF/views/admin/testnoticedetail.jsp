<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>������ - �������� �� ������</h1>
	<form>
		<div>
			<label for="title">title</label>
			<input type="text" name="article_title" id="article_title" value="${adminNoticeOne.article_title }"/>
		</div>
		<div>
			<label for="date">date</label>
			<input type="text" name="article_date" id="article_date" value="${adminNoticeOne.article_date }"/>
		</div>
		<div>
			<label for="content">content</label>
			<input type="text" name="article_content" id="article_content" value="${adminNoticeOne.article_content }"/>
		</div>
		<div>
			<label for="img">img</label>
			<input type="file" name="article_image" id="article_image" value="${adminNoticeOne.article_image }">
		</div>
		<div>
			<button>����</button>
			<button>����</button>
			<button type="reset">���</button>
		</div>
	</form>
	
</body>
</html>