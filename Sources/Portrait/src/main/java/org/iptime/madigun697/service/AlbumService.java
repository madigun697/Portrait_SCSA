package org.iptime.madigun697.service;

import java.util.List;
import java.util.Map;

import org.iptime.madigun697.vo.Album;

public interface AlbumService {

	// 전체 앨범 목록 호출
	List<Album> getAlbumList(String userId);

	// 앨범명으로 앨범아이디 추출
	String searchAlbumTitle(String userId, String albumTitle);

	// 새로운 앨범 생성
	String createAlbum(Album album);

	void removeAlbum(Album album);

	String getAlbumTitle(String albumId);

	void createDefaultAlbum(String userId);

	void updateAlbum(String albumId);

	boolean CheckThumnail(String photoUrl);

	void emptyAlbum(String albumId);


}
