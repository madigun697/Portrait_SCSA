package org.iptime.madigun697.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.iptime.madigun697.vo.Event;
import org.iptime.madigun697.vo.Photo;

public interface EventDao {
	
	//이벤트 등록
	void addEvent(Event event);
	
	//이벤트 업데이트
	void updateEvent( ArrayList<String> photoIdList, String eventId);
	
	//이벤트 리스트 호출
	List<Event> getEventList(String userId);

	//이벤트 사진 리스트
	List<Photo> findEventPhoto(String eventId);
	
	//이벤트 검색
	Event searchEvent(String eventId);

	//userId로 event 등록이 안 된 사진만 조회하는 기능
	List<Photo> addiblePhotos(String userId);

	//eventId 를 null로 set
	void makeEventIdNull(List<Photo> eventPhotoList);

	//eventTable에서 해당 event를 삭제
	void deleteEvent(String eventId);

	
	//eventId로 photoUrl 가지고 오기
	String getPhotoUrl(String eventId);

	
}
