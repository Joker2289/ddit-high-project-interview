package kr.or.ddit.patent_list.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.patent_list.model.Patent_listVo;

@Repository("patent_listDao")
public class Patent_listDaoImpl implements IPatent_listDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * Method : insert_patent_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param patent_listvo
	 * @return
	 * Method 설명 : 특허 등록
	 */
	@Override
	public int insert_patent_list(Patent_listVo patent_listvo) {
		return sqlSessionTemplate.insert("patent_list.insert_patent_list", patent_listvo);
	}

	
	/**
	 * Method : select_patent_list
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 특허 조회
	 */
	@Override
	public List<Patent_listVo> select_patent_list(String user_id) {
		return sqlSessionTemplate.selectList("patent_list.select_patent_list", user_id);
	}

}
