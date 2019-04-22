package kr.or.ddit.portfolio.dao;

import java.util.List;

import kr.or.ddit.portfolio.model.PortfolioVo;

public interface IPortfolioDao {
	
	/**
	 * 
	 * Method : insert_portfolio
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 포트폴리오 추가
	 */
	int insert_portfolio(PortfolioVo vo);
	
	/**
	 * 
	 * Method : update_portfolio
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 포트폴리오 수정
	 */
	int update_portfolio(PortfolioVo vo);
	
	/**
	 * 
	 * Method : delete_portfolio
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 포트폴리오 삭제
	 */
	int delete_portfolio(String portfolio_code);
	
	/**
	 * 
	 * Method : select_portfolioList
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 회원 포트폴리오 리스트 조회
	 */
	List<PortfolioVo> select_portfolioList(String user_id);

}
