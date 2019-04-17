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

}
