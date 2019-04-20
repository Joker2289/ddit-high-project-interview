package kr.or.ddit.portfolio.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.portfolio.model.PortfolioVo;

@Repository("portfolioDao")
public class PortfolioDaoImpl implements IPortfolioDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_portfolio(PortfolioVo vo) {
		return sqlSession.insert("portfolio.insert_portfolio", vo);
	}

	@Override
	public int update_portfolio(PortfolioVo vo) {
		return sqlSession.update("portfolio.update_portfolio", vo);
	}

	@Override
	public int delete_portfolio(PortfolioVo vo) {
		return sqlSession.delete("portfolio.delete_portfolio", vo);
	}

	@Override
	public List<PortfolioVo> select_portfolioList(String user_id) {
		return sqlSession.selectList("portfolio.select_portfolioList", user_id);
	}
	
}
