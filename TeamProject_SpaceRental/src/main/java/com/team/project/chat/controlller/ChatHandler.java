package com.team.project.chat.controlller;

import java.util.HashMap;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Configuration
public class ChatHandler extends TextWebSocketHandler {
	HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	
    @Override //소켓 연결
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓을 연결할 때 실행되는 메소드
		super.afterConnectionEstablished(session);
		sessionMap.put(session.getId(), session);
		
		//object 형식으로 json 문자열을 전송한다. { "type" : "getId", "sessionId":session.getId() }
		JsonObject obj = new JsonObject();
		obj.addProperty("type", "getId");
		obj.addProperty("sessionId", session.getId());
		//위에서 만든 obj를 string 형태로 전송
		session.sendMessage(new TextMessage(obj.toString()));
    }
    
    //소켓 종료
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionMap.remove(session.getId());
		super.afterConnectionClosed(session, status);
    }
    
    //메시지 발송
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//메시지 발송
		String msg = message.getPayload();
		for(String key : sessionMap.keySet()) {
			WebSocketSession wss = sessionMap.get(key);
			try {
				wss.sendMessage(new TextMessage(msg));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
    }
    
    //json형태의 문자열을 파라미터로 받아서 JsonObject로 파싱처리를 해주는 함수
    private static JsonObject jsonToObject(String jsonStr) {
    	JsonParser parser = new JsonParser();
    	JsonObject obj = null;
    	try {
    		obj = (JsonObject) parser.parse(jsonStr);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return obj;
    }
}
