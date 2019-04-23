package kr.or.ddit.portfolio.model;

public class PortfolioVo {
	private String portfolio_code;		// 포트폴리오코드
	private String user_id;			    // 회원 아이디
	private String portfolio_name;		// 포트폴리오명
	private String index_color;			// 인덱스 컬러
	
	public String getPortfolio_code() {
		return portfolio_code;
	}
	public void setPortfolio_code(String portfolio_code) {
		this.portfolio_code = portfolio_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPortfolio_name() {
		return portfolio_name;
	}
	public void setPortfolio_name(String portfolio_name) {
		this.portfolio_name = portfolio_name;
	}
	public String getIndex_color() {
		return index_color;
	}
	public void setIndex_color(String index_color) {
		this.index_color = index_color;
	}
	@Override
	public String toString() {
		return "PortfolioVo [portfolio_code=" + portfolio_code + ", user_id=" + user_id + ", portfolio_name="
				+ portfolio_name + ", index_color=" + index_color + "]";
	}

}
