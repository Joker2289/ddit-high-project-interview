package kr.or.ddit.section.model;

public class SectionVo {
	private String section_code;		// 섹션코드
	private String portfolio_code;		// 포트폴리오코드
	private String section_name;		// 섹션명
	
	public SectionVo() {
		// TODO Auto-generated constructor stub
	}

	public String getSection_code() {
		return section_code;
	}

	public void setSection_code(String section_code) {
		this.section_code = section_code;
	}

	public String getPortfolio_code() {
		return portfolio_code;
	}

	public void setPortfolio_code(String portfolio_code) {
		this.portfolio_code = portfolio_code;
	}

	public String getSection_name() {
		return section_name;
	}

	public void setSection_name(String section_name) {
		this.section_name = section_name;
	}

	@Override
	public String toString() {
		return "SectionVo [section_code=" + section_code + ", portfolio_code=" + portfolio_code + ", section_name="
				+ section_name + "]";
	}
	
}
