package kr.or.ddit.search_log.model;

public class Search_logVo {
	private String search_code;		// 검색코드
	private String user_id;			// 회원아이디
	private String search_word;		// 검색어
	private String search_local;	// 검색지역
	
	public Search_logVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Search_logVo [search_code=" + search_code + ", user_id=" + user_id + ", search_word=" + search_word
				+ ", search_local=" + search_local + "]";
	}

	public String getSearch_code() {
		return search_code;
	}

	public void setSearch_code(String search_code) {
		this.search_code = search_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSearch_word() {
		return search_word;
	}

	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}

	public String getSearch_local() {
		return search_local;
	}

	public void setSearch_local(String search_local) {
		this.search_local = search_local;
	}
	
}
