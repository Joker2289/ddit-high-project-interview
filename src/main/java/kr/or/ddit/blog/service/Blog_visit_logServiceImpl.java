package kr.or.ddit.blog.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.blog.dao.IBlog_visit_logDao;
import kr.or.ddit.blog.model.Blog_visit_logVo;

@Service("/visit_logService")
public class Blog_visit_logServiceImpl implements IBlog_visit_logService{

	@Resource(name="visit_logDao")
	private IBlog_visit_logDao visitDao;
	
	@Override
	public int insert_visit_log(Blog_visit_logVo vo) {
		return visitDao.insert_visit_log(vo);
	}

}
