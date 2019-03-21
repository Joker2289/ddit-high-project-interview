package kr.or.ddit.require_skills.model;

public class Require_skillsVo {
	private String skill_code;		// 기술자격코드
	private String recruit_code;	// 채용공고코드
	private String skill_name;		// 기술자격명
	
	public Require_skillsVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Require_skillsVo [skill_code=" + skill_code + ", recruit_code=" + recruit_code + ", skill_name="
				+ skill_name + "]";
	}

	public String getSkill_code() {
		return skill_code;
	}

	public void setSkill_code(String skill_code) {
		this.skill_code = skill_code;
	}

	public String getRecruit_code() {
		return recruit_code;
	}

	public void setRecruit_code(String recruit_code) {
		this.recruit_code = recruit_code;
	}

	public String getSkill_name() {
		return skill_name;
	}

	public void setSkill_name(String skill_name) {
		this.skill_name = skill_name;
	}
	
}
