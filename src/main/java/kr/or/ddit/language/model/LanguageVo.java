package kr.or.ddit.language.model;

public class LanguageVo {
	
	private String lang_code;	// 외국어능력코드
	private String user_id;		// 회원아이디
	private String lang_kind;	// 외국어능력종류
	private String grade;		// 점수

	public LanguageVo() {
		
	}

	public String getLang_code() {
		return lang_code;
	}

	public void setLang_code(String lang_code) {
		this.lang_code = lang_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getLang_kind() {
		return lang_kind;
	}

	public void setLang_kind(String lang_kind) {
		this.lang_kind = lang_kind;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "LanguageVo [lang_code=" + lang_code + ", user_id=" + user_id + ", lang_kind=" + lang_kind + ", grade="
				+ grade + "]";
	}

}
