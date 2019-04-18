package kr.or.ddit.report.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.BeforeClass;
import org.junit.Test;

import kr.or.ddit.report.model.ReportVo;
import kr.or.ddit.test.LogicTestConfig;

public class ReportServiceTest extends LogicTestConfig {

	@Resource(name="reportService")
	private IReportService reportService;
	
	@Test
	public void testInsert_reportInfo() {
		/***Given***/
		ReportVo reportInfo = new ReportVo();
		
		/***When***/
		reportInfo.setDivision("28");
		reportInfo.setRef_code("303");
		reportInfo.setMem_id("goo8455");
		
		int insertCnt = reportService.insert_reportInfo(reportInfo);
		
		/***Then***/
		assertTrue(insertCnt > 0);
	}

}
