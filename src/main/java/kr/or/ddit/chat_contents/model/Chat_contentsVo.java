package kr.or.ddit.chat_contents.model;

public class Chat_contentsVo {
	
	private String content_code;	// 내용번호
	private String chat_code;		// 채팅방코드
	private String mem_id;			// 회원아이디
	private String chat_content;	// 채팅내용
	private String read_status;		// 수신여부
	private String write_date;		// 작성시간
	
	public Chat_contentsVo() {
		
	}

	public String getContent_code() {
		return content_code;
	}

	public void setContent_code(String content_code) {
		this.content_code = content_code;
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

	public String getChat_content() {
		return chat_content;
	}

	public void setChat_content(String chat_content) {
		this.chat_content = chat_content;
	}

	public String getRead_status() {
		return read_status;
	}

	public void setRead_status(String read_status) {
		this.read_status = read_status;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	@Override
	public String toString() {
		return "Chat_contentsVo [content_code=" + content_code + ", chat_code=" + chat_code + ", mem_id=" + mem_id
				+ ", chat_content=" + chat_content + ", read_status=" + read_status + ", write_date=" + write_date
				+ "]";
	}

}
