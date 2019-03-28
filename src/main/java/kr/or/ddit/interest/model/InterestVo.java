package kr.or.ddit.interest.model;

public class InterestVo {
	private String inte_code;   	// 관심분야코드
	private String user_id;   		// 회원아이디
	private String change_flag;   	// 이직의사여부
	private String tell_content;    // 리크루터에게하고싶은말
	private String job_condition;   // 구직상태
	private String inte_type;    	// 희망업무분야
	private String inte_local;    	// 희망근무지역
	private String inte_emptype;    // 희망고용형태
	private String inte_size;    	// 희망회사규모
	
	public InterestVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "InterestVo [inte_code=" + inte_code + ", user_id=" + user_id + ", change_flag=" + change_flag
				+ ", tell_content=" + tell_content + ", job_condition=" + job_condition + ", inte_type=" + inte_type
				+ ", inte_local=" + inte_local + ", inte_emptype=" + inte_emptype + ", inte_size=" + inte_size + "]";
	}

	public String getInte_code() {
		return inte_code;
	}

	public void setInte_code(String inte_code) {
		this.inte_code = inte_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getChange_flag() {
		return change_flag;
	}

	public void setChange_flag(String change_flag) {
		this.change_flag = change_flag;
	}

	public String getTell_content() {
		return tell_content;
	}

	public void setTell_content(String tell_content) {
		this.tell_content = tell_content;
	}

	public String getJob_condition() {
		return job_condition;
	}

	public void setJob_condition(String job_condition) {
		this.job_condition = job_condition;
	}

	public String getInte_type() {
		return inte_type;
	}

	public void setInte_type(String inte_type) {
		this.inte_type = inte_type;
	}

	public String getInte_local() {
		return inte_local;
	}

	public void setInte_local(String inte_local) {
		this.inte_local = inte_local;
	}

	public String getInte_emptype() {
		return inte_emptype;
	}

	public void setInte_emptype(String inte_emptype) {
		this.inte_emptype = inte_emptype;
	}

	public String getInte_size() {
		return inte_size;
	}

	public void setInte_size(String inte_size) {
		this.inte_size = inte_size;
	}
	
	
	
}



