package org.iptime.madigun697.vo;

public class PeopleCnt {

	private String peopleName;
	private int peopleCnt;
	private String photoUrl;

	public PeopleCnt() {
		// TODO Auto-generated constructor stub
	}

	public PeopleCnt(String peopleName, int peopleCnt, String photoUrl) {
		super();
		this.peopleName = peopleName;
		this.peopleCnt = peopleCnt;
		this.photoUrl = photoUrl;
	}

	public String getPeopleName() {
		return peopleName;
	}

	public void setPeopleName(String peopleName) {
		this.peopleName = peopleName;
	}

	public int getPeopleCnt() {
		return peopleCnt;
	}

	public void setPeopleCnt(int peopleCnt) {
		this.peopleCnt = peopleCnt;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	@Override
	public String toString() {
		return "PeopleCnt [peopleName=" + peopleName + ", peopleCnt="
				+ peopleCnt + ", photoUrl=" + photoUrl + "]";
	}

}
