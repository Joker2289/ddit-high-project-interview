package kr.or.ddit.post.model;

public class PostVo {
	private String post_code;		// 글코드
	private String user_id;			// 작성자
	private String post_contents;	// 내용
	private String post_date;		// 작성일
	
	public PostVo() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "PostVo [post_code=" + post_code + ", user_id=" + user_id + ", post_contents=" + post_contents
				+ ", post_date=" + post_date + "]";
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPost_contents() {
		return post_contents;
	}

	public void setPost_contents(String post_contents) {
		this.post_contents = post_contents;
	}

	public String getPost_date() {
		return post_date;
	}

	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	
}
