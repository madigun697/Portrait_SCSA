package org.iptime.madigun697.dao;

import java.util.Date;
import java.util.List;

import org.iptime.madigun697.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	// 사용자 로그인
	@Override
	public String login(String userId) {
		String albumId = session.selectOne("login", userId);
		return albumId;
	}

	// 신규 사용자 등록
	@Override
	public void insertUser(User user) {
		session.insert("newUser", user);
	}

	//사용자 생일 등록
	@Override
	public void addBirthday(String userId, String birthday) {
		User user = new User();
		user.setUserId(userId);
		user.setBirthday(birthday);
		session.update("addBirthday", user);
	}

	//사용자 정보 가져오기
	@Override
	public User getUserInfo(String userId) {
		
		User selectOne = session.selectOne("getUserInfo", userId);
		
		return selectOne;
		
	}
	// 전체 사용자 목록
	@Override
	public List<User> selectUserList() {
		return session.selectList("selectUserList");
	}

	
	//Name으로 사용자 정보 가져오기
	@Override
	public User getUserInfoByName(String userName) {
		User user = session.selectOne("getUserInfoByName", userName);
		
		return user;
	}
}
