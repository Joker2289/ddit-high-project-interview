package kr.or.ddit.product.model;

public class ProductVo {
	private String product_code;		// 상품코드
	private String product_name;		// 상품이름
	private String product_price;		// 상품가격
	
	public ProductVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ProductVo [product_code=" + product_code + ", product_name=" + product_name + ", product_price="
				+ product_price + "]";
	}

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_price() {
		return product_price;
	}

	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	
}
