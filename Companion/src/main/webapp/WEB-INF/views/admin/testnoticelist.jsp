<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<h1>관리자 - 공지사항 리스트 페이지</h1>
	<a href="${root }admin/testnoticeadd">입력</a>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>이미지</th>
			</tr>
		</thead>
		<tbody>
		<!-- forEach start -->
		<c:forEach items="${adminNoticeList }" var="bean">
			<tr>
				<td><a href="testnoticedetail/${bean.article_id }">${bean.article_id }</a></td>
				<td><a href="testnoticedetail/${bean.article_id }">${bean.member_id }</a></td>
				<td><a href="testnoticedetail/${bean.article_id }">${bean.article_title }</a></td>
				<td><a href="testnoticedetail/${bean.article_id }">${bean.article_content }</a></td>
				<td><a href="testnoticedetail/${bean.article_id }">${bean.article_date }</a></td>
				<td><a href="testnoticedetail/${bean.article_id }">${bean.article_count }</a></td>
				<td><a href="testnoticedetail/${bean.article_id }">${bean.article_image }</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>