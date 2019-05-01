package kr.or.ddit.apply_recruit.service;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.apply_recruit.model.Apply_recruitVo;
import kr.or.ddit.test.LogicTestConfig;

public class Apply_recruitServiceImplTest extends LogicTestConfig{

	@Resource(name="apply_recruitService")
	private IApply_recruitService appService;
	
	/**
	 * 
	 * Method : testGetAppList
	 * 작성자 : PC19
	 * 변경이력 :
	 * Method 설명 : 특정 유저의 채용공고지원 목록 조회 테스트.
	 */
	@Test
	public void testGetAppList() {
		/***Given***/

		/***When***/
		List<Apply_recruitVo> appList = appService.getAppList("joker");

		/***Then***/
		assertNotNull(appList);
	}
	
	
	
	
	
	
}



