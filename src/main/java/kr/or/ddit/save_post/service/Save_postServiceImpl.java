package kr.or.ddit.save_post.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.save_post.dao.ISave_postDao;
import kr.or.ddit.save_post.model.Save_postVo;

@Service("save_postService")
public class Save_postServiceImpl implements ISave_postService {
	
	@Resource(name="save_postDao")
	private ISave_postDao save_postDao;
	
	@Override
	public int insert_savepostData(Save_postVo savepostVo) {
		return save_postDao.insert_savepostData(savepostVo);
	}

	@Override
	public int delete_savepostData(Save_postVo savepostVo) {
		return save_postDao.delete_savepostData(savepostVo);
	}

	@Override
	public List<Save_postVo> select_savepostData(String mem_id) {
		return save_postDao.select_savepostData(mem_id);
	}

	@Override
	public int savepost_count(String mem_id) {
		return save_postDao.savepost_count(mem_id);
	}

}
