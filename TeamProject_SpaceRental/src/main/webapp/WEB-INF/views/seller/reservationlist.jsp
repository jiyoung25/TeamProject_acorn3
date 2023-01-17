<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>예약리스트 보기(판매자)</title>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet"/>
<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
</head>
<body>
	<!-- 네비바 include -->
	<c:choose>
		<c:when test="${empty sessionScope.id }">
        	<jsp:include page="/WEB-INF/include/navbar_sidebar_SessionX.jsp"/>
      	</c:when>
      	<c:otherwise>
	      	<c:choose>
	      		<c:when test="${dto.code eq 2 }">
	      	  		<jsp:include page="/WEB-INF/include/navbar_sessionO_seller.jsp"/>
	         		<jsp:include page="/WEB-INF/include/sidebar_seller.jsp"/>
	      		</c:when>
	      		<c:otherwise>
					<jsp:include page="/WEB-INF/include/navbar_sessionO_users.jsp"/>
			      	<jsp:include page="/WEB-INF/include/sidebar_user.jsp"/>
	      		</c:otherwise>
	      	</c:choose>
      	</c:otherwise>
   </c:choose>
	<div class="container">
		<h3>예약목록</h3>
		<div id="reservList">
			<table class="table">
			  <thead>
					<tr class="table-info">
						<th scope="row">예약 번호</th>
						<th scope="row">방 이름</th>
						<th scope="row">예약자 명</th>
						<th scope="row">예약자 수</th>
						<th scope="row">예약 날짜</th>
						<th scope="row">예약 시간</th>
						<th scope="row">예약 등록일</th>
						<th scope="row">총 비용</th>
						<th scope="row">예약 수락</th>
						<th scope="row">예약 거절</th>
					</tr>
			  </thead>
			  <c:forEach var="tmp" items="${list }">
					<form action="${pageContext.request.contextPath}/seller/reservCheck" id="reservCheckForm">
						<tbody>
							<tr>
								<td>${tmp.reserv_num }</td>
								<td>${tmp.space_name }</td>
								<td>${tmp.users_id }</td>
								<td>${tmp.reserv_count }</td>
								<td>${tmp.reserv_date }</td>
								<td>${tmp.reserv_time }</td>
								<td>${tmp.reserv_reg }</td>
								<td>${tmp.totalMoney }</td>
								<td><button type="button" class="checkBtn" value="true">Ok</button></td>
								<td><button type="button" class="checkBtn" value="false">Reject</button></td>
							</tr>
						</tbody>
					</form>		
				</c:forEach>
			</table>
		</div>
	
		<%-- 페이징 --%>
		<nav>
			<ul class="pagination">
				<%--
		        	startPageNum 이 1 이 아닌 경우에만 Prev 링크를 제공한다. 
		        	&condition=${condition}&keyword=${encodedK}
		        --%>
		        <c:if test="${startPageNum ne 1 }">
		            <li class="page-item">
		            	<a class="page-link" href="list?pageNum=${startPageNum-1 }&condition=${condition}&keyword=${encodedK}">Prev</a>
		        	</li>
		        </c:if>
		        <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
		            <li class="page-item ${pageNum eq i ? 'active' : '' }">
		            	<a class="page-link" href="list?pageNum=${i }&condition=${condition}&keyword=${encodedK}">${i }</a>
		        	</li>
		        </c:forEach>
		        <%--
		           마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next 링크를 제공한다. 
		        --%>
		        <c:if test="${endPageNum lt totalPageCount }">
		            <li class="page-item">
		            	<a class="page-link" href="list?pageNum=${endPageNum+1 }&condition=${condition}&keyword=${encodedK}">Next</a>
		        	</li>
		    	</c:if>
			</ul>
		</nav>
	</div>
	
	<script>
		document.querySelector(".checkBtn").
	</script>
   
		<!-- footer include -->
	  <jsp:include page="/WEB-INF/include/footer.jsp"/>
</body>
</html>