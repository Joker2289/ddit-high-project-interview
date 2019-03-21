package kr.or.ddit.persnal_connection.model;

public class Persnal_connectionVo {
	private String user_id;			// 신청회원아이디
	private String receive_id;		// 수신회원아이디
	private String receive_accept;	// 수락여부
	
	public Persnal_connectionVo() {
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

	@Override
	public String toString() {
		return "Persnal_connectionVo [user_id=" + user_id + ", receive_id=" + receive_id + ", receive_accept="
				+ receive_accept + "]";
	}
	
	
}
