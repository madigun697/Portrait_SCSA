package org.iptime.madigun697.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.iptime.madigun697.vo.Event;
import org.iptime.madigun697.vo.Photo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class EventDaoImpl implements EventDao {
	
	
	@Autowired
	private SqlSessionTemplate session;

	//이벤트 등록
	@Override
	public void addEvent(Event event) {
		session.insert("addEvent", event);
	}
	
	//이벤트 업데이트
	public void updateEvent(ArrayList<String> photoIdList, String eventId) {
		for(String photoId: photoIdList){
			Photo photo = new Photo();
			photo.setEventId(eventId);
			photo.setPhotoId(photoId);

			session.update("updateEventId", photo);
		}
	}
	
	//이벤트 목록 호출
	@Override
	public List<Event> getEventList(String userId) {
		List<Event> list = session.selectList("getEventList", userId);
		
		
		return list;
	}

	//이벤트 사진 리스트
	@Override
	public List<Photo> findEventPhoto(String eventId) {
		List<Photo> list = session.selectList("findEventPhoto", eventId);
		
		return list;
	}

	//이벤트 검색 
	@Override
	public Event searchEvent(String eventId) {
		Event event= session.selectOne("searchEvent", eventId);
		return event;
	}

	
	//userId로 event 등록이 안 된 사진만 조회하는 기능
	@Override
	public List<Photo> addiblePhotos(String userId) {
		
		List<Photo> list = session.selectList("addiblePhotos", userId);
		
		return list;
	}

	//eventId 를 null로 set
	@Override
	public void makeEventIdNull(List<Photo> eventPhotoList) {
		for(Photo photo: eventPhotoList){
			session.update("makeEventIdNull", photo);
		}
	}

	//eventTable에서 해당 event를 삭제
	@Override
	public void deleteEvent(String eventId) {
		session.delete("deleteEvent", eventId);
		
	}

	
	//eventId로 photoUrl 가지고 오기
	@Override
	public String getPhotoUrl(String eventId) {
		String photoUrl = session.selectOne("getPhotoUrl", eventId);
		return photoUrl;
	}
	
}
