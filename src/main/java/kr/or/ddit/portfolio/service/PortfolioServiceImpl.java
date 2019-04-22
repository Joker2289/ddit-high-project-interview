package kr.or.ddit.portfolio.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.portfolio.dao.IPortfolioDao;
import kr.or.ddit.portfolio.model.PortfolioVo;

@Service("portfolioService")
public class PortfolioServiceImpl implements IPortfolioService{
	
	@Resource(name="portfolioDao")
	private IPortfolioDao pfDao;
	
	@Override
	public int insert_portfolio(PortfolioVo vo) {
		return pfDao.insert_portfolio(vo);
	}

	@Override
	public int update_portfolio(PortfolioVo vo) {
		return pfDao.update_portfolio(vo);
	}

	@Override
	public int delete_portfolio(String portfolio_code) {
		return pfDao.delete_portfolio(portfolio_code);
	}

	@Override
	public List<PortfolioVo> select_portfolioList(String user_id) {
		return pfDao.select_portfolioList(user_id);
	}

}
