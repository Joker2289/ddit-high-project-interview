package kr.or.ddit.salary_info.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;

@Controller
public class Salary_infoController {
	
	private Logger logger = LoggerFactory.getLogger(Salary_infoController.class);
	
	@Resource(name="personalService")
	private IPersonal_connectionService personalService; 
	
	@Resource(name = "corporationService")
	private ICorporationService corporationService;
	
	
	
	@RequestMapping(path={"/companySalary"})
	public String companySalaryView(String corp_id, Model model) {
		
		CorporationVo corporationInfo = corporationService.select_corpInfo(corp_id);
		
		model.addAttribute("corporationInfo", corporationInfo);
		
		return "companySalaryTiles";
		
	}
	

}
