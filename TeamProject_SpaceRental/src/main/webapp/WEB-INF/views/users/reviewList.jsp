<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>나의 Review :Ubiquitous</title>
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%--import from static folder --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/star.css" />
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
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
   	
   	<%-- 사용자 후기 리스트 --%>
	<div class="container">
		<h1 class="mt-3 mb-3">나의 Review</h1>
		<%-- 사용자가 사용한 방 -> 리뷰 쓰기 가능 --%>
		<div class="mb-3">
			<form action="${pageContext.request.contextPath}/review/reviewInsertform" method="POST">
				<div class="row">
					<div class="col-md-4 mb-3">
						<select name="possibleReview" id="possibleReview" class="form-select">
							<c:choose>
								<c:when test="${not empty possibleReview }">
									<c:forEach items="${possibleReview }" var="item">
										<option value="${item.reserv_num }&&${item.space_num}&&${item.cate_num}"><strong>${item.space_name } 방 리뷰쓰기</strong></option>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<option value="">방을 이용해주세요.</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
					<div class="col-md-2">
						<button class="btn btn-outline-dark" style="width:100%;">리뷰 쓰기</button>
					</div>
					<div class="col-6"></div>
				</div>
			</form>
		</div>
	</div>
		<%-- 리뷰 리스트 --%>
	<div class="container">
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
				<tr>
					<th>방이름</th>
					<th>제목</th>
					<th>별점</th>
					<th>조회수</th>
					<th>날짜</th>
					<th>삭제</th>
		    	</tr>
		  	</thead>
			<tbody>
				<c:forEach var="tmp" items="${reviewList }">
					<tr>
						<td>${tmp.space_name }</td>
						<td>
							<a href="${pageContext.request.contextPath}/users/usersReviewDetail?review_num=${tmp.review_num }">${tmp.review_title }</a>
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
			<ul class="pagination justify-content-center">
				<%--
					startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
				--%>
				<c:if test="${startPageNum ne 1 }">
					<li class="page-item">
						<a class="page-link" href="reviewList?pageNum=${startPageNum-1 }">Prev</a>
					</li>
				</c:if>
		        <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<li class="page-item ${pageNum eq i ? 'active' : '' }">
						<a class="page-link" href="reviewList?pageNum=${i }">${i }</a>
					</li>
		        </c:forEach>
		        <%--
		           	마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
				--%>
				<c:if test="${endPageNum lt totalPageCount }">
					<li class="page-item">
						<a class="page-link" href="reviewList?pageNum=${endPageNum+1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</nav>
		
		<a href="${pageContext.request.contextPath}" class="btn btn-outline-dark">메인으로 가기</a>
	</div>
	<script>
   		const deleteLink = function(){
			confirm("해당 글을 삭제하시겠습니까?")?this.submit():"";
		}
	</script>
	
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
</body>
</html>