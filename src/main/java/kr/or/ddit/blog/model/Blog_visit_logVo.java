package kr.or.ddit.blog.model;

import java.util.Date;

public class Blog_visit_logVo {
	//블로그 방문 기록
	
	private String visit_code; 	//방문 코드
	private String user_id; 	//블로그 주인
	private String visitor_id;	//방문자 ID
	private Date visit_date;	//방문 날짜
	
	
	private String visitor_name;	//방문자 이름
	private String image_path;		//방문자 프로필 경로
	private String visitor_info;	//방문자 정보
	
	public String getVisit_code() {
		return visit_code;
	}
	public void setVisit_code(String visit_code) {
		this.visit_code = visit_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getVisitor_id() {
		return visitor_id;
	}
	public void setVisitor_id(String visitor_id) {
		this.visitor_id = visitor_id;
	}
	public Date getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(Date visit_date) {
		this.visit_date = visit_date;
	}
	public String getVisitor_name() {
		return visitor_name;
	}
	public void setVisitor_name(String visitor_name) {
		this.visitor_name = visitor_name;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public String getVisitor_info() {
		return visitor_info;
	}
	public void setVisitor_info(String visitor_info) {
		this.visitor_info = visitor_info;
	}
	@Override
	public String toString() {
		return "Blog_visit_logVo [visit_code=" + visit_code + ", user_id=" + user_id + ", visitor_id=" + visitor_id
				+ ", visit_date=" + visit_date + ", visitor_name=" + visitor_name + ", image_path=" + image_path
				+ ", visitor_info=" + visitor_info + "]";
	}
	
	
	
}
