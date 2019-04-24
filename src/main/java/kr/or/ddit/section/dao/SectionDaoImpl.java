package kr.or.ddit.section.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.section.model.SectionVo;

@Repository("sectionDao")
public class SectionDaoImpl implements ISectionDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_section(SectionVo vo) {
		return sqlSession.insert("section.insert_section", vo);
	}

	@Override
	public int update_section(SectionVo vo) {
		return sqlSession.update("section.update_section", vo);
	}

	@Override
	public int delete_section(String section_code) {
		return sqlSession.delete("section.delete_section", section_code);
	}

	@Override
	public List<SectionVo> select_sectionList(String portfolio_code) {
		return sqlSession.selectList("section.select_sectionList", portfolio_code);
	}

	@Override
	public SectionVo select_sectionInfo(String section_code) {
		return sqlSession.selectOne("section.select_sectionInfo", section_code);
	}

}
