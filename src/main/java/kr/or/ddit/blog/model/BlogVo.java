package kr.or.ddit.blog.model;

public class BlogVo {
	
	private String blog_code;			// 블로그코드
	private String user_id;				// 회원아이디
	private String blog_name;			// 블로그명
	private String cover_img;			// 커버이미지
	private String profile_img;			// 프로필이미지
	private String profile_contents;	// 소개글
	private String select_layout;		// 레이아웃
	private String qna_act;				// 질의응답활성화
	
	public BlogVo() {
		
	}

	public String getBlog_code() {
		return blog_code;
	}

	public void setBlog_code(String blog_code) {
		this.blog_code = blog_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBlog_name() {
		return blog_name;
	}

	public void setBlog_name(String blog_name) {
		this.blog_name = blog_name;
	}

	public String getCover_img() {
		return cover_img;
	}

	public void setCover_img(String cover_img) {
		this.cover_img = cover_img;
	}

	public String getProfile_img() {
		return profile_img;
	}

	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}

	public String getProfile_contents() {
		return profile_contents;
	}

	public void setProfile_contents(String profile_contents) {
		this.profile_contents = profile_contents;
	}

	public String getSelect_layout() {
		return select_layout;
	}

	public void setSelect_layout(String select_layout) {
		this.select_layout = select_layout;
	}

	public String getQna_act() {
		return qna_act;
	}

	public void setQna_act(String qna_act) {
		this.qna_act = qna_act;
	}

	@Override
	public String toString() {
		return "BlogVo [blog_code=" + blog_code + ", user_id=" + user_id + ", blog_name=" + blog_name + ", cover_img="
				+ cover_img + ", profile_img=" + profile_img + ", profile_contents=" + profile_contents
				+ ", select_layout=" + select_layout + ", qna_act=" + qna_act + "]";
	}
	
}
