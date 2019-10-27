package org.iptime.madigun697.service;

import java.util.List;

import org.iptime.madigun697.vo.Tag;

public interface TagService {

	Tag addTag(String tagName, String userId, String photoId);

	List<Tag> getTags(String photoId, String userId);

	void removeTag(String userId, String photoId);

	List<Tag> getTagList(String userId);

}
