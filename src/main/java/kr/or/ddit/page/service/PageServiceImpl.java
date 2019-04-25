package kr.or.ddit.page.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.page.dao.IPageDao;
import kr.or.ddit.page.model.PageVo;

@Service("pageService")
public class PageServiceImpl implements IPageService{

	@Resource(name="pageDao")
	private IPageDao pageDao;
	
	@Override
	public int insert_page(PageVo vo) {
		return pageDao.insert_page(vo);
	}

}
