package kr.or.ddit.page.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.page.dao.IPage_linkDao;
import kr.or.ddit.page.model.Page_linkVo;

@Service("page_linkService")
public class Page_linkServiceImpl implements IPage_linkService{

	@Resource(name="page_linkDao")
	private IPage_linkDao page_linkDao;

	@Override
	public int insert_page_link(Page_linkVo vo) {
		return page_linkDao.insert_page_link(vo);
	}

	@Override
	public List<Page_linkVo> select_page_link(String page_code) {
		return page_linkDao.select_page_link(page_code);
	}

	@Override
	public int delete_page_link(String page_code) {
		return page_linkDao.delete_page_link(page_code);
	}
	
	
}
