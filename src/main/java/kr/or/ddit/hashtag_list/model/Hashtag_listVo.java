package kr.or.ddit.hashtag_list.model;

public class Hashtag_listVo {
	
	private String taglist_code; 	// 해시태그 목록 코드
	private String hashtag_name;	// 해시태그명
	private String ref_code;		// 참조코드
	private String division;		// 구분
	private String reg_date; 		// 등록일자
	
	public Hashtag_listVo() {
		
	}

	public String getTaglist_code() {
		return taglist_code;
	}


	public void setTaglist_code(String taglist_code) {
		this.taglist_code = taglist_code;
	}


	public String getHashtag_name() {
		return hashtag_name;
	}

	public void setHashtag_name(String hashtag_name) {
		this.hashtag_name = hashtag_name;
	}

	public String getRef_code() {
		return ref_code;
	}

	public void setRef_code(String ref_code) {
		this.ref_code = ref_code;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "Hashtag_listVo [taglist_code=" + taglist_code + ", hashtag_name=" + hashtag_name + ", ref_code="
				+ ref_code + ", division=" + division + ", reg_date=" + reg_date + "]";
	}

}
