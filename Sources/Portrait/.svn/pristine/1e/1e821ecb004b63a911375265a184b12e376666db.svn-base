package org.iptime.madigun697.service;

import java.util.List;
import java.util.Map;

import org.iptime.madigun697.vo.People;
import org.iptime.madigun697.vo.PeopleCnt;
import org.iptime.madigun697.vo.User;

public interface PeopleService {

	void removePeople(String photoId, String userId);

	People addPeople(String peopleName, String photoId, String userId);

	List<People> getPeople(String photoId, String userId);

	Map<String, Integer> getPeopleCount(String userId);

	List<Integer> getCntList(String userId);

	List<PeopleCnt> searchName(String name);

}
