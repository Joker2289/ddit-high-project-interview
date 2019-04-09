package kr.or.ddit.thesis_list.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.thesis_list.dao.IThesis_listDao;
import kr.or.ddit.thesis_list.model.Thesis_listVo;

@Service("thesis_listService")
public class Thesis_listServiceImpl implements IThesis_listService{
	
	@Resource(name="thesis_listDao")
	private IThesis_listDao thesis_listDao;
	
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
		return thesis_listDao.insert_thesis_list(thesis_listvo);
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
		return thesis_listDao.select_thesis_list(user_id);
	}

}
