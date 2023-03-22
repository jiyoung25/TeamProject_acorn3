<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%-- vue.js --%>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/star.css" />
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<title>관리자 Review 관리</title>
</head>
<body>
	<jsp:include page="/WEB-INF/include/navbar_sessionO_admin.jsp"/>
	<jsp:include page="/WEB-INF/include/sidebar_admin.jsp"/>
	<br>
	<%-- Review 리스트 --%>
	<div class="container">
		<h1>관리자 Review 관리</h1>
		<br>
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
				<tr>
					<th>방이름</th>
					<th>작성자</th>
					<th>제목</th>
					<th>별점</th>
					<th>조회수</th>
					<th>날짜</th>
					<th>삭제</th>
		    	</tr>
		  	</thead>
			<tbody>
				<c:forEach var="tmp" items="${adminReview }">
					<tr>
						<td>${tmp.space_name }</td>
						<td>${tmp.review_writer }</td>
						<td>
							<a href="${pageContext.request.contextPath}/review/reviewdetail?review_num=${tmp.review_num }">${tmp.review_title }</a>
						</td>
						<td>
							<%-- 별점 --%>
							<span class="star">
								★★★★★
								<span style="width: ${tmp.star *10 }%;">★★★★★</span>
							</span>
						</td>
						<td>${tmp.viewcount }</td>
						<td>${tmp.review_regdate }</td>
						<td>
							<a href="reviewDelete?review_num=${tmp.review_num}" onClick="deleteLink(); return false;">삭제</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<%-- 리뷰 페이지네이션 --%>
		<nav>
			<ul class="pagination">
				<%--
					startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
				--%>
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="adminReview?pageNum=${startPageNum-1 }">Prev</a>
					</li>
				</c:if>
		        <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item ${pageNum eq i ? 'active' : '' }">
						<a class="page-link" href="adminReview?pageNum=${i }">${i }</a>
					</li>
		        </c:forEach>
		        <%--
		           	마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
				--%>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="adminReview?pageNum=${endPageNum+1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</nav>
		
		<a href="${pageContext.request.contextPath}" class="btn btn-outline-dark">메인으로 가기</a>
	</div>
	
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />
	
	<script>
   		const deleteLink = function(){
			confirm("해당 글을 삭제하시겠습니까?")?this.submit():"";
		}
	</script>
</body>
</html>