package kr.or.ddit.alarm.model;

import java.util.Date;

public class AlarmVo {
	
	private String alarm_code;	// 알림코드
	private String ref_code;	// 참조코드
	private String alarm_check;	// 확인여부
	private String division;	// 구분
	private Date   alarm_date;  // 날짜
	
	public AlarmVo() {
		
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
		return "AlarmVo [alarm_code=" + alarm_code + ", ref_code=" + ref_code + ", alarm_check=" + alarm_check
				+ ", division=" + division + ", alarm_date=" + alarm_date + "]";
	}

}
