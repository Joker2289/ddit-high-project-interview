package kr.or.ddit.item.model;

public class ItemVo {
	private String item_code;		// 항목코드
	private String item_div;		// 항목구분
	private String item_content;	// 항목내용
	
	public ItemVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ItemVo [item_code=" + item_code + ", item_div=" + item_div + ", item_content=" + item_content + "]";
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public String getItem_div() {
		return item_div;
	}

	public void setItem_div(String item_div) {
		this.item_div = item_div;
	}

	public String getItem_content() {
		return item_content;
	}

	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	
	
	
}
