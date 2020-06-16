package org.iptime.madigun697.dao;

import java.util.List;
import java.util.Map;

import org.iptime.madigun697.vo.Album;

public interface AlbumDAO {

	// 전체 앨범 목록 호출
	List<Album> selectAlbumList(String userId);

	// 앨범명으로 앨범 정보 추출
	String selectAlbumByTitle(Album album);

	// 새로운 앨범 추가
	boolean insertAlbum(Album album);

	void deleteAlbum(Album album);

	String selectAlbumTitle(String albumId);

	int updateThumnail(String albumId);

	boolean selectThumnail(String photoUrl);

	void emptyThumnail(String albumId);

}