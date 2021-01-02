package com.kh.ontact.chat.controller;


import java.util.ArrayList;
import java.util.List;


import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



public class EchoHandler extends TextWebSocketHandler{
//핸들러 클래스를 구성해야 클라이언트를 관리. 기본적으로 단일연결, 복수연결이 있음.
//크게 3가지(연결-데이터 전송-종료)메소드로 구성됨.
	
	//전체 채팅
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		//맵 쓸때 sessions.put(session.getId(), session)
		//List 사용할때 
		sessionList.add(session);
		//세션값을 불러온 0번째 중괄호에 session.getId()를 넣으라는 뜻임.
		System.out.println(session.getId()+"연결됨 echo~~ 채팅방 입장자");
	}
	
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		System.out.println(session.getPrincipal().getName()+"로부터 "+message.getPayload()+"메시지 받음");
		//session.getPrincipal().getName();
		//연결된 모든 클라이언트에게 메시지 전송 : 리스트 방법
		//getPrincipal()을 이용해서 세션에 몰려있는 유저의 정보를 불러온다.
		//세션의 정보는 user를 이용한 것과 동일하다.
		
		for(WebSocketSession sess : sessionList) {
			//연결된 모든 사용자에게 보내야 하므로 for문으로 sessionList에 있는 모든 세션들에게 메시지를 전송함.
			sess.sendMessage(new TextMessage(session.getPrincipal().getName()+" | "+message.getPayload()));
		}
	}
	
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		//List 삭제
		sessionList.remove(session);
		
		System.out.println(session.getId()+"연결 끊김 echo");
		System.out.println("채팅방 퇴장자:"+session.getPrincipal().getName());
	}
}