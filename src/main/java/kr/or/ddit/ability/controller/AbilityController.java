package kr.or.ddit.ability.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.ability.model.AbilityVo;
import kr.or.ddit.ability.service.IAbilityService;
import kr.or.ddit.thesis_list.model.Thesis_listVo;
import kr.or.ddit.thesis_list.service.IThesis_listService;
import kr.or.ddit.users.model.UsersVo;

@Controller
public class AbilityController {
	
	private Logger logger = LoggerFactory.getLogger(AbilityController.class);
	
	@Resource(name="abilityService")
	private IAbilityService abilityService;
	
	@RequestMapping("/abilityInsert")
	public String abilityInsert(AbilityVo abilityVo) {
		
		abilityService.insert_ability(abilityVo);
		
		return "redirect:/profileHome";
		
	}
	
	@RequestMapping("/abilityUpdate")
	public String abilityUpdate(AbilityVo abilityVo) {
		
		abilityService.update_ability(abilityVo);
		
		return "redirect:/profileHome";
		
	}
	
	@RequestMapping("/abilityDelete")
	public String abilityDelete(String ability_code) {
		
		abilityService.delete_ability(ability_code);
		
		return "redirect:/profileHome";
		
	}
}
