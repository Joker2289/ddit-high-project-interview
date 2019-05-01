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

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param report_contents
	 * @return
	 * Method 설명 : 테스트를 위한 신고 삭제.
	 */
	@Override
	public int deleteForTest(String report_contents) {
		int deleteCnt = sqlSession.delete("report.deleteForTest", report_contents);
		
		return deleteCnt;
	}

	/**
	 * 
	 * Method : getReport
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param tempRVo
	 * @return
	 * Method 설명 : 특정 유저의 신고여부 조회.
	 */
	@Override
	public ReportVo getReport(ReportVo tempRVo) {
		ReportVo rVo = sqlSession.selectOne("report.getReport", tempRVo);
		
		return rVo;
	}

}
