package kr.or.ddit.hide_post.model;

import java.util.Date;

public class Hide_postVo {
	private String hide_code;		// 숨긴 글 코드
	private String post_code;		// 글 코드
	private String mem_id;			// 회원 아이디
	private Date hide_date;			// 등록일
	private int resultMinute;		// 등록 경과시간
	
	public int getResultMinute() {
		return resultMinute;
	}
	public void setResultMinute(int resultMinute) {
		this.resultMinute = resultMinute;
	}
	public String getHide_code() {
		return hide_code;
	}
	public void setHide_code(String hide_code) {
		this.hide_code = hide_code;
	}
	public String getPost_code() {
		return post_code;
	}
	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getHide_date() {
		return hide_date;
	}
	public void setHide_date(Date hide_date) {
		this.hide_date = hide_date;
	}
	@Override
	public String toString() {
		return "Hide_postVo [hide_code=" + hide_code + ", post_code=" + post_code + ", mem_id=" + mem_id
				+ ", hide_date=" + hide_date + "]";
	}
}
