package kr.or.ddit.report.dao;

import java.util.List;

import kr.or.ddit.report.model.ReportVo;

public interface IReportDao {
	
	/**
	 * Method : insert_reportInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param reportVo
	 * @return
	 * Method 설명 : 신고정보 등록
	 */
	int insert_reportInfo(ReportVo reportVo);
	
	/**
	 * Method : delete_reportInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param reportVo
	 * @return
	 * Method 설명 : 신고정보 삭제
	 */
	int delete_reportInfo(ReportVo reportVo);
	
	/**
	 * Method : select_reportInfo
	 * 작성자 : goo84
	 * 변경이력 :
	 * @param division
	 * @return
	 * Method 설명 : 컨텐츠 유형별 신고정보 조회
	 */
	List<ReportVo> select_reportInfo(String division);

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param report_contents
	 * @return
	 * Method 설명 : 테스트를 위한 신고 삭제.
	 */
	int deleteForTest(String report_contents);

	/**
	 * 
	 * Method : getReport
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param tempRVo
	 * @return
	 * Method 설명 : 특정 유저의 신고여부 조회.
	 */
	ReportVo getReport(ReportVo tempRVo);
	
}
