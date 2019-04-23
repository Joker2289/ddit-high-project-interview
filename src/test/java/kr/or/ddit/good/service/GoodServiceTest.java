package kr.or.ddit.good.service;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.good.model.GoodVo;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;

public class GoodServiceTest extends LogicTestConfig {

	private Logger logger = LoggerFactory.getLogger(GoodServiceTest.class);
	
	@Resource(name="goodService")
	IGoodService goodService;
	
	@Resource(name="memberService")
	IMemberService memberSerivce;
	
	@Resource(name="usersService")
	IUsersService usersService;
	
	@Resource(name="corporationService")
	ICorporationService corpService;

	@Test
	public void testInsert_goodInfo() {
		/***Given***/
		GoodVo goodVo = new GoodVo();
		
		/***When***/
		goodVo.setRef_code("260");
		goodVo.setDivision("28");
		goodVo.setMem_id("lhh");
		
		int insertCnt = goodService.insert_goodInfo(goodVo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	@Test
	public void testDelete_goodInfo(){
		/***Given***/
		GoodVo goodVo = new GoodVo();
		
		/***When***/
		goodVo.setDivision("28");
		goodVo.setRef_code("");
		goodVo.setMem_id("goo8455");
		
		int deleteCnt = goodService.delete_goodInfo(goodVo);
		
		/***Then***/
		assertEquals(1, deleteCnt);
	}
	
	@Test
	public void testSelect_goodInfo(){
		/***Given***/
		
		/***When***/
		List<GoodVo> goodList = goodService.select_goodInfo("jin");
		for(int i=0; i<goodList.size(); i++){
			logger.debug("good info : {}", goodList.get(i).getGood_code());
		}
		
		/***Then***/
		assertTrue(goodList.size() > 0);
	}
	
	@Test
	public void testSelect_goodCount(){
		/***Given***/
		GoodVo goodVo = new GoodVo();
		
		/***When***/
		goodVo.setDivision("28");
		goodVo.setRef_code("138");
		
		int goodCnt = goodService.select_goodCount(goodVo);
		logger.debug("good count : {}", goodCnt);
		
		/***Then***/
		assertTrue(goodCnt > 0);
	}
	
	@Test
	public void testSelect_pushGoodMember(){
		//회사까지 조회되는 쿼리 및 테스트코드 적용 필요 (미완성)
		
		/***Given***/
		GoodVo goodVo 	   = new GoodVo();
		MemberVo member    = new MemberVo();
		UsersVo users	   = new UsersVo();
		CorporationVo corp = new CorporationVo();
		
		String introduce   = "";
		String member_name = "";
		
		/***When***/
		goodVo.setDivision("28");
		goodVo.setRef_code("138");
		
		List<UsersVo> goodinfo = goodService.select_pushGoodMember(goodVo);
		for(int i=0; i<goodinfo.size(); i++){
			logger.debug("good push member : {}", goodinfo.get(i).getUser_name());
			
			member = memberSerivce.select_memberInfo(goodinfo.get(i).getUser_id());
			if(member.getMem_division().equals("1")){
				Map<String, Object> map = usersService.select_introduce(member.getMem_id());
				UsersVo usersVo = (UsersVo) map.get("usersVo");
				introduce 	= usersVo.getIntroduce();
				users = usersService.select_userInfo(member.getMem_id());
				member_name = users.getUser_name();
				
				
				logger.debug("user info : {}, {}", member_name, introduce);
			} else if(member.getMem_division().equals("2")) {
				corp = corpService.select_corpInfo(member.getMem_id());
				member_name = corp.getCorp_name();
				
				logger.debug("corp info : {}", member_name);
			} else {
				
			}
		}
		
		/***Then***/
		assertTrue(goodinfo.size() > 0);
	}
	
	@Test
	public void testSelect_pushedGoodPost(){
		/***Given***/
		
		/***When***/
		List<GoodVo> goodList = goodService.select_pushedGoodPost("goo8455");
		
		for(GoodVo vo : goodList){
			logger.debug("pushed good post_code : {}", vo.getRef_code());
		}
		
		/***Then***/
		assertTrue(goodList.size() > 0);
	}
	
	@Test
	public void testSearch_goodcode(){
		/***Given***/
		GoodVo goodinfo = new GoodVo();
		goodinfo.setMem_id("brown");
		goodinfo.setRef_code("355");
		goodinfo.setDivision("28");
		
		/***When***/
		String good_code = goodService.search_goodcode(goodinfo);
		logger.debug("good_code : {}", good_code);
		
		/***Then***/
		assertNotNull(good_code);
	}

}
