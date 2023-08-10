package com.blackcode.www.websock;
import java.util.HashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.blackcode.www.websock.Dto.ChatMessage;
import com.blackcode.www.websock.Dto.ChatMessage.MessageType;
import com.blackcode.www.websock.Dto.ChatRoom;
import com.blackcode.www.websock.Service.ChatService;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
public class WebSocketHandler extends TextWebSocketHandler {
	private final ObjectMapper objectMapper;
	private final ChatService chatService;
	HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		afterConnectionEstablished(session);
		String msg = message.getPayload();
		log.info(">>{}", msg);
		
		for(String key : sessionMap.keySet()) {
			WebSocketSession wss = sessionMap.get(key);
			try {
				wss.sendMessage(new TextMessage(msg));
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		ChatMessage chatMessage = objectMapper.readValue(msg, ChatMessage.class);
		ChatRoom chatRoom = chatService.findRoomById(chatMessage.getRoomId());
		chatRoom.handlerActions(session, chatMessage, chatService);
 	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//소켓 연결
		super.afterConnectionEstablished(session);
		sessionMap.put(session.getId(), session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//소켓 종료
		sessionMap.remove(session.getId());
		super.afterConnectionClosed(session, status);
	}
}