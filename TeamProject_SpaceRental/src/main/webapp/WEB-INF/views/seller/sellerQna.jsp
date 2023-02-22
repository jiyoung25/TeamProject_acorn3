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
	<%-- 네비바 --%>
	<c:choose>
		<c:when test="${empty sessionScope.id }">
        	<jsp:include page="/WEB-INF/include/navbar_sidebar_SessionX.jsp"/>
      	</c:when>
      	<c:otherwise>
	      	<c:choose>
	      		<c:when test="${usersCode eq 2 }">
	      	  		<jsp:include page="/WEB-INF/include/navbar_sessionO_seller.jsp"/>
	         		<jsp:include page="/WEB-INF/include/sidebar_seller.jsp"/>
	      		</c:when>
	      		<c:when test ="${usersCode eq 3 }">
					<jsp:include page="/WEB-INF/include/navbar_sessionO_users.jsp"/>
			      	<jsp:include page="/WEB-INF/include/sidebar_user.jsp"/>
	      		</c:when>
	      		<c:when test = "${usersCode eq 1 }">
	      			<jsp:include page="/WEB-INF/include/navbar_sessionO_admin.jsp"/>
	      		</c:when>
	      	</c:choose>
      	</c:otherwise>
   	</c:choose>
	<div class="container">
		<h1>QnA 관리</h1>
		<%-- Q&A 리스트 --%>
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
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
		
		<nav>
			<ul class="pagination">
				<%--
		        	qnaStartPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
		        --%>
		        <c:if test="${qnaStartPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="sellerQna?qnaPageNum=${qnaStartPageNum-1 }">Prev</a>
					</li>
		        </c:if>
		        <c:forEach var="i" begin="${qnaStartPageNum }" end="${qnaEndPageNum }">
					<li class="page-item ${qnaPageNum eq i ? 'active' : '' }">
						<a class="page-link" href="sellerQna?qnaPageNum=${i }">${i }</a>
					</li>
		        </c:forEach>
		        <%--
		        	마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
		        --%>
		        <c:if test="${qnaEndPageNum lt qnatotalPageCount }">
					<li class="page-item">
						<a class="page-link" href="sellerQna?qnaPageNum=${qnaEndPageNum+1 }">Next</a>
					</li>
		        </c:if>
			</ul>
		</nav>
		
		<a href="${pageContext.request.contextPath }">메인으로</a>
	</div>
</body>
</html>