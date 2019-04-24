package kr.or.ddit.section.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.section.dao.ISectionDao;
import kr.or.ddit.section.model.SectionVo;

@Service("sectionService")
public class SectionServiceImpl implements ISectionService{

	@Resource(name="sectionDao")
	private ISectionDao sectionDao;
	
	@Override
	public int insert_section(SectionVo vo) {
		return sectionDao.insert_section(vo);
	}

	@Override
	public int update_section(SectionVo vo) {
		return sectionDao.update_section(vo);
	}

	@Override
	public int delete_section(String section_code) {
		return sectionDao.delete_section(section_code);
	}

	@Override
	public List<SectionVo> select_sectionList(String portfolio_code) {
		return sectionDao.select_sectionList(portfolio_code);
	}

	@Override
	public SectionVo select_sectionInfo(String section_code) {
		return sectionDao.select_sectionInfo(section_code);
	}

}
