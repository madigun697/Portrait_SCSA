package org.iptime.madigun697.dao;

import java.util.List;
import java.util.Map;

import org.iptime.madigun697.vo.Album;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AlbumDAOImpl implements AlbumDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	// 전체 앨범 목록 호출
	@Override
	public List<Album> selectAlbumList(String userId) {
		return session.selectList("selectAlbumList", userId);
	}

	// 앨범명으로 앨범 정보 추출
	@Override
	public String selectAlbumByTitle(Album album) {
		return session.selectOne("selectAlbumByTitle", album);
	}

	// 새로운 앨범 추가
	@Override
	public boolean insertAlbum(Album album) {
		return session.insert("insertAlbum", album) > 0 ? true : false;
	}

	// 앨범 삭제
	@Override
	public void deleteAlbum(Album album) {
		session.update("moveAlbum", album);
		session.delete("deleteAlbum", album);
	}

	// 앨범 아이디로 앨범 명 추출
	@Override
	public String selectAlbumTitle(String albumId) {
		return session.selectOne("selectAlbumTitle", albumId);
	}

	// 앨범의 섬네일 변경
	@Override
	public int updateThumnail(String albumId) {
		return session.update("updateThumnail", albumId);
	}

	// 특정 사진의 섬네일 등록 여부 확인
	@Override
	public boolean selectThumnail(String photoUrl) {
		return session.selectOne("selectThumnail", photoUrl) == null ? false : true;
	}

	// 빈 앨범으로 섬네일 변경
	@Override
	public void emptyThumnail(String albumId) {
		session.update("emptyThumnail", albumId);
	}
	
}
