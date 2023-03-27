<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp"/>
<%--페비콘 링크 --%>
<link rel="icon" href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
<title>회원 정보수정 :Ubiquitous</title>
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
   
	<div class="container text-center">
		<div class="row shadow p-3 mb-5 mt-5 bg-body rounded">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<h3 class="mt-3 mb-3">회원 정보 수정</h3>
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
				<form action="${pageContext.request.contextPath}/users/update" method="post">		
					<input type="hidden" name="profile" 
						value="${ empty dto.profile ? 'empty' : dto.profile }"/>
					<div class="row text-center mt-4">
						<div class="input-group mb-3">
							<span class="input-group-text" style="width:30%; justify-content: center; align-items: center; display: flex;">아이디</span>
							<input type="text" id="id" value="${id }" class="form-control" disabled />
						</div>
					</div>
					<div>
						<div class="input-group mb-3">
							<span class="input-group-text" style="width:30%; justify-content: center; align-items: center; display: flex;">이메일</span>
							<input type="text" id="email" name="email" value="${dto.email }" class="form-control"/>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-4 mb-1" style="padding:5px;"><button type="submit" id="submitBtn" class="btn btn-dark" style="width:100%;">수정확인</button></div>
						<div class="col-lg-5 mb-1" style="padding:5px;"><button type="button" class="btn btn-dark" style="width:100%;" data-bs-toggle="modal" data-bs-target="#pwdModal">비밀번호 변경</button></div>
						<div class="col-lg-3 mb-1" style="padding:5px;"><button type="reset" class="btn btn-outline-dark " style="width:100%;">취소</button></div>				
					</div>
				</form>	
				
				<form id="imageForm" action="${pageContext.request.contextPath}/users/profile_upload" method="post" enctype="multipart/form-data">
					프로필 사진
					<input type="file" id="image" name="image" accept=".jpg, .png, .gif"/>
					<button type="submit">업로드</button>
				</form>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="pwdModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Message</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							비밀번호를 변경하시겠습니까 ?
						</div>
		                <div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/users/pwd_updateform' ">확인</button>
		                </div>
					</div>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
	
	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp"/>
	<%-- 프로필 이미지 --%>
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
		<%-- 이메일 검증식 --%>
		let isEmailValid = true;
		document.querySelector("#email").addEventListener("input", function(){
			this.classList.remove("is-valid");
			this.classList.remove("is-invalid");
			//입력한 이메일
			const inputEmail=this.value;
			//이메일을 검증할 정규 표현식  
			const reg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			//만일 입력한 이메일이 정규표현식 검증을 통과 하지 못했다면
			if(!reg.test(inputEmail)){
				this.classList.add("is-invalid");
				isEmailValid=false;
			}else{//통과 했다면 
				this.classList.add("is-valid");
				isEmailValid=true;
			}
		});
		document.querySelector("#submitBtn").addEventListener("click", function(e){
			if(!isEmailValid){
				e.preventDefault();
				alert("이메일을 확인해주세요.");
			}
		});
	</script>
</body>
</html>
