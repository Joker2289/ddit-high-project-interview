package kr.or.ddit.report.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.report.model.ReportVo;

@Repository("reportDao")
public class ReportDaoImpl implements IReportDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert_reportInfo(ReportVo reportVo) {
		return sqlSession.insert("report.insert_reportInfo", reportVo);
	}

	@Override
	public int delete_reportInfo(ReportVo reportVo) {
		return sqlSession.delete("report.delete_reportInfo", reportVo);
	}

	@Override
	public List<ReportVo> select_reportInfo(String division) {
		return sqlSession.selectList("report.select_reportInto", division);
	}

}
