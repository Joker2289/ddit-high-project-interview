package kr.or.ddit.chat_contents.model;

import java.util.Date;

public class Chat_contentsVo {
	
	private String content_code;	// 내용번호
	private String chat_code;		// 채팅방코드
	private String mem_id;			// 회원아이디
	private String chat_content;	// 채팅내용
	private String read_status;		// 수신여부
	private Date write_date;		// 작성시간
	private String profile_path;	// 프로필 사진
	private String chat_name;		// 채팅 방 제목
	private String memCount;		// 채팅 방 사람수
	private String name;		// 채팅보낸 유저 이름
	
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

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	public String getProfile_path() {
		return profile_path;
	}

	public void setProfile_path(String profile_path) {
		this.profile_path = profile_path;
	}

	public String getChat_name() {
		return chat_name;
	}

	public void setChat_name(String chat_name) {
		this.chat_name = chat_name;
	}

	public String getMemCount() {
		return memCount;
	}

	public void setMemCount(String memCount) {
		this.memCount = memCount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Chat_contentsVo [content_code=" + content_code + ", chat_code=" + chat_code + ", mem_id=" + mem_id
				+ ", chat_content=" + chat_content + ", read_status=" + read_status + ", write_date=" + write_date
				+ "]";
	}

}
