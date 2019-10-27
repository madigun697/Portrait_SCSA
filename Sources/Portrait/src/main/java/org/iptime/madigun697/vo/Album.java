package org.iptime.madigun697.vo;

public class Album {

	private String albumId;
	private String userId;
	private String albumTitle;
	private String albumThumnailLink;
	private String type;
	
	public Album() {
		// TODO Auto-generated constructor stub
	}

	public String getAlbumId() {
		return albumId;
	}

	public void setAlbumId(String albumId) {
		this.albumId = albumId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAlbumTitle() {
		return albumTitle;
	}

	public void setAlbumTitle(String albumTitle) {
		this.albumTitle = albumTitle;
	}

	public String getAlbumThumnailLink() {
		return albumThumnailLink;
	}

	public void setAlbumThumnailLink(String albumThumnailLink) {
		this.albumThumnailLink = albumThumnailLink;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Album [albumId=" + albumId + ", userId=" + userId
				+ ", albumTitle=" + albumTitle + ", albumThumnailLink="
				+ albumThumnailLink + ", type=" + type + "]";
	}

}
