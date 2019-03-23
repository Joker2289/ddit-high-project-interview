package kr.or.ddit.thesis_list.model;

public class Thesis_listVo {
	private String thesis_code;			// 논문코드
	private String user_id;				// 회원아이디
	private String thesis_name;			// 논문저서명
	private String publication_date;	// 발표출판일
	private String publisher;			// 발행인출판사
	private String thesis_url;			// 논문저서URL
	private String contents;			// 설명
	private String writer;				// 저자
	
	public Thesis_listVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Thesis_listVo [thesis_code=" + thesis_code + ", user_id=" + user_id + ", thesis_name=" + thesis_name
				+ ", publication_date=" + publication_date + ", publisher=" + publisher + ", thesis_url=" + thesis_url
				+ ", contents=" + contents + ", writer=" + writer + "]";
	}

	public String getThesis_code() {
		return thesis_code;
	}

	public void setThesis_code(String thesis_code) {
		this.thesis_code = thesis_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getThesis_name() {
		return thesis_name;
	}

	public void setThesis_name(String thesis_name) {
		this.thesis_name = thesis_name;
	}

	public String getPublication_date() {
		return publication_date;
	}

	public void setPublication_date(String publication_date) {
		this.publication_date = publication_date;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getThesis_url() {
		return thesis_url;
	}

	public void setThesis_url(String thesis_url) {
		this.thesis_url = thesis_url;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
}
