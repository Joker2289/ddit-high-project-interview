package kr.or.ddit.report.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.report.model.ReportVo;
import kr.or.ddit.test.LogicTestConfig;

public class ReportDaoImplTest extends LogicTestConfig{

	@Resource(name="reportDao")
	private IReportDao reportDao;
	
	/**
	 * 
	 * Method : testGetReport
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 유저의 신고내역 조회 테스트.
	 */
	@Test
	public void testGetReport() {
		/***Given***/
		ReportVo tempRVo = new ReportVo();
		tempRVo.setDivision("34");
		tempRVo.setMem_id("joker");
		tempRVo.setRef_code("3");

		/***When***/
		ReportVo rVo = reportDao.getReport(tempRVo);

		/***Then***/
		assertNotNull(rVo);
	}
	
	
	
	
	
	
}


