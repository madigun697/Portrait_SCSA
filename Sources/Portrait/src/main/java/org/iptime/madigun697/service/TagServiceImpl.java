package org.iptime.madigun697.service;

import java.util.List;

import org.iptime.madigun697.dao.TagDAO;
import org.iptime.madigun697.vo.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TagServiceImpl implements TagService {
	
	@Autowired
	private TagDAO tagDao;

	// 신규 태그 추가
	@Override
	public Tag addTag(String tagName, String userId, String photoId) {
		tagName = tagName.trim();
		// 태그 명으로 기존 태그 아이디 확인
		String tagId = tagDao.selectTagByName(tagName);
		
		// 새로운 태그의 경우 태그 테이블 추가
		if (tagId == null) {
			int rand = (int) (Math.random()*100000000);
			tagId = userId + "_tag_" + rand;
			tagDao.newTag(tagId, tagName);
		}
		Tag tag = new Tag(tagId, tagName, photoId, userId);
		tagDao.addTag(tag);
		return tag;
	}

	// 사진 내의 태그 목록 추출
	@Override
	public List<Tag> getTags(String photoId, String userId) {
		return tagDao.selectTag(photoId, userId);
	}

	// 사진 내의 태그 제거
	@Override
	public void removeTag(String userId, String photoId) {
		tagDao.deleteTag(userId, photoId);
	}

	// 전체 태그 목록 추출
	@Override
	public List<Tag> getTagList(String userId) {
		return tagDao.selectAllTag(userId);
	}

}
