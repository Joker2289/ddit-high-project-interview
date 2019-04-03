package kr.or.ddit.search_log.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.search_log.model.Search_logVo;
import kr.or.ddit.search_log.service.ISearch_logService;

@Controller
public class Search_logController {

	@Resource(name="search_logService")
	private ISearch_logService sLogService;
	
	// @검색내역 저장.
	@RequestMapping("/insertSLog")
	public String insertSLog(String search_word, String search_local, HttpSession session, HttpServletRequest req, 
			Model model) {
		// 검색어 DB에 저장하기
		Search_logVo sVo = new Search_logVo();
		
		if(search_word == null || search_word.equals("")){
			sVo.setSearch_word("전체");
		}else{
			sVo.setSearch_word(search_word);
		}
		
		if(search_local == null || search_local.equals("")){
			sVo.setSearch_local("전국");
		}else{
			sVo.setSearch_local(search_local);			
		}
		
		sVo.setSearch_code(String.valueOf(sLogService.getAllCnt()+1));
		
		// search_save 임시로 2로 설정. -> 나중에 1로 바꾸기.
		sVo.setSearch_save("1");
		
		MemberVo mVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		if(mVo != null){
			sVo.setUser_id(mVo.getMem_id());
		}else{
			// 임시로 아이디 brown 입력.
			sVo.setUser_id("brown");
		}
		
		sLogService.insertSearch_log(sVo);		

		return "redirect:" + req.getContextPath() + "/recrSearch";
	}
	
	// @검색내역 저장여부 수정.
	@RequestMapping("/updateSave")
	public String updateSave(String save_flag, String search_code, HttpServletRequest req) {
		// save_flag 't'를 받으면 - 검색내역 저장 해제. - search_save를 '1'로 변경.
		if(save_flag != null && save_flag.equals("t")){
			Search_logVo sVo = sLogService.getSearch_log(search_code);
			sVo.setSearch_save("1");
			
			sLogService.updateSearch_log(sVo);
		}

		return "redirect:" + req.getContextPath() + "/recruit";
	}
	
	
	
	
	
	

}





