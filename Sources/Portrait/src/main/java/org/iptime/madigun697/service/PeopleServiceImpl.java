package org.iptime.madigun697.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.iptime.madigun697.dao.PeopleDAO;
import org.iptime.madigun697.vo.People;
import org.iptime.madigun697.vo.PeopleCnt;
import org.iptime.madigun697.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PeopleServiceImpl implements PeopleService {
	
	@Autowired
	private PeopleDAO peopleDao;

	// 사진 내의 인물 태그 제거
	@Override
	public void removePeople(String photoId, String userId) {
		People people = new People();
		people.setPhotoId(photoId);
		people.setUserId(userId);
		peopleDao.deletePeople(people);
	}

	// 사진에 인물 태그 추가
	@Override
	public People addPeople(String peopleName, String photoId, String userId) {
		peopleName = peopleName.trim();
		People people = new People(photoId, peopleName, userId);
		peopleDao.insertPeople(people);
		return people;
	}

	// 사진 내의 인물 태그 목록 추출
	@Override
	public List<People> getPeople(String photoId, String userId) {
		People people = new People();
		people.setPhotoId(photoId);
		people.setUserId(userId);
		return peopleDao.selectPeople(people);
	}

	// 전체 사진에서 태그된 인물 Counting
	@Override
	public Map<String, Integer> getPeopleCount(String userId) {
		List<Map> peopelCnt = peopleDao.selectPeopleCnt(userId);

		Map<String, Integer> peopleCntList = new HashMap<String, Integer>();

		for (Map map : peopelCnt) {
			String peopleName = map.get("PEOPLENAME").toString();
			String cnt = map.get("CNT").toString();
			peopleCntList.put(peopleName, Integer.parseInt(cnt));
		}
		
		return peopleCntList;
	}

	// 인물 별 사진 갯수 추출
	@Override
	public List<Integer> getCntList(String userId) {
		return peopleDao.selectCntList(userId);
	}

	// 인물명으로 사진 검색
	@Override
	public List<PeopleCnt> searchName(String name) {
		
		return peopleDao.searchName(name);
	}
	
}
