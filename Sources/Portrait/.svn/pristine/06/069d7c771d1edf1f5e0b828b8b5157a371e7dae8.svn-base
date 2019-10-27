package org.iptime.madigun697.dao;

import java.util.Date;
import java.util.List;

import org.iptime.madigun697.vo.User;

public interface UserDAO {

	// 사용자 로그인
	String login(String userId);

	// 신규 사용자 등록
	void insertUser(User user);

	// 사용자 생일 등록
	void addBirthday(String userId, String birthday);

	//사용자 정보 가져오기
	User getUserInfo(String userId);

	// 전체 사용자 목록
	List<User> selectUserList();

	//Name으로 사용자 정보 가져오기
	User getUserInfoByName(String userName);

}
