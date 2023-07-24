package com.blackcode.www.theme.thymeleaf.Business;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BusinessController {
	private String path = "thymeleaf/theme/business-frontpage";
	
	@GetMapping("/theme/thymeleaf/business")
	public String themeIndex() {
		// return 기본경로 : src/main/resource/static
		System.out.println(path+"/index.html");
		return path+"/index.html";
	}
	
}
