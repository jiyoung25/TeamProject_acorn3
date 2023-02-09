<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	*{
		margin:0;
		padding:0;
	}
	.container{
		width: 500px;
		margin: 0 auto;
		padding: 25px;
	}
	.container h1{
		text-align: left;
		padding: 5px 5px 5px 15px;
		border-left: 3px solid #FFBB00;
		margin-bottom:20px;
	}
	.chatting{
		background-color: #000;
		width: 500px;
		height: 500px;
		overflow: auto;
	}
	.chatting p{
		color:#fff;
		text-align: left;
	}
	input{
		width: 330px;
		height: 25px;
	}
</style>
<title>chatting</title>
</head>
<body>
	<div id="container" class="container">
		<h1>채팅</h1>
		<div id="chatting" class="chatting"></div>
		<div id="yourName">
		<input type="hidden" id="sessionId" value="${sessionScope.id }">	
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatMsg" placeholder="보낼 메시지를 입력해주세요."/></th>
					<th><button type="button" onclick="sendMsg()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
	<script>
		let ws;
		
		//WebSocketConfig에 설정해둔 path로 WebSocket이 생성됨.(application.properties에 설정한 context-path도 쓰지 않으면 오류가 뜸)
		const wsOpen = function(){
			ws = new WebSocket("ws://"+location.host+"/ubiquitous/chatting");
			wsEvt();
		}
		
		const wsEvt = function(){
			ws.onopen = function(data){
				//소켓이 열리면 초기화
			}
			
			//데이터 수신시 발생함
			ws.onmessage = function(data){
				let msg = data.data;
				if(msg != null && msg.trim() !=""){
					//json 형식으로 전송받은 message를 parse한다. 
					let d = JSON.parse(msg);
					console.log(d);
					
					//ws.open할 때 실행된다. (ws.open을 하면 ChatHandler의 afterConnectionEstablished메소드(소켓 연결 메소드)가 실행되면서 생성된다.)
					if(d.type == "getId"){
						let sessionId = d.sessionId != null ? d.sessionId : "";
						if(sessionId != ""){
							document.querySelector("#sessionId").value = sessionId;
						} 
					//ws.send()로 받아온 정보이다.
					} else if(d.type == "message"){
						if(d.sessionId == document.querySelector("#sessionId").value){
							const makeP = document.createElement("p");
							makeP.classList.add("me");
							makeP.innerText="나: "+d.msg;
							document.querySelector("#chatting").append(makeP);
						} else{
							const makeP = document.createElement("p");
							makeP.classList.add("others");
							makeP.innerText=d.userName+":"+d.msg;
							document.querySelector("#chatting").append(makeP);
						}
					} else{
						console.warn("unknown type!");
					}	
				}
			}
			document.addEventListener("keypress", function(e){
				if(e.keyCode == 13){
					sendMsg();
				}
			});
		}
		
		function sendMsg(){
			//전송할 정보를 option이라는 변수에 object형식으로 담는다.
			let option={
					type:"message",
					sessionId : "${sessionScope.id}",
					userName : "${sessionScope.id}",
					msg : document.querySelector("#chatMsg").value
			}
			//WebSocket객체를 이용해 정보를 전송한다.
			ws.send(JSON.stringify(option));
			document.querySelector("#chatMsg").value= "";
		}
		
		wsOpen();
		<%--
			ws.open – 커넥션이 제대로 만들어졌을 때 발생함
			ws.message – 데이터를 수신하였을 때 발생함
			ws.error – 에러가 생겼을 때 발생함
			ws.close – 커넥션이 종료되었을 때 발생함
		 --%>
	</script>
</body>
</html>