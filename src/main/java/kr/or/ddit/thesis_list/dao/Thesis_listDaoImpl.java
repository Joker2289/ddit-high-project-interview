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

	/**
	 * Method : select_oneThesis_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param thesis_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 논문저서 조회 
	 */
	@Override
	public Thesis_listVo select_oneThesis_list(String thesis_code) {
		return sqlSessionTemplate.selectOne("thesis_list.select_oneThesis_list", thesis_code);
	}

	/**
	 * Method : update_thesis_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param thesis_listVo
	 * @return
	 * Method 설명 : 사용자의 논문저서 업데이트
	 */
	@Override
	public int update_thesis_list(Thesis_listVo thesis_listVo) {
		return sqlSessionTemplate.update("thesis_list.update_thesis_list", thesis_listVo);
	}

	/**
	 * Method : delete_thesis_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param thesis_code
	 * @return
	 * Method 설명 : 사용자의 논문저서 삭제
	 */
	@Override
	public int delete_thesis_list(String thesis_code) {
		return sqlSessionTemplate.delete("thesis_list.delete_thesis_list", thesis_code);
	}

}
