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
	
}
