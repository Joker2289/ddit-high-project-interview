package kr.or.ddit.education_info.model;

public class Education_infoVo {
	
	private String education_code;	// 학력코드
	private String user_id;			// 회원아이디
	private String school_name;		// 학교명
	private String degree_name;		// 학위
	private String major;			// 전공
	private String admission;		// 입학년도
	private String graduation;		// 졸업(예정)년도
	private String grade;			// 학점
	private String contents;		// 설명
	
	public Education_infoVo() {
		
	}

	public String getEducation_code() {
		return education_code;
	}

	public void setEducation_code(String education_code) {
		this.education_code = education_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getSchool_name() {
		return school_name;
	}

	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}

	public String getDegree_name() {
		return degree_name;
	}

	public void setDegree_name(String degree_name) {
		this.degree_name = degree_name;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getAdmission() {
		return admission;
	}

	public void setAdmission(String admission) {
		this.admission = admission;
	}

	public String getGraduation() {
		return graduation;
	}

	public void setGraduation(String graduation) {
		this.graduation = graduation;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	@Override
	public String toString() {
		return "Education_infoVo [education_code=" + education_code + ", user_id=" + user_id + ", school_name="
				+ school_name + ", degree_name=" + degree_name + ", major=" + major + ", admission=" + admission
				+ ", graduation=" + graduation + ", grade=" + grade + ", contents=" + contents + "]";
	}
	
}
