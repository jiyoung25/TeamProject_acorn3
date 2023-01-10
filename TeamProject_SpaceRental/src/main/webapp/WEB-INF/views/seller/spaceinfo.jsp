<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SpaceInfo</title>
</head>
<body>
	<div class="container">
		<h1>공간 정보를 입력해 주세요.</h1>
		<form action="insert" method="post">
			<div>
				<label for="space_name">공간명</label><br />
            	<input type="text" name="space_name" id="space_name"/>
			</div>
			<div>
				<label for="oneliner">공간 한 줄 소개</label><br />
				<input type="text" name="oneliner" id="oneliner" />
			</div>
			<div>
				<label for="intro">공간 소개</label><br />
				<textarea name="intro" id="intro" cols="30" rows="10"></textarea>
			</div>
			<div>
				<!-- 이미지 등록 공간 어떤방식으로 해야할지 찾아보고 추가예정 -->
			</div>
			<div>
				<!-- 주소 등록 공간 어떤 방식으로 해야할지 찾아보고 추가예정 -->
			</div>
			<button type="submit">저장</button>
		</form>
	</div>
</body>
</html>