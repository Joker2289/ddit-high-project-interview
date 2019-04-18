package kr.or.ddit.report.model;

import java.util.Date;

public class ReportVo {
	private String report_code;		// 신고코드
	private String mem_id;			// 회원아이디
	private String ref_code;		// 참조코드
	private String division;		// 구분
	private Date report_date;		// 신고날짜
	private String report_contents;	// 신고내용 
	
	public ReportVo() {
		// TODO Auto-generated constructor stub
	}

	public String getReport_code() {
		return report_code;
	}

	public void setReport_code(String report_code) {
		this.report_code = report_code;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
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

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public String getReport_contents() {
		return report_contents;
	}

	public void setReport_contents(String report_contents) {
		this.report_contents = report_contents;
	}

	@Override
	public String toString() {
		return "ReportVo [report_code=" + report_code + ", mem_id=" + mem_id + ", ref_code=" + ref_code + ", division="
				+ division + ", report_date=" + report_date + ", report_contents=" + report_contents + "]";
	}
}
