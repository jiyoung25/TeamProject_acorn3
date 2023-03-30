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
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<title>Q&A 관리 :Ubiquitous</title>
<style>
	a {
		text-decoration: none;
	}
	
	a:hover {
		font-weight: bold;
		text-decoration: none;
 	}
</style>
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
					<jsp:include page="/WEB-INF/include/sidebar_admin.jsp"/>
	            </c:when>
			</c:choose>
		</c:otherwise>
	</c:choose>
   	
	<div class="container">
		<h1>Q&A 관리</h1>
		<%-- Q&A 리스트 --%>
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
				<tr>
					<th>방이름</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tmp" items="${getQnaList }">
					<tr>
						<td>${tmp.space_name }</td>
						<td>${tmp.writer }</td>
						<td><a href="${pageContext.request.contextPath}/seller/sellerQnaDetail?num=${tmp.num }">${tmp.title }</a></td>
						<td>${tmp.viewCount }</td>
						<td>${tmp.regdate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<%-- Q&A 페이지네이션 --%>
		<nav>
			<ul class="pagination justify-content-center">
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
		
		<a href="${pageContext.request.contextPath}" class="btn btn-outline-dark">메인으로 가기</a>
	</div>
	
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />
</body>
</html>