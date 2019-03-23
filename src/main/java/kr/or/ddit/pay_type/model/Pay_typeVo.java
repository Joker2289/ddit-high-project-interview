package kr.or.ddit.pay_type.model;

public class Pay_typeVo {
	private String paytype_code;		// 결제수단코드
	private String paytype_name;		// 결제수단명
	public Pay_typeVo() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Pay_typeVo [paytype_code=" + paytype_code + ", paytype_name=" + paytype_name + "]";
	}
	public String getPaytype_code() {
		return paytype_code;
	}
	public void setPaytype_code(String paytype_code) {
		this.paytype_code = paytype_code;
	}
	public String getPaytype_name() {
		return paytype_name;
	}
	public void setPaytype_name(String paytype_name) {
		this.paytype_name = paytype_name;
	}
	
}
