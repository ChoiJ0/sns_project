package com.eee0.SNS.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.eee0.SNS.post.model.Post;

@Repository
public interface PostDAO {
	
	public int insertComment(
			@Param("content") String content,
			@Param("imagePath") String imagePath,
			@Param("userId") int userId
			);

	public List<Post> selectHome();
	
	

}
