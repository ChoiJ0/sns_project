package com.eee0.SNS.sns.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eee0.SNS.common.EncryptUtils;
import com.eee0.SNS.sns.dao.SnsDAO;
import com.eee0.SNS.sns.model.User;

@Service
public class SnsBO {
	
	@Autowired SnsDAO snsDAO;
	
	public int addUser(String loginId, String name, String password, String userName) {
		String encryptPassword = EncryptUtils.md5(password);
		
		return snsDAO.insertUser(loginId, name, encryptPassword, userName);
	}
	
	// 아이디를 전달 받고 중복 여부를 알려주는 메소드
	public boolean check_id(String loginId) {
		
//		int count = snsDAO.selectCountLoginId(loginId);
//		if(count == 0) {
//			return false;
//		} else {
//			return true;
//		}
		
		return snsDAO.selectCountLoginId(loginId) == 0;
	}
	
	// 로그인 체크
	public User getUser(String loginId, String password) {
		String encryptPassword = EncryptUtils.md5(password);
		return snsDAO.selectUser(loginId, encryptPassword);
		
	}
	
	// id로 사용자 정보 조회 가능
	public User getUserById(int id) {
		return snsDAO.selectUserById(id);
	}
	
	
}
