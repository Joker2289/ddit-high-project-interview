package kr.or.ddit.salary_info.controller;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.salary_info.model.Salary_infoVo;
import kr.or.ddit.util.pagination.PaginationVo;

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
		List<Salary_infoVo> siVo = personalService.select_companySalary(corp_id);
		
		model.addAttribute("corporationInfo", corporationInfo);
		model.addAttribute("siVo", siVo);
		
		return "companySalaryTiles";
	}
	
	
	@RequestMapping(path={"/companySalaryInsert"})
	public String companySalaryInsert(Salary_infoVo salaryVo) {
		
		personalService.insert_companySalary(salaryVo);
		
		return "redirect:/companySalary?corp_id="+salaryVo.getCorp_id();
	}
	

}
