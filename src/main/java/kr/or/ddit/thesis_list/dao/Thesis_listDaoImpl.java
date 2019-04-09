package kr.or.ddit.thesis_list.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.thesis_list.model.Thesis_listVo;

@Repository("thesis_listDao")
public class Thesis_listDaoImpl implements IThesis_listDao {

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * Method : insert_thesis_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param thesis_listvo
	 * @return
	 * Method 설명 : 논문 저서 등록
	 */
	@Override
	public int insert_thesis_list(Thesis_listVo thesis_listvo) {
		return sqlSessionTemplate.insert("thesis_list.insert_thesis_list", thesis_listvo);
	}

	/**
	 * Method : select_thesis_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 논문 저서 조회
	 */
	@Override
	public List<Thesis_listVo> select_thesis_list(String user_id) {
		return sqlSessionTemplate.selectList("thesis_list.select_thesis_list", user_id);
	}

}
