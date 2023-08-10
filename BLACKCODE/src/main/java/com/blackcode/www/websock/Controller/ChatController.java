package com.blackcode.www.websock.Controller;
//import java.util.List;

import java.net.http.WebSocket;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.blackcode.www.websock.Dto.ChatRoom;
import com.blackcode.www.websock.Service.ChatService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/chat")
public class ChatController {

	private final ChatService chatService;
	
	@PostMapping
	public ChatRoom createRoom(@RequestParam String name) {
		System.out.println("Room Name : "+name);
		return chatService.createRoom(name);
	}
	
	@RequestMapping("/rooms")
	public ModelAndView selectRoom_page() {
		ModelAndView modelAndView = new ModelAndView("chat/Chatrooms");
		System.out.println(chatService.findAllRoom());
		List<ChatRoom> list = chatService.findAllRoom();
		modelAndView.addObject("rooms",list);
		return modelAndView;
	}
	
//	@RequestMapping("/create")
//	public ModelAndView createRoom_page() {
//		ModelAndView modelAndView = new ModelAndView("chat/CreateRoom");
//		System.out.println("CREATE ROOM");
//		return modelAndView;
//	}
	
	@RequestMapping("/join")
	public ModelAndView joinRoom_page(@RequestParam String roomId) {
		ModelAndView modelAndView = new ModelAndView("chat/JoinRoom");
		System.out.println("JOIN ROOM : "+ roomId);
		modelAndView.addObject("room",chatService.findRoomById(roomId));
		
		return modelAndView;
	}
}