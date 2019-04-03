package kr.or.ddit.save_post.model;

import java.util.Date;

public class Save_postVo {
	
	private String postsave_code;
	private String save_post_code;
	private String mem_id;
	private Date save_date;
	
	public String getPostsave_code() {
		return postsave_code;
	}
	public void setPostsave_code(String postsave_code) {
		this.postsave_code = postsave_code;
	}
	public Date getSave_date() {
		return save_date;
	}
	public void setSave_date(Date save_date) {
		this.save_date = save_date;
	}
	public String getSave_post_code() {
		return save_post_code;
	}
	public void setSave_post_code(String save_post_code) {
		this.save_post_code = save_post_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	@Override
	public String toString() {
		return "Save_postVo [postsave_code=" + postsave_code + ", save_post_code=" + save_post_code + ", mem_id="
				+ mem_id + ", save_date=" + save_date + "]";
	}
	
}
