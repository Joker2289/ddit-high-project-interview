package kr.or.ddit.project_career.service;

import java.util.List;

import kr.or.ddit.project_career.model.Project_careerVo;

public interface IProject_careerService {
	
	/**
	 * Method : insert_project_career
	 * 작성자 : jin
	 * 변경이력 :
	 * @param project_careervo
	 * @return
	 * Method 설명 : 프로젝트 등록
	 */
	int insert_project_career(Project_careerVo project_careervo);
	
	
	/**
	 * Method : select_project_career
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 프로젝트 조회
	 */
	List<Project_careerVo> select_project_career(String user_id);
}
