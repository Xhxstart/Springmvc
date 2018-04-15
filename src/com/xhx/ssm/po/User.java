package com.xhx.ssm.po;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Future;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.*;;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Pattern(regexp="^[0-9A-Za-z]*$", message="{code.fmt.error}",groups = {First.class , Second.class })
	@NotBlank(message="{password.null.error}",groups = { First.class ,Second.class})
	private String KAISHA_CD;
	
	@Pattern(regexp="^[0-9A-Za-z]*$", message="{code.fmt.error}",groups = { Second.class })
	private String SHAIN_CD;
	
	@NotBlank(message="{username.null.error}",groups = { First.class ,Second.class})
	private String SHAIN_NM;

	@Pattern(regexp="^[^ -~｡-ﾟ]*$", message="{name.fmt.error}",groups = { Second.class })
	private String SHAIN_KANA;	
	
	private String SHOKUI_KBN;
	
	@Email(message="{email.null.error}",groups = { Second.class })
	private String MAIL;
	
	@Past(message="{date.fmtFr.error}",groups = { Second.class })
	private Date SHIYOU_STR_FR;
	
	private Date SHIYOU_STR_TO;
	
	@Future(message="{date.fmtTo.error}",groups = { Second.class })
	private Date SHIYOU_END_FR;	

	private Date SHIYOU_END_TO;
	
	private String USR_UID;
	
	private String MUKOU_FLG;

	private SearchUser searchUser;
	
	private Integer GET_ROW_FR;
	
	private Integer GET_ROW_TO;
	
	private Integer KENSU;
	
	private Integer CURRENTPAGE;
	
	private Integer PAGECOUNT;
	
	private List<String> num;
	
	public interface First {  
	}  
	  
	public interface Second {  
	} 
	public Date getSHIYOU_STR_FR() {
		return SHIYOU_STR_FR;
	}

	public void setSHIYOU_STR_FR(Date sHIYOU_STR_FR) {
		SHIYOU_STR_FR = sHIYOU_STR_FR;
	}

	public Date getSHIYOU_STR_TO() {
		return SHIYOU_STR_TO;
	}

	public void setSHIYOU_STR_TO(Date sHIYOU_STR_TO) {
		SHIYOU_STR_TO = sHIYOU_STR_TO;
	}

	public Date getSHIYOU_END_FR() {
		return SHIYOU_END_FR;
	}

	public void setSHIYOU_END_FR(Date sHIYOU_END_FR) {
		SHIYOU_END_FR = sHIYOU_END_FR;
	}

	public Date getSHIYOU_END_TO() {
		return SHIYOU_END_TO;
	}

	public void setSHIYOU_END_TO(Date sHIYOU_END_TO) {
		SHIYOU_END_TO = sHIYOU_END_TO;
	}
	public Integer getGET_ROW_FR() {
		return GET_ROW_FR;
	}

	public void setGET_ROW_FR(Integer gET_ROW_FR) {
		GET_ROW_FR = gET_ROW_FR;
	}

	public Integer getGET_ROW_TO() {
		return GET_ROW_TO;
	}

	public void setGET_ROW_TO(Integer gET_ROW_TO) {
		GET_ROW_TO = gET_ROW_TO;
	}

	public Integer getKENSU() {
		return KENSU;
	}

	public void setKENSU(Integer kENSU) {
		KENSU = kENSU;
	}

	public Integer getCURRENTPAGE() {
		return CURRENTPAGE;
	}

	public void setCURRENTPAGE(Integer cURRENTPAGE) {
		CURRENTPAGE = cURRENTPAGE;
	}

	public Integer getPAGECOUNT() {
		return PAGECOUNT;
	}

	public void setPAGECOUNT(Integer pAGECOUNT) {
		PAGECOUNT = pAGECOUNT;
	}

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

	public String getSHOKUI_KBN() {
		return SHOKUI_KBN;
	}

	public void setSHOKUI_KBN(String sHOKUI_KBN) {
		SHOKUI_KBN = sHOKUI_KBN;
	}

	public String getMAIL() {
		return MAIL;
	}

	public void setMAIL(String mAIL) {
		MAIL = mAIL;
	}

	public String getUSR_UID() {
		return USR_UID;
	}

	public void setUSR_UID(String uSR_UID) {
		USR_UID = uSR_UID;
	}

	public String getMUKOU_FLG() {
		return MUKOU_FLG;
	}

	public void setMUKOU_FLG(String mUKOU_FLG) {
		MUKOU_FLG = mUKOU_FLG;
	}

	public SearchUser getSearchUser() {
		return searchUser;
	}

	public void setSearchUser(SearchUser searchUser) {
		this.searchUser = searchUser;
	}

	public List<String> getNum() {
		return num;
	}

	public void setNum(List<String> num) {
		this.num = num;
	}

}
