package com.blackcode.www.test.thymeleaf;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller // file 리턴
public class ThymeleafController {
	
	private String path = "thymeleaf";
	
	@GetMapping("/test/thymeleaf/index")
	public String thymeleafIndex(@RequestParam(name="name", required = false, defaultValue = "Default Message")String name, Model model) {
		System.out.println("src/main/resources/templates/"+path+"/test.html");
		// return 기본경로 : src/main/resources/templates/
		return path+"/test";
	}
	
}
