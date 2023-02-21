<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<title>/seller/sellerReview</title>
</head>
<body>
	<h3>Review 관리</h3>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>조회수</th>
					<th>작성일</th>
					<th>해당글 보기</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${getReviewList }">
					<tr>
						<td>${tmp.review_num }</td>
						<td>${tmp.review_writer }</td>
						<td>${tmp.review_title }</td>
						<td>${tmp.review_content }</td>
						<td>${tmp.viewcount }</td>
						<td>${tmp.review_regdate }</td>
						<td><a href="${pageContext.request.contextPath}/review/reviewdetail?review_num=${tmp.review_num }">보기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="${pageContext.request.contextPath }">목록으로</a>
	</div>
</body>
</html>