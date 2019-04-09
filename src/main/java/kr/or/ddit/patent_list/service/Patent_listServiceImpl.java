package kr.or.ddit.patent_list.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.patent_list.dao.IPatent_listDao;
import kr.or.ddit.patent_list.model.Patent_listVo;

@Service("patent_listService")
public class Patent_listServiceImpl implements IPatent_listService {

	@Resource(name="patent_listDao")
	private IPatent_listDao patent_listDao;
	
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
		return patent_listDao.insert_patent_list(patent_listvo);
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
		return patent_listDao.select_patent_list(user_id);
	}

}
