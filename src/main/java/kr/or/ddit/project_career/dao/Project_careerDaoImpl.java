package kr.or.ddit.project_career.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.project_career.model.Project_careerVo;

@Repository("project_careerDao")
public class Project_careerDaoImpl implements IProject_careerDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
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
		return sqlSessionTemplate.insert("project_career.insert_project_career", project_careervo);
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
		return sqlSessionTemplate.selectList("project_career.select_project_career", user_id);
	}

}
