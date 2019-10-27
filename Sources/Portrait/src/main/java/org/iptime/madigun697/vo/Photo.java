package org.iptime.madigun697.vo;

import java.util.List;

public class Photo {

	private String photoId;
	private String albumId;
	private String photoTitle;
	private String photoUrl;
	private String fstop;
	private String make;
	private String model;
	private String exposure;
	private String iso;
	private String time;
	private String description;
	private String geoTag;
	private String eventId;
	private String userId;
	private List<Album> album;
	private List<Tag> tags;
	private String tagText;
	private List<People> people;
	private String peopleText;

	public Photo() {
		// TODO Auto-generated constructor stub
	}

	public String getPhotoId() {
		return photoId;
	}

	public void setPhotoId(String photoId) {
		this.photoId = photoId;
	}

	public String getAlbumId() {
		return albumId;
	}

	public void setAlbumId(String albumId) {
		this.albumId = albumId;
	}

	public String getPhotoTitle() {
		return photoTitle;
	}

	public void setPhotoTitle(String photoTitle) {
		this.photoTitle = photoTitle;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public String getFstop() {
		return fstop;
	}

	public void setFstop(String fstop) {
		this.fstop = fstop;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getExposure() {
		return exposure;
	}

	public void setExposure(String exposure) {
		this.exposure = exposure;
	}

	public String getIso() {
		return iso;
	}

	public void setIso(String iso) {
		this.iso = iso;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getGeoTag() {
		return geoTag;
	}

	public void setGeoTag(String geoTag) {
		this.geoTag = geoTag;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public List<Album> getAlbum() {
		return album;
	}

	public void setAlbum(List<Album> album) {
		this.album = album;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public String getTagText() {
		return tagText;
	}

	public void setTagText(String tagText) {
		this.tagText = tagText;
	}

	public List<People> getPeople() {
		return people;
	}

	public void setPeople(List<People> people) {
		this.people = people;
	}

	public String getPeopleText() {
		return peopleText;
	}

	public void setPeopleText(String peopleText) {
		this.peopleText = peopleText;
	}

	@Override
	public String toString() {
		return "Photo [photoId=" + photoId + ", albumId=" + albumId
				+ ", photoTitle=" + photoTitle + ", photoUrl=" + photoUrl
				+ ", fstop=" + fstop + ", make=" + make + ", model=" + model
				+ ", exposure=" + exposure + ", iso=" + iso + ", time=" + time
				+ ", description=" + description + ", geoTag=" + geoTag
				+ ", eventId=" + eventId + ", userId=" + userId + ", album="
				+ album + ", tags=" + tags + ", tagText=" + tagText
				+ ", people=" + people + ", peopleText=" + peopleText + "]";
	}
	
	
}
