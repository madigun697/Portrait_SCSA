package org.iptime.madigun697.dao;

import java.util.List;

import org.iptime.madigun697.vo.People;
import org.iptime.madigun697.vo.Photo;
import org.iptime.madigun697.vo.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PhotoDAOImpl implements PhotoDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	// userId를 통해 사진 삭제
	@Override
	public boolean deletePhoto(String userId) {
		return session.delete("deletePhotoByUserId", userId) < 0 ? false : true;
	}

	// 사진 정보 DB에 추가
	@Override
	public void insertPhotoList(List<Photo> photoList) {
		System.out.println(photoList.size());
		session.insert("syncPhoto", photoList); 
	}

	// 전체 사진 목록 추출
	@Override
	public List<Photo> selectPhotoList(Photo photo) {
		return session.selectList("selectPhotoList", photo);
	}

	// 사진 삭제
	@Override
	public void deletePhoto(String photoId, String userId) {
		Photo photo = new Photo();
		photo.setPhotoId(photoId);
		photo.setUserId(userId);
		session.delete("deletePhoto", photo);
	}

	// 사진 추가
	@Override
	public void insertPhoto(Photo newPhoto) {
		session.insert("insertPhoto", newPhoto);
	}

	// 사진 추출
	@Override
	public Photo selectPhoto(String photoId) {
		return session.selectOne("selectPhoto", photoId);
	}

	// 사진 수정
	@Override
	public void updatePhoto(Photo updatePhoto) {
		session.update("updatePhoto", updatePhoto);
	}

	// 특정 인물이 등록된 사진 랜덤 추출
	@Override
	public String selectPhotoUrl(People people) {
		String photoUrl = null;
		do {
			photoUrl = session.selectOne("selectPhotoUrl", people);
		} while (photoUrl == null || photoUrl.length() == 0);
		
		return photoUrl;
	}

	// 특정 인물이 등록된 사진 목록 추출
	@Override
	public List<Photo> selectPeoplePhotoList(People people) {
		return session.selectList("selectPeoplePhotoList", people);
	}

	// GPS 기준값으로 삼을 사진 추출
	@Override
	public String getInitGeotag(String userId) {
		return session.selectOne("selectRandomPhoto", userId);
		
	}
	
	// 앨범의 사진 갯수 추출 
	@Override
	public int selectCountPhoto(String albumId) {
		return session.selectOne("countPhoto", albumId);
	}

	// 검색
	@Override
	public List<Photo> search(Search keyWords) {
		return session.selectList("search", keyWords);
	}
	
}
