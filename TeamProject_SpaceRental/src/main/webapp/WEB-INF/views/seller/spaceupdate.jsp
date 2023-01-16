<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공간수정폼</title>
</head>
<body>
	<div class="container">
		<h1>공간 정보를 입력해 주세요.</h1>
		<form action="${pageContext.request.contextPath}/seller/update" method="post" id="updateForm">
			<div>
				<label for="space_name">공간명</label><br />
            	<input type="text" name="space_name" id="space_name" value=${dto.space_name } />
			</div>
			<div style="display:hidden">
				카테고리
				<select name="cate_name">
					<option value="${dto.cate_name }">${dto.cate_name }</option>	
				</select>
			</div>
			<div>
				<label for="oneliner">공간 한 줄 소개</label><br />
				<input type="text" name="oneliner" id="oneliner" value=${dto.oneliner } />
			</div>
			<div>
				<label for="intro">공간 소개</label><br />
				<textarea name="intro" id="intro" cols="30" rows="10" >${dto.intro } </textarea>
			</div>
			<input type="hidden" id="mainImagePath" name="mainImagePath" />
			<div>
				<label for="addr">주소</label><br />
				<input type="text" name="addr" id="addr" value=${dto.addr } />
			</div>
		</form>
		<form action="${pageContext.request.contextPath}/seller/ajax_upload" method="post" id="ajaxForm"enctype="multipart/form-data">
		    <div>
		    	<label for="image">이미지</label>
		    	<input type="file" name="image" id="image" 
		    		accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		    </div>
		</form>
  		<div class="img-wrapper">
     		<img src="/space/${dto.mainImagePath }" />
  		</div>

		<button id="submitBtn">저장</button>
	</div>
	<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
	<script>
		//이미지를 선택했을 때, 실행할 함수 등록
		document.querySelector("#image").addEventListener("change", function(){
			//id 가 ajaxForm 인 form 을 ajax 전송 시킨다.
			const form = document.querySelector("#ajaxForm");
			//util 함수를 이용해서 ajax 전송
			ajaxFormPromise(form)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				//data : {mainImagePath:"/upload/xxx.jpg"} 형식의 obj
				console.log(data);
				//이미지 경로에 context Path 추가하기
				const path = "${pageContext.request.contextPath}" + data.mainImagePath;
				//img 태그에 경로 추가
				document.querySelector(".img-wrapper img").setAttribute("src", path);
				//위의 form 의 input hidden 요소에 value 로 넣어서 db 에 저장
				document.querySelector("#mainImagePath").value = data.mainImagePath;
			});
		});		


		document.querySelector("#submitBtn").addEventListener("click", function(){
			document.querySelector("#updateForm").submit();
		});
	</script>

</body>
</html>