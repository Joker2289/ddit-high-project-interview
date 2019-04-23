package kr.or.ddit.item.dao;

import java.util.List;

import kr.or.ddit.item.model.ItemVo;

public interface IItemDao {
	
	/**
	 * 
	 * Method : getItemList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param item_div
	 * @return
	 * Method 설명 : 특정 항목 리스트 조회.
	 */
	List<String> getItemList(String item_div);

	/**
	 * 
	 * Method : getItemCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 항목 수 조회.
	 */
	int getItemCnt();

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param item_code
	 * @return
	 * Method 설명 : 테스트를 위한 항목 삭제.
	 */
	int deleteForTest(String item_code);
	
	/**
	 * 
	 * Method : insertItem
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param iVo
	 * @return
	 * Method 설명 : 항목 등록.
	 */
	int insertItem(ItemVo iVo);
	
	
	
	
	
}



