package kr.or.ddit.item.dao;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.item.model.ItemVo;
import kr.or.ddit.test.LogicTestConfig;

public class ItemDaoImplTest extends LogicTestConfig{

	@Resource(name="itemDao")
	private IItemDao itemDao;

	// 항목 등록 테스트.
	@Test
	public void testInsertItem() {
		/***Given***/
		ItemVo iVo = new ItemVo();
		iVo.setItem_code(String.valueOf(itemDao.getItemCnt()+1));
		iVo.setItem_div("job_type");
		iVo.setItem_content("C++");
		
		/***When***/
		int insertCnt = itemDao.insertItem(iVo);

		/***Then***/
		assertNotNull(iVo);
		
		// delete for test 만들기
		itemDao.deleteForTest(String.valueOf(itemDao.getItemCnt()));
	}
	

	
	
	
	
	

}



