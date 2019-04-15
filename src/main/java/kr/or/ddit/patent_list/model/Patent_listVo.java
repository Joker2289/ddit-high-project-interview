package kr.or.ddit.patent_list.model;

import java.util.Date;

public class Patent_listVo {
	private String patent_code;		// 특허코드
	private String user_id;			// 회원아이디
	private String patent_name;		// 특허명
	private String nation;			// 특허발급국가
	private String patent_no;		// 특허출원번호
	private String inventer;		// 발명자
	private Date patent_date;		// 취득일
	private String patent_url;		// 특허URL
	private String contents;		// 설명
	public Patent_listVo() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Patent_listVo [patent_code=" + patent_code + ", user_id=" + user_id + ", patent_name=" + patent_name
				+ ", nation=" + nation + ", patent_no=" + patent_no + ", inventer=" + inventer + ", patent_date="
				+ patent_date + ", patent_url=" + patent_url + ", contents=" + contents + "]";
	}
	public String getPatent_code() {
		return patent_code;
	}
	public void setPatent_code(String patent_code) {
		this.patent_code = patent_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPatent_name() {
		return patent_name;
	}
	public void setPatent_name(String patent_name) {
		this.patent_name = patent_name;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getPatent_no() {
		return patent_no;
	}
	public void setPatent_no(String patent_no) {
		this.patent_no = patent_no;
	}
	public String getInventer() {
		return inventer;
	}
	public void setInventer(String inventer) {
		this.inventer = inventer;
	}
	public Date getPatent_date() {
		return patent_date;
	}
	public void setPatent_date(Date patent_date) {
		this.patent_date = patent_date;
	}
	public String getPatent_url() {
		return patent_url;
	}
	public void setPatent_url(String patent_url) {
		this.patent_url = patent_url;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	

}
