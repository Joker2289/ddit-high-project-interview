package kr.or.ddit.post.model;

import java.util.Date;

public class PostVo {

	private String post_code;		// 글 코드
	private String mem_id; 			// 작성자
	private String post_contents;	// 내용
	private Date post_date; 		// 작성일
	
	public PostVo() {
		// TODO Auto-generated constructor stub
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

	public String getPost_contents() {
		return post_contents;
	}

	public void setPost_contents(String post_contents) {
		this.post_contents = post_contents;
	}

	public Date getPost_date() {
		return post_date;
	}

	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}

	@Override
	public String toString() {
		return "PostVo [post_code=" + post_code + ", mem_id=" + mem_id + ", post_contents=" + post_contents
				+ ", post_date=" + post_date + "]";
	}
	
}
