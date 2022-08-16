package com.eee0.SNS.post.model;

import com.eee0.SNS.sns.model.User;

public class PostDetail {
	// user 정보
	private User user;
	// post 정보
	private Post post;
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	
	
	
	
}
