package kr.or.ddit.util.chart;

public class Employee_listVo {
	
	private String user_id;
	private String user_name;
	private String info1;
	private String info2;
	private String img_path;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getInfo1() {
		return info1;
	}
	public void setInfo1(String info1) {
		this.info1 = info1;
	}
	public String getInfo2() {
		return info2;
	}
	public void setInfo2(String info2) {
		this.info2 = info2;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	@Override
	public String toString() {
		return "Employee_listVo [user_id=" + user_id + ", user_name=" + user_name + ", info1=" + info1 + ", info2="
				+ info2 + ", img_path=" + img_path + "]";
	}
	
	
	
}
