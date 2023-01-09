		let onChatbot = function(e){
			let question = "question";
			let answer = "answer";
			let num = e.target.value;
	        fetch("chatbot/qna?num="+num)
	        .then(function(response){
	        	console.log(response);
	            return response.text();
	        })
	        .then(function(data){
	        	question = JSON.parse(data).question;
	        	console.log(question);
	            answer = JSON.parse(data).answer;
	            
	            //질문을 띄우기 위한 작업
		        let questionBox = document.createElement("div");
		        questionBox.className += "chat ch1 animate__animated animate__fadeInLeft";
		        let questionChild1 = document.createElement("div");
		        questionChild1.className += "icon";
		        let questionChild2 = document.createElement("div");
		        questionChild2.className+="textbox";
		        questionChild2.innerText=question;
		        questionBox.appendChild(questionChild1);
		        questionBox.appendChild(questionChild2);
		        document.querySelector("#chatbot_main").append(questionBox);
		        
		        //답변을 띄우기 위한 작업
		        let answerBox = document.createElement("div");
		        answerBox.className += "chat ch2 animate__animated animate__fadeInRight animate__delay-1s";
		        let answerChild1 = document.createElement("div");
		        answerChild1.className+="textbox";
		        answerChild1.innerText=answer;
		        answerBox.appendChild(answerChild1);
		        document.querySelector("#chatbot_main").append(answerBox);
		        
		        //스크롤 맨 아래로 내리기
		        let divScroll = document.querySelector("#chatbot_body");
		        divScroll.scrollTop = divScroll.scrollHeight;
	        })
		}