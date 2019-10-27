package org.iptime.madigun697.dao;

import java.util.List;

import org.iptime.madigun697.vo.Publish;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PublishDaoImpl implements PublishDao {

	@Autowired
	private SqlSessionTemplate session;

	//공유 사진 정보 등록
	@Override
	public void insertPublishDB(Publish publish) {
		System.out.println(publish.toString());
		session.insert("insertPublishDB", publish);
	}

	//내게 전송된 사진 목록 중 받지 않은 것들의 앨범아이디를 들고 옴
	@Override
	public List<Publish> getPublishInfo(String userId) {
		List<Publish> list = session.selectList("getPublishInfo", userId);
		return list;
	}

	
	//userId와 publishAlbumId를 이용해 해당 앨범의 사진을 가지고 온다.
	@Override
	public List<Publish> getPublish(String receiveUserId, String publishAlbumId) {
		////userId와 publishAlbumId로 객체 만들기
		Publish publish = new Publish(receiveUserId, publishAlbumId);
		List<Publish> list = session.selectList("getPublish", publish);
		return list;
	}

	//denyList를 가져와 receivedMsg를 True, accept를 false 로 바꾼다.(확인 O, 수락X)
	@Override
	public void denyPublish(Publish publish) {
		session.update("denyPublish", publish);
		
	}

	//acceptList를 가져와 receivedMsg를 True, accept를 True 로 바꾼다.(확인 O, 수락 O)
	@Override
	public void acceptPublish(Publish publish) {
		session.update("acceptPublish", publish);
		
	}

	
	
	
	
	
	

}
