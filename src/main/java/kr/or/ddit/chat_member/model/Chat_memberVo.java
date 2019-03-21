package kr.or.ddit.chat_member.model;

public class Chat_memberVo {
	
	private String mem_id;		// 회원아이디
	private String chat_code;	// 채팅방코드
	
	public Chat_memberVo() {
		
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getChat_code() {
		return chat_code;
	}

	public void setChat_code(String chat_code) {
		this.chat_code = chat_code;
	}

	@Override
	public String toString() {
		return "Chat_memberVo [mem_id=" + mem_id + ", chat_code=" + chat_code + "]";
	}

}
