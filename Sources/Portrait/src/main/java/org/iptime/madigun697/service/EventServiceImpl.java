package org.iptime.madigun697.service;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.iptime.madigun697.dao.EventDao;
import org.iptime.madigun697.vo.Event;
import org.iptime.madigun697.vo.Photo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class EventServiceImpl implements EventService {

	@Autowired 
	private EventDao eventDao;
	
	//이벤트 등록
	@Override
	public List<Photo> addEvent(String userId, String eventName, String eventDate,
		ArrayList<String> photoIdList, String eventDesc) {
		int rand = (int) (Math.random()*100000000);
		String eventId =rand + eventName;
		Event event = new Event(eventId, eventName, eventDate, userId, eventDesc);
		eventDao.addEvent(event);
		eventDao.updateEvent(photoIdList, eventId);
		List<Photo> list = eventDao.findEventPhoto(eventId);
		
		return list;
	}

	//이벤트 리스트 호출
	@Override
	public List<Event> getEventList(String userId) {
		List<Event> list = eventDao.getEventList(userId);
		return list;
	}

	//이벤트 사진 리스트
	@Override
	public List<Photo> findEventPhoto(String eventId) {
		
		List<Photo> list = eventDao.findEventPhoto(eventId);

		return list;
	}

	//이벤트 검색 기능
	@Override
	public Event searchEvent(String eventId) {
		Event event = eventDao.searchEvent(eventId);
		return event;
	}

	//userId로 event 등록이 안 된 사진만 조회하는 기능
	@Override
	public List<Photo> addiblePhotos(String userId) {
		List<Photo> list = eventDao.addiblePhotos(userId);
		return list;
	}

	
	
	//photoIdList 의 사진들의 eventId 를 null로 만들기
	@Override
	public void makeEventIdNull(List<Photo> eventPhotoList) {
		eventDao.makeEventIdNull(eventPhotoList);
		
	}
	
	//새 목록에 eventId 를 set
	@Override
	public void setNewEventId(ArrayList<String> photoIdList, String eventId) {
		eventDao.updateEvent(photoIdList, eventId);
	}

	//eventTable에서 해당 event를 삭제
	@Override
	public void deleteEvent(String eventId) {
		eventDao.deleteEvent(eventId);
		
	}

	//eventId로 photoUrl 가지고 오기
	@Override
	public String getPhotoUrl(String eventId) {
		String photoUrl= eventDao.getPhotoUrl(eventId);
		return photoUrl;
	}
	
	
	
}
