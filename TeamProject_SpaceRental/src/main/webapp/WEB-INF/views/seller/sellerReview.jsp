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

	<%-- 사용자 후기 리스트 --%>
	<div class="container">
		<h1>리뷰 관리</h1>
		<%-- 리뷰 리스트 --%>
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
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
						<td>${tmp.viewcount }</td>
						<td>${tmp.review_regdate }</td>
						<td><a href="${pageContext.request.contextPath}/review/reviewdetail?review_num=${tmp.review_num }">보기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<%-- 리뷰 페이지네이션 --%>
		<nav>
			<ul class="pagination">
				<%--
					startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
				--%>
				
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="sellerReview?pageNum=${startPageNum-1 }">Prev</a>
					</li>
				</c:if>
		        <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item ${pageNum eq i ? 'active' : '' }">
						<a class="page-link" href="sellerReview?pageNum=${i }">${i }</a>
					</li>
		        </c:forEach>
		        <%--
		           	마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
				--%>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="sellerReview?pageNum=${endPageNum+1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</nav>
		
		<a href="${pageContext.request.contextPath}">메인으로 가기</a>
	</div>
</body>
</html>