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
<title>Insert title here</title>
</head>
<body>
	<h3>QnA 관리</h3>
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
				<c:forEach var="tmp" items="${getQnaList }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.writer }</td>
						<td>${tmp.title }</td>
						<td>${tmp.content }</td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
						<td><a href="${pageContext.request.contextPath}/qna/qnadetail?num=${tmp.num }">보기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="${pageContext.request.contextPath }">목록으로</a>
	</div>
</body>
</html>