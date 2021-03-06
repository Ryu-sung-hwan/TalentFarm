package com.spring.main.controller;

import java.io.IOException;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/websocket")
public class WebSocket {

	//서버 접속 성공
	@OnOpen
	public void onOpen(Session session){
		System.out.println("서버 접속에 성공");
		sendMsg(session, "반갑습니다.");
	}
	//서버 종료
	@OnClose
	public void onClose(Session session){
		System.out.println("서버 종료에 성공");
	}
	
	//메시지(클라이언트 -> 서버)
	@OnMessage
	public void onMessage(Session session, String msg){
		System.out.println("받은 메시지 : "+msg);
		sendMsg(session, "당신이 보낸 메시지 >> "+msg);
	}
	
	//메시지(서버 -> 클라이언트)
	public void sendMsg(Session session, String msg){
		try {
			session.getBasicRemote().sendText(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
