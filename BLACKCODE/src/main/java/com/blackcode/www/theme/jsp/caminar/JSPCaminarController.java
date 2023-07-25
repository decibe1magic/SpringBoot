package com.blackcode.www.theme.jsp.caminar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JSPCaminarController {
	private String path = "/theme/jsp/caminar/";
	
	@GetMapping("/theme/jsp/caminar")
	public String themeIndex() {
		// return 기본경로 : src/main/resource/static
		System.out.println("타임리프 적용 전 경로 : src/main/resource/static"+path+"/index.html");
		System.out.println("타임리프 적용 후 경로 : src/main/resources/templates/"+path+"/index.html");
		return path+"index";
	}
	
	@GetMapping("/theme/jsp/caminar/elements")
	public String themeElement() {
		// return 기본경로 : src/main/resource/static
		System.out.println("타임리프 적용 전 경로 : src/main/resource/static"+path+"/elements.html");
		System.out.println("타임리프 적용 후 경로 : src/main/resources/templates/"+path+"/elements.html");
		return path+"elements";
	}
	
}
