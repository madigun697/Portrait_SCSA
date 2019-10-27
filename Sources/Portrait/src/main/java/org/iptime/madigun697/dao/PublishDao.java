package org.iptime.madigun697.dao;
import java.util.List;

import org.iptime.madigun697.vo.Publish;

public interface PublishDao {

	//공유 사진 정보 등록
	void insertPublishDB(Publish publish);
	
	//내게 전송된 사진 목록 중 받지 않은 것들의 앨범아이디를 들고 옴
	List<Publish> getPublishInfo(String userId);

	//userId와 publishAlbumId를 이용해 해당 앨범의 사진을 가지고 온다.
	List<Publish> getPublish(String receiveUserId, String publishAlbumId);


	//denyList를 가져와 receivedMsg를 True, accept를 false 로 바꾼다.(확인 O, 수락X)
	void denyPublish(Publish publish);

	//acceptList를 가져와 receivedMsg를 True, accept를 True 로 바꾼다.(확인 O, 수락 O)
	void acceptPublish(Publish publish);

	

}
