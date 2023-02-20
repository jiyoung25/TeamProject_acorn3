<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/users/reviewList</title>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet"/>
<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/star.css" />
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
	      		</c:when>
	      	</c:choose>
      	</c:otherwise>
   	</c:choose>
   	
   	<%-- 사용자 후기 리스트 --%>
	<div class="container">
		<h1>나의 후기</h1>
		
		<%-- 사용자가 사용한 방 -> 리뷰 쓰기 가능 --%>
		<form action="${pageContext.request.contextPath}/review/reviewInsertform" method="POST">
			<label for="possibleReview">리뷰 쓰기</label>
			<select name="possibleReview" id="possibleReview">
				<c:forEach items="${possibleReview }" var="item">
					<option value="${item.reserv_num }&&${item.space_num}&&${item.cate_num}"><strong>${item.space_name } 방 리뷰쓰기</strong></option>
				</c:forEach>
			</select>
			<button>리뷰 쓰기</button>
		</form>
		<%-- 리뷰 리스트 --%>
		<table class="table align-middle mb-0 bg-white">
			<thead class="bg-light">
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>별점</th>
					<th>날짜</th>
					<th>삭제</th>
		    	</tr>
		  	</thead>
			<tbody>
				<c:forEach var="tmp" items="${reviewList }">
					<tr>
						<td>${tmp.review_num }</td>
						<td>${tmp.review_writer }</td>
						<td>
							<a href="${pageContext.request.contextPath}/review/reviewdetail?review_num=${tmp.review_num }">${tmp.review_title }</a>
						</td>
						<td>${tmp.viewcount }</td>
						<td>
							<%-- 별점 --%>
							<span class="star">
								★★★★★
								<span style="width: ${tmp.star *10 }%;">★★★★★</span>
							</span>
						</td>
						<td>${tmp.review_regdate }</td>
						<td>
							<a href="reviewDelete?review_num=${tmp.review_num}" onClick="deleteLink(); return false;">삭제</a>
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