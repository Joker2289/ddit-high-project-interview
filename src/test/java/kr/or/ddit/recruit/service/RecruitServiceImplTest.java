package kr.or.ddit.recruit.service;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.test.LogicTestConfig;

public class RecruitServiceImplTest extends LogicTestConfig{
	private Logger logger = LoggerFactory.getLogger(RecruitServiceImplTest.class);

	@Resource(name="recruitService")
	private IRecruitService recrService;
	
	@Test
	public void testInsertRecruit() {
		/***Given***/
		recrService.deleteForTest("1");
		
		RecruitVo rVo = new RecruitVo();
		rVo.setRecruit_code("1");
		rVo.setCorp_id("5");
		rVo.setRecruit_title("2019년 상반기 신입/경력 채용");
		rVo.setJob_type("소프트웨어개발/백엔드");
		rVo.setRecruit_contents("xxx일을 해주세용");
		rVo.setStart_date("19/02/20");
		rVo.setEnd_date("19/02/27");
		rVo.setPersonnel("O명");
		rVo.setJob_rank("사원/대리");
		rVo.setEmp_type("정규직");
		rVo.setApp_type("t");
		rVo.setApp_count("0");
		rVo.setJob_local("서울");
		
		/***When***/
		int insertCnt = recrService.insertRecr(rVo);

		/***Then***/
		assertNotNull(insertCnt);
	}

	// math random 테스트.
	@Test
	public void testRandom() {
		/***Given***/
		int size = 10;

		/***When***/
		int ridx = 0;
		for(int i = 0; i < 20; i++){
			ridx = (int) (Math.random() * size) + 1;
			logger.debug("ridx? : {}", ridx);	
		}

		/***Then***/
		assertNotNull(ridx);
	}
	
	
	
	
}









