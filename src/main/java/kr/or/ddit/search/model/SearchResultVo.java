package kr.or.ddit.search.model;

public class SearchResultVo {
	                                
	private String mem_id;          // 검색된 회원(회사/회원) 아이디
	private String mem_name;        // 검색된 회원 이름
	private String profile_path;    // 검색된 회원 프로필사진
	private String corporate_name;  // 검색된 회원의 경력정보
	private String industry_type;   // 검색된 회사의 사업유형
	private String search_word;		// 검색어
	
	public SearchResultVo() {
		
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
	public String getCorporate_name() {
		return corporate_name;
	}
	public void setCorporate_name(String corporate_name) {
		this.corporate_name = corporate_name;
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
				+ ", corporate_name=" + corporate_name + ", industry_type=" + industry_type + "]";
	}
}
