<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/qnaList</title>
</head>
<body>
	<div>
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${qnaList }">
					<tr>
						<td>${tmp.num }</td>
						<td>${tmp.writer }</td>
						<td>
							<a href="${pageContext.request.contextPath}/qna/qnadetail?num=${tmp.num }">${tmp.title }</a>
						</td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
						<td>
							<a href="qnaDelete?num=${tmp.num}" onClick="deleteLink(); return false;">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="${pageContext.request.contextPath}">메인으로 가기</a>
	</div>
	<script>
   		const deleteLink = function(){
			confirm("해당 글을 삭제하시겠습니까?")?this.submit():"";
		}
	</script>
</body>
</html>