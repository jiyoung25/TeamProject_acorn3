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
<%-- CKEditor --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<%-- import from static folder --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/star.css">
<script src = "${pageContext.request.contextPath}/js/star.js"></script>
<title>/views/view/reviewupdateform.jsp</title>
<style>
	
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
   	
	<div class="container">
		<h2 class="mt-2 mb-3">Review Update</h2>
		<form action="reviewupdate" method="post">
			<input type="hidden" name="review_num" value="${dto.review_num }" />
			<div class="input-group mb-3">
				<span class="input-group-text" style="width:10%; justify-content: center; align-items: center; display: flex;">작성자</span>
				<input type="text" id="review_writer" class="form-control" value="${dto.review_writer }" disabled />
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text" style="width:10%; justify-content: center; align-items: center; display: flex;">제목</span>
				<input type="text" name="review_title" id="review_title" class="form-control" value="${dto.review_title }" />
			</div>
			<div class="input-group mb-3">
				<%-- 별점 --%>
				<span class="input-group-text" style="width:10%; justify-content: center; align-items: center; display: flex;">별점</span>
				<span style="border:solid #DEE2E6 1px; width:90%; border-top-right-radius:5px; border-bottom-right-radius:5px;">
					<span class="star" style="font-size:1.5rem">
					  ★★★★★
					  <span style="width:${dto.star * 10}%;">★★★★★</span>
					  <input type="range" name="star" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
					</span>
				</span>
			</div>
			<div>
				<textarea name="review_content" class="form-control" id="review_content">${dto.review_content }</textarea>
					<script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
						CKEDITOR.replace('review_content',
						{
							filebrowserImageUploadUrl:'${pageContext.request.contextPath}/space/uploadImage'
						});
					</script>
			</div>
			<div class="text-center mt-3">
				<button type="submit" class="btn btn-dark" onclick="submitContents(this);">수정확인</button>
				<button type="button" class="btn btn-outline-dark" onClick="history.back();">뒤로 가기</button>
			</div>
		</form>
	</div>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
</body>
</html>