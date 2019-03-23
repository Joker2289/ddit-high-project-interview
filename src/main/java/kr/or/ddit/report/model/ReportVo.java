package kr.or.ddit.report.model;

public class ReportVo {
	private String report_code;		// 신고코드
	private String user_id;			// 회원아이디
	private String report_type;		// 신고유형
	private String ref_code;		// 참조코드
	private String division;		// 구분
	private String report_date;		// 신고날짜
	
	public ReportVo() {
		// TODO Auto-generated constructor stub
	}

	public String getReport_code() {
		return report_code;
	}

	public void setReport_code(String report_code) {
		this.report_code = report_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getReport_type() {
		return report_type;
	}

	public void setReport_type(String report_type) {
		this.report_type = report_type;
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

	public String getReport_date() {
		return report_date;
	}

	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}

	@Override
	public String toString() {
		return "ReportVo [report_code=" + report_code + ", user_id=" + user_id + ", report_type=" + report_type
				+ ", ref_code=" + ref_code + ", division=" + division + ", report_date=" + report_date + "]";
	}
	
}
