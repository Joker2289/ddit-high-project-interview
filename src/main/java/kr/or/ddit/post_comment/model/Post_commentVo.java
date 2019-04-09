package kr.or.ddit.post_comment.model;

import java.util.Date;

public class Post_commentVo {
	private String comment_code;		// 댓글코드
	private String mem_id;				// 작성자
	private String comment_contents;	// 내용
	private String ref_code;			// 참조코드
	private String division;			// 구분
	private Date comment_date;			// 작성일
	private String profile_path;
	private String logo_path;
	
	public Post_commentVo() {
		// TODO Auto-generated constructor stub
	}
	public String getProfile_path() {
		return profile_path;
	}
	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}
	public String getLogo_path() {
		return logo_path;
	}
	public void setLogo_path(String logo_path) {
		this.logo_path = logo_path;
	}
	public String getComment_code() {
		return comment_code;
	}
	public void setComment_code(String comment_code) {
		this.comment_code = comment_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getComment_contents() {
		return comment_contents;
	}
	public void setComment_contents(String comment_contents) {
		this.comment_contents = comment_contents;
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
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	@Override
	public String toString() {
		return "Post_commentVo [comment_code=" + comment_code + ", mem_id=" + mem_id + ", comment_contents="
				+ comment_contents + ", ref_code=" + ref_code + ", division=" + division + ", comment_date="
				+ comment_date + ", profile_path=" + profile_path + ", logo_path=" + logo_path + "]";
	}
}
