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
	
	/**
	 * Method : select_oneProject_career
	 * 작성자 : jin
	 * 변경이력 :
	 * @param project_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 프로젝트정보 조회
	 */
	Project_careerVo select_oneProject_career(String project_code);
	
	/**
	 * Method : update_project_career
	 * 작성자 : jin
	 * 변경이력 :
	 * @param project_careerVo
	 * @return
	 * Method 설명 : 사용자의 프로젝트정보 업데이트
	 */
	int update_project_career(Project_careerVo project_careerVo);
	
	/**
	 * Method : delete_project_career
	 * 작성자 : jin
	 * 변경이력 :
	 * @param project_code
	 * @return
	 * Method 설명 : 사용자의 프로젝트정보 삭제
	 */
	int delete_project_career(String project_code);
}
