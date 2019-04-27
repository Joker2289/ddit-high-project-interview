package kr.or.ddit.page.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.page.dao.IPage_sourceDao;
import kr.or.ddit.page.model.Page_sourceVo;

@Service("page_sourceService")
public class Page_sourceServiceImpl implements IPage_sourceService{

	@Resource(name="page_sourceDao")
	private IPage_sourceDao page_sourceDao;
	
	@Override
	public int insert_page_source(Page_sourceVo vo) {
		return page_sourceDao.insert_page_source(vo);
	}

	@Override
	public List<Page_sourceVo> select_page_source(String page_code) {
		return page_sourceDao.select_page_source(page_code);
	}

	

}
