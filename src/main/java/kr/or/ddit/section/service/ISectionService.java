package kr.or.ddit.section.service;

import java.util.List;

import kr.or.ddit.section.model.SectionVo;

public interface ISectionService {
	
	/**
	 * 
	 * Method : insert_section
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 섹션 추가
	 */
	int insert_section(SectionVo vo);
	
	/**
	 * 
	 * Method : update_section
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param vo
	 * @return
	 * Method 설명 : 섹션 수정
	 */
	int update_section(SectionVo vo);
	
	
	/**
	 * 
	 * Method : delete_section
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param section_code
	 * @return
	 * Method 설명 : 섹션 삭제
	 */
	int delete_section(String section_code);
	
	/**
	 * 
	 * Method : select_sectionList
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param portfilo_code
	 * @return
	 * Method 설명 : 포트폴리오의 섹션 리스트 조회
	 */
	List<SectionVo> select_sectionList(String portfolio_code);
	
	/**
	 * 
	 * Method : select_sectionInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param section_code
	 * @return
	 * Method 설명 : 섹션 조회
	 */
	SectionVo select_sectionInfo(String section_code);
}
