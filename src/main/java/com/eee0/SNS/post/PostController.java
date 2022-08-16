package com.eee0.SNS.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.eee0.SNS.post.bo.PostBO;
import com.eee0.SNS.post.model.Post;
import com.eee0.SNS.post.model.PostDetail;

@Controller
public class PostController {
	
	@Autowired PostBO postBO;
	
	@GetMapping("/post/profil/view")
	public String profil() {
		return "post/profil";
	}
	
	@GetMapping("/post/home/view")
	public String getHome(Model model) {
		
//		HttpSession session = request.getSession();
//		String userLoginId = (String)session.getAttribute("userLoginId");
		
		List<PostDetail> postDetailList = postBO.getHome();
		
		model.addAttribute("list", postDetailList);
		
		
		return "post/home";
	}
	
	
}
