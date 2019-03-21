package kr.or.ddit.member.model;

public class MemberVo {
	
	private String mem_id;			// 회원아이디
	private String mem_division;	// 회원구분
	private String pass;			// 비밀번호
	private String report_count;	// 신고누적횟수
	private String mem_status;		// 회원상태

	public MemberVo() {
		
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_division() {
		return mem_division;
	}

	public void setMem_division(String mem_division) {
		this.mem_division = mem_division;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getReport_count() {
		return report_count;
	}

	public void setReport_count(String report_count) {
		this.report_count = report_count;
	}

	public String getMem_status() {
		return mem_status;
	}

	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}

	@Override
	public String toString() {
		return "LanguageVo [mem_id=" + mem_id + ", mem_division=" + mem_division + ", pass=" + pass + ", report_count="
				+ report_count + ", mem_status=" + mem_status + "]";
	}
}
