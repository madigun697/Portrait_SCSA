package org.iptime.madigun697.service;

import java.util.Date;
import java.util.List;

import org.iptime.madigun697.dao.UserDAO;
import org.iptime.madigun697.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDao;

	// 사용자 로그인
	@Override
	public String login(String userId) {
		return userDao.login(userId);
	}

	// 신규 사용자 등록
	@Override
	public void registryUser(User user) {
		userDao.insertUser(user);
	}

	// 전체 사용자 목록
	@Override
	public List<User> getUserList() {
		return userDao.selectUserList();
	}

	//사용자 생일 등록
	@Override
	public void addBirthday(String userId, String birthday) {
		userDao.addBirthday(userId, birthday);
		
	}

	//user 정보 가져오기
	@Override
	public User getUserInfo(String userId) {
		User user = userDao.getUserInfo(userId);
		return user;
		
	}

	//Name으로 user정보 가져오기
	@Override
	public User getUserInfoByName(String UserName) {
		User user = userDao.getUserInfoByName(UserName);
		return user;
	}
}