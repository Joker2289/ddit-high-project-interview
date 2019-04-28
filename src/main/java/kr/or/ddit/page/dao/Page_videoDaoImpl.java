package kr.or.ddit.page.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.page.model.Page_videoVo;

@Repository("page_videoDao")
public class Page_videoDaoImpl implements IPage_videoDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert_page_video(Page_videoVo vo) {
		return sqlSession.insert("page_video.insert_page_video", vo);
	}

	@Override
	public List<Page_videoVo> select_page_video(String page_code) {
		return sqlSession.selectList("page_video.select_page_video", page_code);
	}

	@Override
	public int delete_page_video(String page_code) {
		return sqlSession.delete("page_video.delete_page_video", page_code);
	}

}
