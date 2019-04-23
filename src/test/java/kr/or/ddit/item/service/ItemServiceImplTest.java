package kr.or.ddit.item.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.test.LogicTestConfig;

public class ItemServiceImplTest extends LogicTestConfig{

	@Resource(name="itemService")
	private IItemService itemService;
	
	// 전체 항목 수 조회 테스트.
	@Test
	public void testGetItemCnt() {
		/***Given***/

		/***When***/
		int itemCnt = itemService.getItemCnt();

		/***Then***/
		assertNotNull(itemCnt);
	}

	
	
	
	
}



