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
<title>/views/space/qnaInsertform.jsp</title>
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
	   
	<div class="container">
		<h2 class="mt-2 mb-3">QnA Insert</h2>
		<form action="${pageContext.request.contextPath}/qna/qnaInsert?cate_num=${cate_num}&space_num=${space_num}" method="post">
			<div class="input-group mb-3">
				<span class="input-group-text" style="width:10%; justify-content: center; align-items: center; display: flex;">제목</span>
				<input type="text" name="title" id="title" class="form-control" />
			</div>
			<div class="mt-2">
				<textarea name="content" id="content" class="form-control"></textarea>
				<script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
					CKEDITOR.replace('content',
					{
						filebrowserImageUploadUrl:'${pageContext.request.contextPath}/space/uploadImage'
					});
				</script>
			</div>
			<div class="text-center mt-3">
				<button type="submit" class="btn btn-dark" onclick="submitContents(this)">저장하기</button>
				<button type="button" class="btn btn-outline-dark" onClick="history.back();">뒤로 가기</button>
			</div>
		</form>
	</div>

	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />
</body>
</html>