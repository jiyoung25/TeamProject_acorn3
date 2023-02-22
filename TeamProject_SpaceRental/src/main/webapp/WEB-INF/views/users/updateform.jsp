<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<title>/views/users/updateform.jsp</title>
<style>
	/* 이미지 업로드 폼을 숨긴다 */
	#imageForm{
		display: none;
	}
	#profileImage{
		width: 200px;
	    height: 200px;
	    border: 1px solid #cecece;
	    border-radius: 50%;
	}
</style>
</head>
<body>	
	<%-- 네비바 --%>
	<c:choose>
		<c:when test="${empty sessionScope.id }">
        	<jsp:include page="/WEB-INF/include/navbar_sidebar_SessionX.jsp"/>
        	<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
      	</c:when>
      	<c:otherwise>
	      	<c:choose>
	      		<c:when test="${usersCode eq 2 }">
	      	  		<jsp:include page="/WEB-INF/include/navbar_sessionO_seller.jsp"/>
	         		<jsp:include page="/WEB-INF/include/sidebar_seller.jsp"/>
	         		<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
	      		</c:when>
	      		<c:when test ="${usersCode eq 3 }">
					<jsp:include page="/WEB-INF/include/navbar_sessionO_users.jsp"/>
			      	<jsp:include page="/WEB-INF/include/sidebar_user.jsp"/>
			      	<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
	      		</c:when>
	      		<c:when test = "${usersCode eq 1 }">
	      			<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
	      		</c:when>
	      	</c:choose>
      	</c:otherwise>
   	</c:choose>
   
	<div class="container">
		<h3>회원 정보 수정</h3>
		
		<a id="profileLink" href="javascript:">
			<c:choose>
				<c:when test="${ empty dto.profile }">
					<img id="profileImage" class="img-fluid rounded-circle mb-1"
	                    src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
	                    alt="..." style="max-width: 200px; max-height: 200px">
				</c:when>
				<c:otherwise>
					<img id="profileImage" src="${pageContext.request.contextPath }${ dto.profile}">
				</c:otherwise>
			</c:choose>
		</a>
		<p class="fst-italic text-muted">프로필이미지 수정은 재로그인시 적용됩니다.</p>        
		<form action="${pageContext.request.contextPath}/users/update" method="post">		
			<input type="hidden" name="profile" 
				value="${ empty dto.profile ? 'empty' : dto.profile }"/>		
			<div>
				<label for="id">아이디</label>
				<input type="text" id="id" value="${id }" disabled/>
			</div>
			<div>
				<label for="email">이메일</label>
				<input type="text" id="email" name="email" value="${dto.email }"/>
			</div>
			<button type="submit" class="btn btn-primary">수정확인</button>
			<button type="reset" class="btn btn-secondary">취소</button>
		</form>	
		
		<form id="imageForm" action="${pageContext.request.contextPath}/users/profile_upload" method="post" enctype="multipart/form-data">
			프로필 사진
			<input type="file" id="image" name="image" accept=".jpg, .png, .gif"/>
			<button type="submit">업로드</button>
		</form>
					
	</div>
	
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
	<script src="${pageContext.request.contextPath }/js/gura_util.js"></script>
	<script>

		//프로필 이미지 링크를 클릭하면 
		document.querySelector("#profileLink").addEventListener("click", function(){
			// input type="file" 을 강제 클릭 시킨다. 
			document.querySelector("#image").click();
		});	
		
		//프로필 이미지를 선택하면(바뀌면) 실행할 함수 등록
		document.querySelector("#image").addEventListener("change", function(){
			//ajax 전송할 폼의 참조값 얻어오기
			const form=document.querySelector("#imageForm");
			//gura_util.js 에 있는 함수를 이용해서 ajax 전송하기 
			ajaxFormPromise(form)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
				// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
				document.querySelector("input[name=profile]").value=data.imagePath;
				
				// img 요소를 문자열로 작성한 다음 
				let img=`<img id="profileImage" 
					src="${pageContext.request.contextPath }\${data.imagePath}">`;
				//id 가 profileLink 인 요소의 내부(자식요소)에 덮어쓰기 하면서 html 형식으로 해석해 주세요 라는 의미 
				document.querySelector("#profileLink").innerHTML=img;
			});
		});		
		
	</script>
</body>
</html>
