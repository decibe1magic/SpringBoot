package com.blackcode.www.websock.Dto;
import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

import com.blackcode.www.websock.Service.ChatService;

import lombok.Builder;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
public class ChatRoom {
	private String roomId;
	private String name;
	private Set<WebSocketSession> sessions = new HashSet<>();

	@Builder
	public ChatRoom(String roomId, String name) {
		log.info("roomID : "+roomId);
		log.info("name : "+name);
		this.roomId = roomId;
		this.name = name;
	}
	
	public void handlerActions(WebSocketSession session, ChatMessage chatMessage, ChatService chatService) {
		if (chatMessage.getType().equals(ChatMessage.MessageType.ENTER)) {
			sessions.add(session);
			chatMessage.setMessage(chatMessage.getSender() + "님이 입장했습니다.");
		}
		sendMessage(chatMessage, chatService);
		System.out.println("세션길이 : "+sessions.size());
	}
	
	private <T> void sendMessage(T message, ChatService chatService) {
		sessions.parallelStream()
				.forEach(session -> chatService.sendMessage(session, message));
	}
	
	public void sessionDistroy(WebSocketSession session) {
		System.out.println("세션길이 : "+sessions.size());
		sessions.remove(session);
		System.out.println("세션길이 : "+sessions.size());
	}
}