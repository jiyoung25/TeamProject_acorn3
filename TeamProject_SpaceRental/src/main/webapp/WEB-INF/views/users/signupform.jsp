<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>SignupForm</h1>
		<form action="${pageContext.request.contextPath}/users/signup"
			method="post" id="myForm">
			<div>
				<label for="admin">관리자</label>
				<input type="radio" name="code" value="1" id="admin" />
				<label for="seller">판매자</label>
				<input type="radio" name="code" value="2" id="seller" />
				<label for="member">회원</label>
				<input type="radio" name="code" value="3" id="member" />
			</div>
			<br />
			<div>
				<label class="control-label" for="id">아이디</label> 
				<input class="form-control" type="text" name="id" id="id" />
				<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요</small>
			</div>
			<br />
			<div>
				<label class="control-label" for="pwd">비밀번호</label> 
				<input class="form-control" type="password" name="pwd" id="pwd" />
				<small class="form-text text-muted">숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상으로 입력하세요</small>
			</div>
			<br />
			<div>
				<label class="control-label" for="pwd2">비밀번호 확인</label> 
				<input class="form-control" type="password" name="pwd2" id="pwd2"/>
			</div>
			<br />
			<div>
				<label class="control-label" for="email">이메일</label> 
				<input class="form-control" type="text" name="email" id="email" placeholder="xxx.example.com"/>
				<small class="form-text text-muted"></small>
			</div>
			<br />
			<button type="submit">가입</button>
		</form>
	</div>
	
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
		fetch("checkid.jsp?inputId="+inputId)
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
	</script>
</body>
</html>