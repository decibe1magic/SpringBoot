package com.blackcode.www.websock.Controller;
//import java.util.List;

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
	
//	@GetMapping
	@RequestMapping("/rooms")
	public ModelAndView selectRoom_page() {
		ModelAndView modelAndView = new ModelAndView("chat/Chatrooms");
//		modelAndView.setViewName("chat/Chatrooms");	//page 위치
		System.out.println(chatService.findAllRoom().toString());
		List<ChatRoom> list = chatService.findAllRoom();
		modelAndView.addObject("rooms",list);
//		return chatService.findAllRoom();
		return modelAndView;
	}
	
	@RequestMapping("/create")
	public ModelAndView createRoom_page() {
		ModelAndView modelAndView = new ModelAndView("chat/CreateRoom");
		System.out.println("CREATE ROOM");
		return modelAndView;
	}
}