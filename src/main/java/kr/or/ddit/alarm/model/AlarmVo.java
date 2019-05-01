package kr.or.ddit.alarm.model;

import java.util.Date;

public class AlarmVo {
	
	private String alarm_code;	// 알림코드
	private String mem_id;		// 회원아이디
	private String ref_code;	// 참조코드
	private String alarm_check;	// 확인여부
	private String division;	// 구분
	private Date   alarm_date;  // 날짜
	private String send_id;		// 알림발신 아이디
	private String profile_path;
	private String send_name;
	private int resultMinute;
	private String alarm_separate; //알림 구분
	private String mem_division; // 회원 구분

	public AlarmVo() {
		
	}
	
	public String getMem_division() {
		return mem_division;
	}

	public void setMem_division(String mem_division) {
		this.mem_division = mem_division;
	}
	
	public String getAlarm_separate() {
		return alarm_separate;
	}

	public void setAlarm_separate(String alarm_separate) {
		this.alarm_separate = alarm_separate;
	}

	public String getProfile_path() {
		return profile_path;
	}

	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}

	public String getSend_name() {
		return send_name;
	}

	public void setSend_name(String send_name) {
		this.send_name = send_name;
	}

	public int getResultMinute() {
		return resultMinute;
	}

	public void setResultMinute(int resultMinute) {
		this.resultMinute = resultMinute;
	}

	public String getSend_id() {
		return send_id;
	}

	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public Date getAlarm_date() {
		return alarm_date;
	}

	public void setAlarm_date(Date alarm_date) {
		this.alarm_date = alarm_date;
	}

	public String getAlarm_code() {
		return alarm_code;
	}

	public void setAlarm_code(String alarm_code) {
		this.alarm_code = alarm_code;
	}

	public String getRef_code() {
		return ref_code;
	}

	public void setRef_code(String ref_code) {
		this.ref_code = ref_code;
	}

	public String getAlarm_check() {
		return alarm_check;
	}

	public void setAlarm_check(String alarm_check) {
		this.alarm_check = alarm_check;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	@Override
	public String toString() {
		return "AlarmVo [alarm_code=" + alarm_code + ", mem_id=" + mem_id + ", ref_code=" + ref_code + ", alarm_check="
				+ alarm_check + ", division=" + division + ", alarm_date=" + alarm_date + ", send_id=" + send_id
				+ ", profile_path=" + profile_path + ", send_name=" + send_name + ", resultMinute=" + resultMinute
				+ ", alarm_separate=" + alarm_separate + ", mem_division=" + mem_division + "]";
	}
}
