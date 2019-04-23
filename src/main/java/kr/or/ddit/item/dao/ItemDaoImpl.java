package kr.or.ddit.item.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.item.model.ItemVo;

@Repository("itemDao")
public class ItemDaoImpl implements IItemDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;	
	
	/**
	 * 
	 * Method : getItemList
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param item_div
	 * @return
	 * Method 설명 : 특정 항목 리스트 조회.
	 */
	@Override
	public List<String> getItemList(String item_div) {
		List<String> itemList = sqlSessionTemplate.selectList("item.getItemList", item_div);
		
		return itemList;
	}

	/**
	 * 
	 * Method : getItemCnt
	 * 작성자 : PC19
	 * 변경이력 :
	 * @return
	 * Method 설명 : 전체 항목 수 조회.
	 */
	@Override
	public int getItemCnt() {
		int itemCnt = sqlSessionTemplate.selectOne("item.getItemCnt");
		
		return itemCnt;
	}

	/**
	 * 
	 * Method : deleteForTest
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param item_code
	 * @return
	 * Method 설명 : 테스트를 위한 항목 삭제.
	 */
	@Override
	public int deleteForTest(String item_code) {
		int deleteCnt = sqlSessionTemplate.delete("item.deleteForTest", item_code);
		
		return deleteCnt;
	}

	/**
	 * 
	 * Method : insertItem
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param iVo
	 * @return
	 * Method 설명 : 항목 등록.
	 */
	@Override
	public int insertItem(ItemVo iVo) {
		int insertCnt = sqlSessionTemplate.insert("item.insertItem", iVo);
		
		return insertCnt;
	}

	
	
	
	
	
}



