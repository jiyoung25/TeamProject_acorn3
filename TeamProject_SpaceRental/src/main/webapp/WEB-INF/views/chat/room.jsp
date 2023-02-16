<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.7.14/dist/vue.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container" id="chatRoom">
		<h1>채팅방</h1>
		<form action="${pageContext.request.contextPath}/chat/moveChatting/${room_num}" method="post" id="chatForm">
			<button type="submit" onclick="moveChatting(event)" id="submitBtn" >방 정보 얻기</button>
		</form>
		
	</div>
	
	<script type="text/javascript">
		//방 정보를 얻어오고, 방이 없으면 방을 만든다.
		//방이 있으면 chattingroom으로 이동한다.
		let moveChatting = async function(event){
			//폼 제출을 막은 후 방이 있는지 확인한다.
			event.preventDefault();
			let result = await axios.get('${pageContext.request.contextPath}/chat/getRoom?space_num=147');
			if(result.data.length == 0){
				axios.get('${pageContext.request.contextPath}/chat/createRoom?space_num=147')
			}
			document.querySelector("#chatForm").submit();
		}


		//방 정보를 얻어오는 method
		
		//방을 만드는 method
	</script>
</body>
</html>