package kr.or.ddit.hide_post.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.hide_post.dao.IHide_postDao;
import kr.or.ddit.hide_post.model.Hide_postVo;
import kr.or.ddit.post.model.PostVo;
import kr.or.ddit.util.pagination.PaginationVo;

@Service("hide_postService")
public class Hide_postServiceImpl implements IHide_postService {

	@Resource(name="hide_postDao")
	private IHide_postDao hide_postDao;
	
	@Override
	public int insert_hidepostInfo(Hide_postVo hideVo) {
		return hide_postDao.insert_hidepostInfo(hideVo);
	}

	@Override
	public int delete_hidepostInfo(String hide_code) {
		return hide_postDao.delete_hidepostInfo(hide_code);
	}

	@Override
	public List<PostVo> select_hidepostList(PaginationVo paginationVo) {
		return hide_postDao.select_hidepostList(paginationVo);
	}

	@Override
	public List<PostVo> select_nextHidepost(PaginationVo paginationVo) {
		return hide_postDao.select_nextHidepost(paginationVo);
	}

}
