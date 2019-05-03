package kr.or.ddit.corpgrape;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.util.graph.GraphVo;

public class CorpGraphTest extends LogicTestConfig {
	
	@Resource(name="corporationService")
	private ICorporationService service;
	
	@Test
	public void test() {
		List<GraphVo> list = service.graphInfo("42fad709");
		for(GraphVo info : list) {
			System.out.println(">>>>>>>>>>>>>>>>"+info.getUser_name());
		}
		
	}

}
