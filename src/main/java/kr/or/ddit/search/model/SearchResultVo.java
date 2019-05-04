package kr.or.ddit.search.model;

public class SearchResultVo {
	                                
	private String mem_id;          // 검색된 회원(회사/회원) 아이디
	private String mem_name;        // 검색된 회원 이름
	private String profile_path;    // 검색된 회원 프로필사진
	private String introduce;  		// 검색된 회원의 학력경력 정보 -- 필요없음
	private String industry_type;   // 검색된 회사의 사업유형
	private String search_word;		// 검색어
	private String ref_keyword;
	private String addr1;
	private String career_info;
	private String school_info;
	private String ability_item;
	private String receive_accept;
	private String col_no;			// 검색 정렬번호
	
	public SearchResultVo() {
		
	}
	
	public String getCareer_info() {
		return career_info;
	}
	public void setCareer_info(String career_info) {
		this.career_info = career_info;
	}
	public String getSchool_info() {
		return school_info;
	}
	public void setSchool_info(String school_info) {
		this.school_info = school_info;
	}
	public String getAbility_item() {
		return ability_item;
	}
	public void setAbility_item(String ability_item) {
		this.ability_item = ability_item;
	}
	public String getReceive_accept() {
		return receive_accept;
	}
	public void setReceive_accept(String receive_accept) {
		this.receive_accept = receive_accept;
	}
	public String getRef_keyword() {
		return ref_keyword;
	}
	public void setRef_keyword(String ref_keyword) {
		this.ref_keyword = ref_keyword;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getCol_no() {
		return col_no;
	}
	public void setCol_no(String col_no) {
		this.col_no = col_no;
	}
	public String getSearch_word() {
		return search_word;
	}
	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getProfile_path() {
		return profile_path;
	}
	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getIndustry_type() {
		return industry_type;
	}
	public void setIndustry_type(String industry_type) {
		this.industry_type = industry_type;
	}
	@Override
	public String toString() {
		return "SearchResultVo [mem_id=" + mem_id + ", mem_name=" + mem_name + ", profile_path=" + profile_path
				+ ", introduce=" + introduce + ", industry_type=" + industry_type + ", search_word=" + search_word
				+ ", ref_keyword=" + ref_keyword + ", addr1=" + addr1 + ", career_info=" + career_info
				+ ", school_info=" + school_info + ", ability_item=" + ability_item + ", receive_accept="
				+ receive_accept + ", col_no=" + col_no + "]";
	}
}
