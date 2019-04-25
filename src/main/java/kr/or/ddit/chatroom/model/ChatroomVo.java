package kr.or.ddit.chatroom.model;

public class ChatroomVo {
	
	private String chat_code;	// 채팅방코드
	private String mem_id;		// 회원아이디
	private String chat_name;	// 채팅방이름
	private String currval;		// 현재 시퀀스값
	
	public ChatroomVo() {
		
	}

	public String getChat_code() {
		return chat_code;
	}

	public void setChat_code(String chat_code) {
		this.chat_code = chat_code;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getChat_name() {
		return chat_name;
	}

	public void setChat_name(String chat_name) {
		this.chat_name = chat_name;
	}
	
	public String getCurrval() {
		return currval;
	}

	public void setCurrval(String currval) {
		this.currval = currval;
	}

	@Override
	public String toString() {
		return "ChatroomVo [chat_code=" + chat_code + ", mem_id=" + mem_id + ", chat_name=" + chat_name + "]";
	}
}
