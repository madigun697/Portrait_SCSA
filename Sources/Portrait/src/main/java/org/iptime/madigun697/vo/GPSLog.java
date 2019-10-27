package org.iptime.madigun697.vo;

public class GPSLog {

	private String lat;
	private String lng;
	private String userId;
	private String logDate;

	public GPSLog() {
		// TODO Auto-generated constructor stub
	}

	public GPSLog(String lat, String lng, String userId) {
		super();
		this.lat = lat;
		this.lng = lng;
		this.userId = userId;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getLogDate() {
		return logDate;
	}

	public void setLogDate(String logDate) {
		this.logDate = logDate;
	}

	@Override
	public String toString() {
		return "GPSLog [lat=" + lat + ", lng=" + lng + ", userId=" + userId
				+ ", logDate=" + logDate + "]";
	}

}
