package com.xhx.ssm.po;

import java.util.Date;

public class SearchUser {

	private String KAISHA_CD;
	
	private String SHAIN_CD;
	
	private String SHAIN_NM;
	
	private String SHAIN_KANA;
	
	private Date SHIYOU_FR;
	
	private Date SHIYOU_TO;
	
	
	
	public String getKAISHA_CD() {
		return KAISHA_CD;
	}

	public void setKAISHA_CD(String kAISHA_CD) {
		KAISHA_CD = kAISHA_CD;
	}

	public String getSHAIN_CD() {
		return SHAIN_CD;
	}

	public void setSHAIN_CD(String sHAIN_CD) {
		SHAIN_CD = sHAIN_CD;
	}

	public String getSHAIN_NM() {
		return SHAIN_NM;
	}

	public void setSHAIN_NM(String sHAIN_NM) {
		SHAIN_NM = sHAIN_NM;
	}

	public String getSHAIN_KANA() {
		return SHAIN_KANA;
	}

	public void setSHAIN_KANA(String sHAIN_KANA) {
		SHAIN_KANA = sHAIN_KANA;
	}

	public Date getSHIYOU_FR() {
		return SHIYOU_FR;
	}

	public void setSHIYOU_FR(Date sHIYOU_FR) {
		SHIYOU_FR = sHIYOU_FR;
	}

	public Date getSHIYOU_TO() {
		return SHIYOU_TO;
	}

	public void setSHIYOU_TO(Date sHIYOU_TO) {
		SHIYOU_TO = sHIYOU_TO;
	}

}
