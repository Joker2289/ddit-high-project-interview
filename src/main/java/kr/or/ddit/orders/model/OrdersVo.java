package kr.or.ddit.orders.model;

public class OrdersVo {
	private String order_code;
	private String paytype_code;
	private String mem_id;
	private String product_code;
	private String pay_date;
	private String pay_status;
	@Override
	public String toString() {
		return "OrdersVo [order_code=" + order_code + ", paytype_code=" + paytype_code + ", mem_id=" + mem_id
				+ ", product_code=" + product_code + ", pay_date=" + pay_date + ", pay_status=" + pay_status + "]";
	}
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public String getPaytype_code() {
		return paytype_code;
	}
	public void setPaytype_code(String paytype_code) {
		this.paytype_code = paytype_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getPay_status() {
		return pay_status;
	}
	public void setPay_status(String pay_status) {
		this.pay_status = pay_status;
	}
	public OrdersVo() {
		// TODO Auto-generated constructor stub
	}


}
