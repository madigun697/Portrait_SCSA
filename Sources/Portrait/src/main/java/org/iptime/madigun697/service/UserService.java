package org.iptime.madigun697.service;

import java.util.Date;
import java.util.List;

import org.iptime.madigun697.vo.User;

public interface UserService {

	// 사용자 로그인
	String login(String userId);

	// 신규 사용자 등록
	void registryUser(User user);

	// 전체 사용자 목록
	List<User> getUserList();

	//사용자 생일 등록
	void addBirthday(String userId, String birthday);

	//user 정보 가져오기
	User getUserInfo(String userId);

	//Name으로 id 가져오기
	User getUserInfoByName(String UserName);
	
}
