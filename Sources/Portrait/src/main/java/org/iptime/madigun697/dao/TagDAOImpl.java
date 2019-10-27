package org.iptime.madigun697.dao;

import java.util.List;

import org.iptime.madigun697.vo.Tag;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TagDAOImpl implements TagDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	// 태그명으로 태그 아이디 검색
	@Override
	public String selectTagByName(String tagName) {
		return session.selectOne("selectByName", tagName);
	}

	// 신규 태그 추가
	@Override
	public void newTag(String tagId, String tagName) {
		Tag tag = new Tag();
		tag.setTagId(tagId);
		tag.setTagName(tagName);
		session.insert("insertTag", tag);
	}

	// 사진에 태그 추가
	@Override
	public void addTag(Tag tag) {
		session.insert("insertTagInPhoto", tag);
	}

	// 사진에 등록된 태그 목록 검색
	@Override
	public List<Tag> selectTag(String photoId, String userId) {
		Tag tag = new Tag();
		tag.setPhotoId(photoId);
		tag.setUserId(userId);
		return session.selectList("selectTags", tag);
	}

	// 사진에 태그 삭제
	@Override
	public void deleteTag(String userId, String photoId) {
		Tag tag = new Tag();
		tag.setPhotoId(photoId);
		tag.setUserId(userId);
		session.delete("deleteTagInPhoto", tag);
	}

	// 모든 태그를 검색
	@Override
	public List<Tag> selectAllTag(String userId) {
		return session.selectList("selectAllTag", userId);
	}
	
	
}
