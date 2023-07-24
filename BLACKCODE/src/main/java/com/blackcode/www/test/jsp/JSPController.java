package com.blackcode.www.test.jsp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/* 
	application.yaml 파일에서 Controller설정을 아래와 같은 경로로 정의 
	prefix: /WEB-INF/views/
	suffix: .jsp
	return 경로 : /WEB-INF/views/
 */
@Controller // file 리턴
public class JSPController {
	private String path = "test/jsp/";
	@GetMapping("/test/jsp/index")
	public String servletIndex(Model model) {
		System.out.println("/WEB-INF/views/"+path+"test.jsp");
		return path+"index";
	}
}
