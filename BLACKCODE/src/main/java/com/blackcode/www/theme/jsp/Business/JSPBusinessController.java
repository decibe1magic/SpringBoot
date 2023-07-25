package com.blackcode.www.theme.jsp.Business;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JSPBusinessController {
	private String path = "/theme/jsp/business/";
	
	@GetMapping("/theme/jsp/business")
	public String themeIndex() {
		// return 기본경로 : src/main/resource/static
		System.out.println(path+"/index.html");
		return path+"index";
	}
	
}
