<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" review_content="width=device-width, initial-scale=1">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%-- import from static folder --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/star.css">
<script src = "${pageContext.request.contextPath}/js/star.js"></script>
<title>/views/review/reviewInsertform.jsp</title>
<style>
	textarea{
		width: 768px;
		height: 300px;
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
	      		</c:when>
	      	</c:choose>
      	</c:otherwise>
   	</c:choose>
   	
   	<%-- 리뷰 입력 폼 --%>
	<div class="container">
		<div class="row">
		<h3>리뷰 작성</h3>
			<form action="${pageContext.request.contextPath}/review/reviewInsert" method="post">
				<input type="hidden" name="cate_num" value="${cate_num }" />
				<input type="hidden" name="space_num" value="${space_num }" />
				<input type="hidden" name="reserv_num" value="${reserv_num }" />
				<div>
					<input type="text" name="review_title" id="review_title" class="form-control" type="text" placeholder="제목" aria-label=".form-control-lg example"/>
				</div>
				<div>
					<%-- 별점 --%>
					<span class="star" style="font-size:2.0rem">
					  ★★★★★
					  <span>★★★★★</span>
					  <input type="range" name="star" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
					</span>
				</div>
				<div class="mt-2">
					<div id="editor" name="review_content">This is some sample content.</div>
				</div>
				<button type="submit" class="btn btn-outline-dark"onclick="submitContents(this)">저장</button>
			</form>
		</div>
	</div>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
	<!-- CKEditor -->
	<script src="https://cdn.ckeditor.com/ckeditor5/31.1.0/classic/ckeditor.js"></script>
	<script>
	  ClassicEditor
	    .create( document.querySelector( '#editor' ) )
	    .catch( error => {
	      console.error( error );
	    } );
	</script>
</body>
</html>