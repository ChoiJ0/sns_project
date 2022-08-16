package com.eee0.SNS.sns;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.eee0.SNS.sns.bo.SnsBO;
import com.eee0.SNS.sns.model.User;

@RestController
public class SNSRestController {
	
	@Autowired SnsBO snsBO;
	
	@PostMapping("/user/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId,
			@RequestParam("name") String name,
			@RequestParam("password") String password,
			@RequestParam("userName") String userName) {
		
		int count = snsBO.addUser(loginId, name, password, userName);
		
		Map<String, String> map = new HashMap<>();
		
		if(count == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;
	}
	
	// 아이디 중복 확인 api
	@GetMapping("/user/check")
	public Map<String, Boolean> check_id(String loginId) {
		
		Map<String, Boolean> result = new HashMap<>(); 
		
		if(snsBO.check_id(loginId)) {
			result.put("is_duplicate", false);
		} else {
			result.put("is_duplicate", true);
		}
		
		return result;
	}
	
	
	// 로그인 api
	@PostMapping("/user/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request){
		
		User user = snsBO.getUser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) { // 로그인 성공
			result.put("result", "success");
			
			HttpSession session = request.getSession();
			// user id, user loginId
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			
		} else { // 로그인 실패
			result.put("result", "fail");
		}
		
		return result; 
	}
	
}
