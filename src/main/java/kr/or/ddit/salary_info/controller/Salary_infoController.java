package kr.or.ddit.salary_info.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.member.model.MemberVo;
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
	public String companySalaryView(String corp_id, Model model, HttpServletRequest req) {
		
		CorporationVo corporationInfo = corporationService.select_corpInfo(corp_id);
		List<Salary_infoVo> siVo = personalService.select_companySalary(corp_id);
		
		model.addAttribute("corporationInfo", corporationInfo);
		model.addAttribute("siVo", siVo);
		
		//접속자가 회사에 등록된 직원인지 판별
		
		//접속자정보
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		
		//회사정보
		CorporationVo corpInfo = corporationService.select_corpInfo(corp_id);
		
		//회사의 직원이면 정보가져오고, 직원이 아닐경우 null
		Career_infoVo career_infoVo = new Career_infoVo();
		career_infoVo.setCorp_code(corpInfo.getCorp_code());
		career_infoVo.setUser_id(mVo.getMem_id());
		Career_infoVo employInfo = corporationService.select_employInfo(career_infoVo);
		model.addAttribute("employInfo", employInfo);
		
		
		return "companySalaryTiles";
	}
	
	
	@RequestMapping(path={"/companySalaryInsert"})
	public String companySalaryInsert(Salary_infoVo salaryVo) {
		
		personalService.insert_companySalary(salaryVo);
		
		return "redirect:/companySalary?corp_id="+salaryVo.getCorp_id();
	}
	

}
