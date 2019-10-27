package org.iptime.madigun697.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.iptime.madigun697.vo.Event;
import org.iptime.madigun697.vo.Photo;


public interface EventService {

	//이벤트 등록
	List<Photo> addEvent(String userId, String eventName, String eventDate, ArrayList<String> photoIdList, String eventDesc);
	
	//이벤트 리스트 호출
	List<Event> getEventList(String userId);

	
	//이벤트 사진 리스트
	List<Photo> findEventPhoto(String eventId);

	//이벤트 검색
	Event searchEvent(String eventId);

	//userId로 event 등록이 안 된 사진만 조회하는 기능
	List<Photo> addiblePhotos(String userId);

	//photoIdList 의 사진들의 eventId 를 null로 만들기
	void makeEventIdNull(List<Photo> eventPhotoList);

	//받아온 eventId를 받아와서 해당 photoList에 update
	void setNewEventId(ArrayList<String> photoIdList, String eventId);

	//eventTable에서 해당 event를 삭제
	void deleteEvent(String eventId);

	//eventId로 photoUrl 가지고 오기
	String getPhotoUrl(String eventId);
	

	
}
