package kr.or.ddit.page.service;

import java.util.List;

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

	@Override
	public List<PageVo> select_pageList(String section_code) {
		return pageDao.select_pageList(section_code);
	}

	@Override
	public PageVo select_pageInfo(String page_code) {
		return pageDao.select_pageInfo(page_code);
	}

	@Override
	public int update_page(PageVo vo) {
		return pageDao.update_page(vo);
	}

	@Override
	public int delete_page(String page_code) {
		return pageDao.delete_page(page_code);
	}

	@Override
	public List<PageVo> select_pageAllList(String user_id) {
		return pageDao.select_pageAllList(user_id);
	}

	@Override
	public int select_pageCnt(String user_id) {
		return pageDao.select_pageCnt(user_id);
	}

}
