package kr.or.ddit.personal_connection.model;

import java.util.Date;

public class Personal_connectionVo {
	private String user_id;			// 신청회원아이디
	private String receive_id;		// 수신회원아이디
	private String receive_accept;	// 수락여부
	private Date connect_date;		// 수락날짜
	
	
	public Personal_connectionVo() {
		// TODO Auto-generated constructor stub
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getReceive_id() {
		return receive_id;
	}

	public void setReceive_id(String receive_id) {
		this.receive_id = receive_id;
	}

	public String getReceive_accept() {
		return receive_accept;
	}

	public void setReceive_accept(String receive_accept) {
		this.receive_accept = receive_accept;
	}
	

	public Date getConnect_date() {
		return connect_date;
	}

	public void setConnect_date(Date connect_date) {
		this.connect_date = connect_date;
	}

	@Override
	public String toString() {
		return "Persnal_connectionVo [user_id=" + user_id + ", receive_id=" + receive_id + ", receive_accept="
				+ receive_accept + "]";
	}
	
	
}
