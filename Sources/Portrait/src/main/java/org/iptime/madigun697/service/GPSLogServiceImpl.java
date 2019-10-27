package org.iptime.madigun697.service;

import org.iptime.madigun697.dao.GPSLogDAO;
import org.iptime.madigun697.vo.GPSLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GPSLogServiceImpl implements GPSLogService {

	@Autowired
	private GPSLogDAO gpsLogDao;
	
	// 안드로이드에서 전달된 GPS 로그 추가
	@Override
	public void addLog(GPSLog gpsLog) {
		gpsLogDao.insertLog(gpsLog);
	}

	// 사진 시간을 기준으로 GPS 로그 검색
	@Override
	public GPSLog searchLog(String time, String userId) {
		return gpsLogDao.selectLog(time, userId);
	}

}
