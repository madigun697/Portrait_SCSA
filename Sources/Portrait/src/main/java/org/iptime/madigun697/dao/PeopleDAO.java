package org.iptime.madigun697.dao;

import java.util.List;
import java.util.Map;

import org.iptime.madigun697.vo.People;
import org.iptime.madigun697.vo.PeopleCnt;
import org.iptime.madigun697.vo.User;

public interface PeopleDAO {

	void deletePeople(People people);

	void insertPeople(People people);

	List<People> selectPeople(People people);

	List<Map> selectPeopleCnt(String userId);

	List<Integer> selectCntList(String userId);

	List<PeopleCnt> searchName(String name);

}