package com.eee0.SNS.sns.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.eee0.SNS.sns.model.User;

@Repository
public interface SnsDAO {

	public int insertUser(
			@Param("loginId") String loginId,
			@Param("name") String name,
			@Param("password") String password,
			@Param("userName") String userName);
	
	// 전달된 loginId가 몇개인지 리턴하는 메소드
	public int selectCountLoginId(@Param("loginId") String loginId);
	
	public User selectUser(
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	// id로 유저 조회
	public User selectUserById(@Param("id") int id);
	
	
}
