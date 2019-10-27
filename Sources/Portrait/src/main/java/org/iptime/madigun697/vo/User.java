package org.iptime.madigun697.vo;

public class User {

	private String userId;
	private String userName;
	private String birthday;
	private String pAlbumId;
	private boolean snsAuth;

	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String userId, String userName, String birthday,
			String pAlbumId, boolean snsAuth) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.birthday = birthday;
		this.pAlbumId = pAlbumId;
		this.snsAuth = snsAuth;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getpAlbumId() {
		return pAlbumId;
	}

	public void setpAlbumId(String pAlbumId) {
		this.pAlbumId = pAlbumId;
	}

	public boolean isSnsAuth() {
		return snsAuth;
	}

	public void setSnsAuth(boolean snsAuth) {
		this.snsAuth = snsAuth;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", birthday=" + birthday + ", pAlbumId=" + pAlbumId
				+ ", snsAuth=" + snsAuth + "]";
	}

}
