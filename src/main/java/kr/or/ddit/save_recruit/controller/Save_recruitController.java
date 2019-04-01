package kr.or.ddit.save_recruit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.save_recruit.model.Save_recruitVo;
import kr.or.ddit.save_recruit.service.ISave_recruitService;

@Controller
public class Save_recruitController {
	private Logger logger = LoggerFactory.getLogger(Save_recruitController.class);
	
	@Resource(name="save_recruitService")
	private ISave_recruitService srecrService;

	// @채용공고저장 페이지 요청.
	@RequestMapping("/srecr")
	public String srecr(){
		
		return "srecrTiles";
	}
	
	// @채용공고 스크랩(저장)
	@RequestMapping("/scrap")
	public String scrap(String scrap_flag, HttpSession session, HttpServletRequest req) {
		MemberVo mVo = (MemberVo) session.getAttribute("memberVO");
		
		// 채용공고 스크랩을 한 경우. scrap_flag.substring(0, 1) -> 't'
		if( scrap_flag != null && 
				(scrap_flag.substring(0, 1).equals("t") || scrap_flag.substring(0, 1).equals("f")) ){
			// recruit_code는 scrap_flag - substring - 앞의 한글자만 빼면 됨.
			String scrap_code = scrap_flag.substring(1, scrap_flag.length());
			
			List<Save_recruitVo> uSRList = new ArrayList<>();
			uSRList = srecrService.getUserSrecrList(mVo.getMem_id());
			
			// 조회한 데이터가 없는 경우 먼저 insert를 해야됨.
			boolean srecr_Flag = false;
			for(Save_recruitVo sVo : uSRList){
				if(sVo.getRecruit_code().equals(scrap_code)){
					srecr_Flag = true;
				}
			}
			
			if(uSRList.size() == 0 || srecr_Flag  == false){
				Save_recruitVo sVo = new Save_recruitVo();
				sVo.setRecruit_code(scrap_code);
				sVo.setSave_code(String.valueOf(srecrService.getSrecrCnt()+1));
				sVo.setSave_flag("t");
				sVo.setUser_id(mVo.getMem_id());
				srecrService.insertSrecr(sVo);
			}else{
				for(Save_recruitVo sVo : uSRList){
					if(sVo.getRecruit_code().equals(scrap_code)){
						if(scrap_flag.substring(0, 1).equals("t")){
							sVo.setSave_flag("t");
						}else{
							sVo.setSave_flag("f");
						}
						srecrService.updateSrecr(sVo);
					}
				}
			}
		}

		return "redirect:" + req.getContextPath() + "/recruit";
	}
	
	
	
	
	
}




