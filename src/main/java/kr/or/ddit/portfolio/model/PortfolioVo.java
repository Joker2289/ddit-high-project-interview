package kr.or.ddit.portfolio.model;

public class PortfolioVo {
	private String portfolio_code;		// 포트폴리오코드
	private String blog_code;			// 블로그코드
	private String portfolio_name;		// 포트폴리오명
	
	public PortfolioVo() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "PortfolioVo [portfolio_code=" + portfolio_code + ", blog_code=" + blog_code + ", portfolio_name="
				+ portfolio_name + "]";
	}

	public String getPortfolio_code() {
		return portfolio_code;
	}

	public void setPortfolio_code(String portfolio_code) {
		this.portfolio_code = portfolio_code;
	}

	public String getBlog_code() {
		return blog_code;
	}

	public void setBlog_code(String blog_code) {
		this.blog_code = blog_code;
	}

	public String getPortfolio_name() {
		return portfolio_name;
	}

	public void setPortfolio_name(String portfolio_name) {
		this.portfolio_name = portfolio_name;
	}
	
	
}
