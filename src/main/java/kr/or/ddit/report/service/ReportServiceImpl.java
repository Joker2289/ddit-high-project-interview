package kr.or.ddit.report.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.report.dao.IReportDao;
import kr.or.ddit.report.model.ReportVo;

@Service("reportService")
public class ReportServiceImpl implements IReportService {

	@Resource(name="reportDao")
	private IReportDao reportDao;
	
	@Override
	public int insert_reportInfo(ReportVo reportVo) {
		return reportDao.insert_reportInfo(reportVo);
	}

	@Override
	public int delete_reportInfo(ReportVo reportVo) {
		return reportDao.delete_reportInfo(reportVo);
	}

	@Override
	public List<ReportVo> select_reportInfo(String division) {
		return reportDao.select_reportInfo(division);
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
		int deleteCnt = reportDao.deleteForTest(report_contents);
		
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
		ReportVo rVo = reportDao.getReport(tempRVo);
		
		return rVo;
	}

}
