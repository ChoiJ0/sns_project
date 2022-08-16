package com.eee0.SNS.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eee0.SNS.post.dao.PostDAO;
import com.eee0.SNS.post.model.Post;
import com.eee0.SNS.post.model.PostDetail;
import com.eee0.SNS.sns.bo.SnsBO;
import com.eee0.SNS.sns.model.User;

@Service
public class PostBO {

	@Autowired PostDAO postDAO;
	
	@Autowired SnsBO snsBO;
	
	public int comment(String content, String imagePath, int userId) {
		return postDAO.insertComment(content, imagePath, userId);
	}

	public List<PostDetail> getHome() {
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		List<Post> postList = postDAO.selectHome();
		
		for(Post post : postList ) {
			int userId = post.getUserId();
			//user 테이블 조회
			// userBO 를 통해서 userId 와 일치하는 사용자 정보 조회
			User user = snsBO.getUserById(userId);
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setUser(user);
			
			postDetailList.add(postDetail);
			
		}
		
		
		return postDetailList;
		
	}
	
}
