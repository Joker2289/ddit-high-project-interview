package kr.or.ddit.qna.model;

public class QnaVo {
	private String qna_code;		// 글코드
	private String parent_code;		// 부모글코드
	private String user_id;			// 회원아이디
	private String mem_id;			// 작성자아이디
	private String qna_title;		// 제목
	private String qna_contents;	// 내용
	private String view_count;		// 조회수
	private String write_date;		// 작성일
	
	public QnaVo() {
		// TODO Auto-generated constructor stub
	}

	public String getQna_code() {
		return qna_code;
	}

	public void setQna_code(String qna_code) {
		this.qna_code = qna_code;
	}

	public String getParent_code() {
		return parent_code;
	}

	public void setParent_code(String parent_code) {
		this.parent_code = parent_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_contents() {
		return qna_contents;
	}

	public void setQna_contents(String qna_contents) {
		this.qna_contents = qna_contents;
	}

	public String getView_count() {
		return view_count;
	}

	public void setView_count(String view_count) {
		this.view_count = view_count;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	@Override
	public String toString() {
		return "QnaVo [qna_code=" + qna_code + ", parent_code=" + parent_code + ", user_id=" + user_id + ", mem_id="
				+ mem_id + ", qna_title=" + qna_title + ", qna_contents=" + qna_contents + ", view_count=" + view_count
				+ ", write_date=" + write_date + "]";
	}

}
