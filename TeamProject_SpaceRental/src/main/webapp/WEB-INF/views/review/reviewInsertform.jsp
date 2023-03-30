<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" review_content="width=device-width, initial-scale=1">
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%-- CKEditor --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<%-- import from static folder --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/star.css">
<script src = "${pageContext.request.contextPath}/js/star.js"></script>
<title>Review 추가 :Ubiquitous</title>
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
   	
   	<%-- 리뷰 입력 폼 --%>
	<div class="container">
		<div class="row">
			<h2 class="mt-2 mb-3">Review 추가</h2>
			<form id="insertForm" action="${pageContext.request.contextPath}/review/reviewInsert" method="post">
				<input type="hidden" name="cate_num" value="${cate_num }" />
				<input type="hidden" name="space_num" value="${space_num }" />
				<input type="hidden" name="reserv_num" value="${reserv_num }" />
				<div class="input-group mb-3">
					<span class="input-group-text" style="width:10%; justify-content: center; align-items: center; display: flex;">제목</span>
					<input type="text" name="review_title" id="review_title" class="form-control" />
				</div>
				<div class="input-group mb-3">
					<%-- 별점 --%>
					<span class="input-group-text" style="width:10%; justify-content: center; align-items: center; display: flex;">별점</span>
					<span style="border:solid #DEE2E6 1px; width:90%; border-top-right-radius:5px; border-bottom-right-radius:5px;">
						<span class="star" style="font-size:1.5rem">
						  	★★★★★
						  	<span>★★★★★</span>
						  	<input type="range" name="star" id="star" oninput="drawStar(this)" value="0" step="1" min="0" max="10">
						</span>
					</span>
				</div>
				<div class="mt-2">
					<textarea name="review_content" class="form-control" id="review_content"></textarea>
					<script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
						CKEDITOR.replace('review_content',
						{
							filebrowserImageUploadUrl:'${pageContext.request.contextPath}/space/uploadImage'
						});
					</script>
				</div>
				<div class="text-center mt-3">
					<button type="submit" id="submitBtn" class="btn btn-dark" onclick="submitContents(this)">저장하기</button>
					<button type="button" class="btn btn-outline-dark" onClick="history.back();">뒤로 가기</button>
				</div>
			</form>
		</div>
	</div>
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
	<!-- js -->
	<script>		
		document.querySelector("#submitBtn").addEventListener("click", function(e){
	        if(document.getElementById('review_title').value == ''){
				e.preventDefault();//제출완료 페이지로 넘어가는 것 방지
				alert('제목을 입력해 주세요.');
			} else if(document.getElementById('star').value == 0){
	          	e.preventDefault();
	          	alert('별점을 입력해 주세요.');
	        } else{
	        	document.querySelector("#insertForm").submit();
	        }	        
	    });
	</script>
</body>
</html>