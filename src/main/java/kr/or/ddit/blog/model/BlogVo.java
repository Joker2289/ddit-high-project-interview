package kr.or.ddit.blog.model;

public class BlogVo {
	
	private String user_id;				// 회원아이디
	private String blog_name;			// 블로그명
	private String cover_img;			// 커버이미지
	private String cover_color;			// 커버색
	private String profile_contents;	// 소개글
	private String qna_act;				// 질의응답활성화
	private String img_act;				// 커버이미지 사용여부
	private String name_act;			// 블로그명 사용여부
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
	public String getCover_color() {
		return cover_color;
	}
	public void setCover_color(String cover_color) {
		this.cover_color = cover_color;
	}
	public String getProfile_contents() {
		return profile_contents;
	}
	public void setProfile_contents(String profile_contents) {
		this.profile_contents = profile_contents;
	}
	public String getQna_act() {
		return qna_act;
	}
	public void setQna_act(String qna_act) {
		this.qna_act = qna_act;
	}
	public String getImg_act() {
		return img_act;
	}
	public void setImg_act(String img_act) {
		this.img_act = img_act;
	}
	public String getName_act() {
		return name_act;
	}
	public void setName_act(String name_act) {
		this.name_act = name_act;
	}
	@Override
	public String toString() {
		return "BlogVo [user_id=" + user_id + ", blog_name=" + blog_name + ", cover_img=" + cover_img + ", cover_color="
				+ cover_color + ", profile_contents=" + profile_contents + ", qna_act=" + qna_act + ", img_act="
				+ img_act + ", name_act=" + name_act + "]";
	}

}
