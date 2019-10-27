package org.iptime.madigun697.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.iptime.madigun697.dao.AlbumDAO;
import org.iptime.madigun697.vo.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AlbumServiceImpl implements AlbumService {
	
	@Autowired
	private AlbumDAO albumDao;

	// 전체 앨범 목록 호출
	@Override
	public List<Album> getAlbumList(String userId) {
		return albumDao.selectAlbumList(userId);
	}

	// 앨범명으로 앨범아이디 추출
	@Override
	public String searchAlbumTitle(String userId, String albumTitle) {
		Album album = new Album();
		album.setUserId(userId);
		album.setAlbumTitle(albumTitle);
		return albumDao.selectAlbumByTitle(album);
	}

	// 새로운 앨범 생성
	@Override
	public String createAlbum(Album album) {
		String albumId = album.getAlbumId();
		if (album.getAlbumId() == null || album.getAlbumId().trim().length() == 0) {
			int rand = (int) (Math.random()*100000000);
			albumId = album.getUserId() + "_" + rand;
			album.setAlbumId(albumId);
		} 
		
		if (albumDao.insertAlbum(album)) {
			return albumId;
		} else {
			return null;
		}
	}
	
	// 앨범 섬네일 갱신
	@Override
	public void updateAlbum(String albumId) {
		int result = 0;
		do {
			result = albumDao.updateThumnail(albumId);
		} while (result == 0);
	}
	
	// 빈 앨범 섬네일로 변경
	@Override
	public void emptyAlbum(String albumId) {
		albumDao.emptyThumnail(albumId);
	}

	// 앨범 제거
	@Override
	public void removeAlbum(Album album) {
		albumDao.deleteAlbum(album);
	}

	// 모든 앨범명 추출
	@Override
	public String getAlbumTitle(String albumId) {
		return albumDao.selectAlbumTitle(albumId);
	}

	// 특정 사진의 섬네일 등록 여부 확인
	@Override
	public boolean CheckThumnail(String photoUrl) {
		return albumDao.selectThumnail(photoUrl);
	}

	// 최초 로그인 시 기본 앨범 생성
	@Override
	public void createDefaultAlbum(String userId) {
		Album album = new Album();
		album.setUserId(userId);
		album.setAlbumId(userId + "_all");
		album.setAlbumTitle("전체 앨범");
		album.setAlbumThumnailLink("http://madigun697.iptime.org/Portrait/thumnail/allphoto_icon.jpg");
		album.setType("DEFAULT");
		albumDao.insertAlbum(album);
		album.setUserId(userId);
		album.setAlbumId(userId + "_unsort");
		album.setAlbumTitle("미분류 앨범");
		album.setAlbumThumnailLink("http://madigun697.iptime.org/Portrait/thumnail/unsortphoto_icon.jpg");
		album.setType("DEFAULT");
		albumDao.insertAlbum(album);
		album.setUserId(userId);
		album.setAlbumId(userId + "_recycle");
		album.setAlbumTitle("휴지통");
		album.setAlbumThumnailLink("http://madigun697.iptime.org/Portrait/thumnail/trash_icon.jpg");
		album.setType("DEFAULT");
		albumDao.insertAlbum(album);
	}

}
