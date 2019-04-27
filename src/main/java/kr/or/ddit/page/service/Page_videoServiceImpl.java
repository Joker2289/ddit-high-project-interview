package kr.or.ddit.page.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.page.dao.IPage_videoDao;
import kr.or.ddit.page.model.Page_videoVo;

@Service("page_videoService")
public class Page_videoServiceImpl implements IPage_videoService{

	@Resource(name="page_videoDao")
	private IPage_videoDao videoDao;
	
	@Override
	public int insert_page_video(Page_videoVo vo) {
		return videoDao.insert_page_video(vo);
	}

	@Override
	public List<Page_videoVo> select_page_video(String page_code) {
		return videoDao.select_page_video(page_code);
	}

	@Override
	public int delete_page_video(String page_code) {
		return videoDao.delete_page_video(page_code);
	}

}
