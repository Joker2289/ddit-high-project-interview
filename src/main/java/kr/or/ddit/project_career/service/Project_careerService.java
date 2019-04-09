package kr.or.ddit.project_career.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.project_career.dao.IProject_careerDao;
import kr.or.ddit.project_career.model.Project_careerVo;

@Service("project_careerService")
public class Project_careerService implements IProject_careerService {

	@Resource(name="project_careerDao")
	private IProject_careerDao project_careerDao;
	
	/**
	 * Method : insert_project_career
	 * 작성자 : jin
	 * 변경이력 :
	 * @param project_careervo
	 * @return
	 * Method 설명 : 프로젝트 등록
	 */
	@Override
	public int insert_project_career(Project_careerVo project_careervo) {
		return project_careerDao.insert_project_career(project_careervo);
	}
	
	/**
	 * Method : select_project_career
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 프로젝트 조회
	 */
	@Override
	public List<Project_careerVo> select_project_career(String user_id) {
		return project_careerDao.select_project_career(user_id);
	}

}
