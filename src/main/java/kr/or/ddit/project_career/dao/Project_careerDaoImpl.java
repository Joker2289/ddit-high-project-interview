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
	
	/**
	 * Method : select_oneProject_career
	 * 작성자 : jin
	 * 변경이력 :
	 * @param project_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 프로젝트정보 조회
	 */
	@Override
	public Project_careerVo select_oneProject_career(String project_code) {
		return sqlSessionTemplate.selectOne("project_career.select_oneProject_career", project_code);
	}
	
	/**
	 * Method : update_project_career
	 * 작성자 : jin
	 * 변경이력 :
	 * @param project_careerVo
	 * @return
	 * Method 설명 : 사용자의 프로젝트정보 업데이트
	 */
	@Override
	public int update_project_career(Project_careerVo project_careerVo) {
		return sqlSessionTemplate.update("project_career.update_project_career", project_careerVo);
	}

	/**
	 * Method : delete_project_career
	 * 작성자 : jin
	 * 변경이력 :
	 * @param project_code
	 * @return
	 * Method 설명 : 사용자의 프로젝트정보 삭제
	 */
	@Override
	public int delete_project_career(String project_code) {
		return sqlSessionTemplate.delete("project_career.delete_project_career", project_code);
	}

}
