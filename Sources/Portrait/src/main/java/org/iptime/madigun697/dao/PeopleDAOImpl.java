package org.iptime.madigun697.dao;

import java.util.List;
import java.util.Map;

import org.iptime.madigun697.vo.People;
import org.iptime.madigun697.vo.PeopleCnt;
import org.iptime.madigun697.vo.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PeopleDAOImpl implements PeopleDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	// 사진에서 인물 태그 제거
	@Override
	public void deletePeople(People people) {
		session.delete("deletePeople", people);
	}

	// 사진에 인물 태그 추가
	@Override
	public void insertPeople(People people) {
		session.insert("insertPeople", people);
	}

	// 사진에 등록된 인물 태그 검색
	@Override
	public List<People> selectPeople(People people) {
		return session.selectList("selectPeople", people);
	}

	// 전체 사진에서 태그된 인물 Counting
	@Override
	public List<Map> selectPeopleCnt(String userId) {
		return session.selectList("selectPeopleCount", userId);
	}

	// 인물 별 사진 갯수 추출
	@Override
	public List<Integer> selectCntList(String userId) {
		return session.selectList("selectCount", userId);
	}

	// 인물명으로 검색
	@Override
	public List<PeopleCnt> searchName(String name) {
		// TODO Auto-generated method stub
		return session.selectList("searchPeopleByName", name);
	}
	
}
