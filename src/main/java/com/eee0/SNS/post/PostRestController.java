package com.eee0.SNS.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.eee0.SNS.post.bo.PostBO;

@RestController
public class PostRestController {
	
	@Autowired PostBO postBO;
	
	// 메모 입력 api
	@PostMapping("/post/comment")
	public Map<String, String> comment(
			@RequestParam("content") String content,
			@RequestParam(value="file", required=false) MultipartFile file,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = postBO.comment(content, file, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
