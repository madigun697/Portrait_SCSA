package org.iptime.madigun697.dao;

import java.util.HashMap;

import org.iptime.madigun697.vo.GPSLog;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GPSLogDAOImpl implements GPSLogDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	// 안드로이드에서 입력된 GPS 정보 저장
	@Override
	public void insertLog(GPSLog gpsLog) {
		session.insert("insertLog", gpsLog);
	}

	// 사진의 시간 전후 30분 이내의 GPS 정보 추출
	@Override
	public GPSLog selectLog(String time, String userId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("time", time);
		return session.selectOne("selectLog", map);
	}
	
}
