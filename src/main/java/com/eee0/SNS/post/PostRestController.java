package com.eee0.SNS.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.eee0.SNS.post.bo.PostBO;

@RestController
public class PostRestController {
	
	@Autowired PostBO postBO;
	
	@PostMapping("/post/comment")
	public Map<String, String> comment(
			@RequestParam("content") String content,
			@RequestParam("imagePath") String imagePath,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.comment(content, imagePath, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
