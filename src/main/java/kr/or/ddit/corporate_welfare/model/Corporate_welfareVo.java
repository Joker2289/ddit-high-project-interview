package kr.or.ddit.corporate_welfare.model;

public class Corporate_welfareVo {
	
	private String welfare_code;		// 복지정보코드
	private String user_id;				// 회원아이디
	private String corp_id;				// 회사아이디
	private String medical_support;		// 건강검진
	private String houseloan;			// 주택지원대출
	private String domitory_support;	// 사택/기숙사
	private String oliexp_support;		// 유류비
	private String extrapay;			// 수당
	private String schoolexp_support;	// 학자금
	private String foodexp_support;		// 식비
	private String improve_support;		// 자기계발비
	private String leisureexp_support;	// 취미여가비
	private String info_contents;		// 상세내용
	
	public Corporate_welfareVo() {
		
	}

	public String getWelfare_code() {
		return welfare_code;
	}

	public void setWelfare_code(String welfare_code) {
		this.welfare_code = welfare_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCorp_id() {
		return corp_id;
	}

	public void setCorp_id(String corp_id) {
		this.corp_id = corp_id;
	}

	public String getMedical_support() {
		return medical_support;
	}

	public void setMedical_support(String medical_support) {
		this.medical_support = medical_support;
	}

	public String getHouseloan() {
		return houseloan;
	}

	public void setHouseloan(String houseloan) {
		this.houseloan = houseloan;
	}

	public String getDomitory_support() {
		return domitory_support;
	}

	public void setDomitory_support(String domitory_support) {
		this.domitory_support = domitory_support;
	}

	public String getOliexp_support() {
		return oliexp_support;
	}

	public void setOliexp_support(String oliexp_support) {
		this.oliexp_support = oliexp_support;
	}

	public String getExtrapay() {
		return extrapay;
	}

	public void setExtrapay(String extrapay) {
		this.extrapay = extrapay;
	}

	public String getSchoolexp_support() {
		return schoolexp_support;
	}

	public void setSchoolexp_support(String schoolexp_support) {
		this.schoolexp_support = schoolexp_support;
	}

	public String getFoodexp_support() {
		return foodexp_support;
	}

	public void setFoodexp_support(String foodexp_support) {
		this.foodexp_support = foodexp_support;
	}

	public String getImprove_support() {
		return improve_support;
	}

	public void setImprove_support(String improve_support) {
		this.improve_support = improve_support;
	}

	public String getLeisureexp_support() {
		return leisureexp_support;
	}

	public void setLeisureexp_support(String leisureexp_support) {
		this.leisureexp_support = leisureexp_support;
	}

	public String getInfo_contents() {
		return info_contents;
	}

	public void setInfo_contents(String info_contents) {
		this.info_contents = info_contents;
	}

	@Override
	public String toString() {
		return "Corporate_welfareVo [welfare_code=" + welfare_code + ", user_id=" + user_id + ", corp_id=" + corp_id
				+ ", medical_support=" + medical_support + ", houseloan=" + houseloan + ", domitory_support="
				+ domitory_support + ", oliexp_support=" + oliexp_support + ", extrapay=" + extrapay
				+ ", schoolexp_support=" + schoolexp_support + ", foodexp_support=" + foodexp_support
				+ ", improve_support=" + improve_support + ", leisureexp_support=" + leisureexp_support
				+ ", info_contents=" + info_contents + "]";
	}
	
}
