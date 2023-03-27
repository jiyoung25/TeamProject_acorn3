<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>회원가입 :Ubiquitous</title>
<%-- 부트스트랩 --%>
<jsp:include page="/WEB-INF/include/cdnlink.jsp" />
<%--페비콘 링크 --%>
<link rel="icon"
	href="${pageContext.request.contextPath}/image/ubiquitous_favicon.png">
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

	<section class="v-100" style="background-color: #eee;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-8">
					<br />
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-2">
							<div class="row justify-content-center">
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">회원가입</p>
									<form action="${pageContext.request.contextPath}/users/signup"
										class="mx-1 mx-md-4" method="post" id="myForm">
										<div>
											<label for="seller">판매자</label> <input type="radio"
												name="code" value="2" id="seller" /> <label for="member">회원</label>
											<input type="radio" name="code" value="3" id="member" checked />
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-user fa-lg me-3 fa-fw"></i>
											<div class="flex-fill mb-0">
												<label class="form-label" for="id">아이디</label> <input
													type="text" name="id" id="id" class="form-control" /> <small
													class="form-text text-muted">5~10자의 영문 소문자.</small>
											</div>
										</div>
										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
											<div class="flex-fill mb-0">
												<label class="form-label" for="email">이메일</label> <input
													type="text" name="email" id="email" class="form-control"
													placeholder="xxx@example.com" />
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
											<div class="flex-fill mb-0">
												<label class="form-label" for="pwd">비밀번호</label>
												<input type="password" name="pwd" id="pwd" class="form-control" />
												<small class="form-text text-muted">8자리이상 영문 대 소문자, 숫자, 특수문자를 사용하세요.</small>
											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<i class="fas fa-key fa-lg me-3 fa-fw"></i>
											<div class="flex-fill mb-0">
												<label class="form-label" for="pwd2">비밀번호 확인</label> <input
													type="password" name="pwd2" id="pwd2" class="form-control" />
											</div>
										</div>

										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<button type="submit" class="btn btn-outline-dark">회원가입</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br />
		</div>
	</section>

	<!-- footer include -->
	<jsp:include page="/WEB-INF/include/footer.jsp" />



	<script>
		//유효성 여부를 저장할 변수를 만들고 초기값 대입 
		let isIdValid=false;
		let isPwdValid=false;
		let isEmailValid=false;	
	
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
		
		function checkPwd(){
			//먼저 2개의 클래스를 제거하고 
			document.querySelector("#pwd").classList.remove("is-valid");
			document.querySelector("#pwd").classList.remove("is-invalid");
			//입력한 두개의 비밀 번호를 읽어와서 
			const pwd=document.querySelector("#pwd").value;
			const pwd2=document.querySelector("#pwd2").value;
			
			//비밀번호를 검증할 정규 표현식
			const reg=/(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
			//만일 정규표현식 검증을 통과 하지 못했다면
			if(!reg.test(pwd)){
				document.querySelector("#pwd").classList.add("is-invalid");
				isPwdValid=false;
				return; //함수를 여기서 끝내라 
			}
			
			//만일 비밀번호 입력란과 확인란이 다르다면
			if(pwd != pwd2){
				document.querySelector("#pwd").classList.add("is-invalid");
				isPwdValid=false;
			}else{//같다면
				document.querySelector("#pwd").classList.add("is-valid");
				isPwdValid=true;
			}
		}
	
		document.querySelector("#pwd").addEventListener("input", function(){
			checkPwd();
		});
		
		document.querySelector("#pwd2").addEventListener("input", function(){
			checkPwd();
		});
	
	
		// id 를 입력 할때 마다 호출되는 함수 등록 
		document.querySelector("#id").addEventListener("input", function(){
			//input 요소의 참조값을 self 에 미리 담아 놓기 
			const self=this;
			//일단 2개의 클래스를 모두 제거 한다음 
			self.classList.remove("is-valid");
			self.classList.remove("is-invalid");
			
			//1. 입력한 아이디를 읽어와서
			const inputId=self.value;
			
			//아이디를 검증할 정규표현식
			const reg=/^[a-z].{4,9}$/;
			//입력한 아이디가 정규표현식과 매칭이 되는지(통과 되는지) 확인한다. 
			const isMatch=reg.test(inputId);
			//만일 매칭되지 않는다면
			if(!isMatch){
				self.classList.add("is-invalid");
				isIdValid=false;
				return; //함수를 여기서 끝내라
			}
			
			//2. 서버에 페이지 전환없이 전송을 하고 응답을 받는다.
			fetch("${pageContext.request.contextPath}/users/checkid?inputId="+inputId)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				//3. 사용가능한지 여부에 따라 아이디 입력란에 is-valid or is-invalid 클래스를 적절히 추가, 제거를 한다.
				console.log(data);
				if(data.isExist){
					self.classList.add("is-invalid");
					isIdValid=false;
				}else{
					self.classList.add("is-valid");
					isIdValid=true;
				}
			});
		});
		
		//폼에 submit 이벤트가 일어 났을때 실행할 함수 등록
		document.querySelector("#myForm").addEventListener("submit", function(event){	
			
			//아래의 코드는 아이디, 비밀번호, 이메일 유효성 검증결과를 고려해서 조건부로 실행되도록 해야 한다.
			//폼 전체의 유효성 여부
			const isFormValid = isIdValid && isPwdValid && isEmailValid;
			//만일 폼이 유효하지 않으면
			if(!isFormValid){
				event.preventDefault(); //폼 전송을 막는다.
				alert('다시 확인해주세요!');
			}
		});
		
		// form 요소
		const myForm = document.getElementById('myForm');
	
		// input 요소들
		const idInput = document.getElementById('id');
		const emailInput = document.getElementById('email');
		const pwdInput = document.getElementById('pwd');
		const pwd2Input = document.getElementById('pwd2');
	
		// submit 버튼 요소
		const submitBtn = document.querySelector('button[type="submit"]');
	
		// form submit 이벤트 리스너
		myForm.addEventListener('submit', (event) => {
		  // 필수 입력값이 모두 채워졌는지 확인
		  if (idInput.value.trim() === '' || emailInput.value.trim() === '' || pwdInput.value.trim() === '' || pwd2Input.value.trim() === '') {
		    event.preventDefault(); // submit 이벤트 취소
		    return; // 함수 종료
		  }
		  
		  // 비밀번호와 비밀번호 확인이 일치하는지 확인
		  if (pwdInput.value !== pwd2Input.value) {
		    event.preventDefault(); // submit 이벤트 취소
		    return; // 함수 종료
		  }
		});
	
		// input 값이 변경될 때마다 버튼 활성화 여부 확인
		myForm.addEventListener('input', () => {
		  // 필수 입력값이 모두 채워졌는지 확인
		  const allInputsFilled = idInput.value.trim() !== '' && emailInput.value.trim() !== '' && pwdInput.value.trim() !== '' && pwd2Input.value.trim() !== '';
	
		  // 비밀번호와 비밀번호 확인이 일치하는지 확인
		  const passwordsMatch = pwdInput.value === pwd2Input.value;
	
		  // 버튼 활성화 여부 결정
		  submitBtn.disabled = !allInputsFilled || !passwordsMatch;
		});
	</script>
</body>
</html>