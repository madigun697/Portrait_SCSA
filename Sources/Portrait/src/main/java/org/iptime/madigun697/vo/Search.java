package org.iptime.madigun697.vo;

import java.util.List;

public class Search {

	String userId;
	List<String> tagKeywords;
	List<String> peopleKeywords;
	List<String> geoPhotoList;
	String fromDate;
	String toDate;

	public Search() {
		// TODO Auto-generated constructor stub
	}

	public Search(String userId, List<String> tagKeywords,
			List<String> peopleKeywords, List<String> geoPhotoList,
			String fromDate, String toDate) {
		super();
		this.userId = userId;
		this.tagKeywords = tagKeywords;
		this.peopleKeywords = peopleKeywords;
		this.geoPhotoList = geoPhotoList;
		this.fromDate = fromDate;
		this.toDate = toDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<String> getTagKeywords() {
		return tagKeywords;
	}

	public void setTagKeywords(List<String> tagKeywords) {
		this.tagKeywords = tagKeywords;
	}

	public List<String> getPeopleKeywords() {
		return peopleKeywords;
	}

	public void setPeopleKeywords(List<String> peopleKeywords) {
		this.peopleKeywords = peopleKeywords;
	}

	public List<String> getGeoPhotoList() {
		return geoPhotoList;
	}

	public void setGeoPhotoList(List<String> geoPhotoList) {
		this.geoPhotoList = geoPhotoList;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	@Override
	public String toString() {
		return "Search [userId=" + userId + ", tagKeywords=" + tagKeywords
				+ ", peopleKeywords=" + peopleKeywords + ", geoPhotoList="
				+ geoPhotoList + ", fromDate=" + fromDate + ", toDate="
				+ toDate + "]";
	}

}
