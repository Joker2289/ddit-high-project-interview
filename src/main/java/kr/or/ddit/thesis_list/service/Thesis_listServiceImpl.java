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
		return thesis_listDao.select_oneThesis_list(thesis_code);
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
		return thesis_listDao.update_thesis_list(thesis_listVo);
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
		return thesis_listDao.delete_thesis_list(thesis_code);
	}

}
