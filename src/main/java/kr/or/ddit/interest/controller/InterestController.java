package kr.or.ddit.interest.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.interest.model.InterestVo;
import kr.or.ddit.interest.service.IInterestService;
import kr.or.ddit.member.model.MemberVo;

@Controller
public class InterestController {
	private Logger logger = LoggerFactory.getLogger(InterestController.class);
	
	@Resource(name="interestService")
	private IInterestService inteService;
	
	// 관심분야 페이지 요청.
	@RequestMapping("/interest")
	public String interest(){
		return "interestTiles";
	}
	
	// @관심분야 등록.
	@RequestMapping("/insertInte")
	public String insertInte(HttpServletRequest req, String inte_type, String inte_local, String inte_emptype, 
			String inte_size, HttpSession session) {
		// mem_id로 검색되는 관심분야가 있으면 update, 없으면 insert.
		MemberVo mVo = (MemberVo) session.getAttribute("memberVO");
		InterestVo iVo = inteService.getInte(mVo.getMem_id());
		if(iVo != null){
			iVo.setInte_emptype(inte_emptype);
			iVo.setInte_local(inte_local);
			iVo.setInte_size(inte_size);
			iVo.setInte_type(inte_type);
			
			inteService.updateInte(iVo);
		}else{
			iVo = new InterestVo();
			iVo.setInte_code(String.valueOf(inteService.getInteCnt()+1));
			
			iVo.setUser_id(mVo.getMem_id());
			
			iVo.setInte_emptype(inte_emptype);
			iVo.setInte_local(inte_local);
			iVo.setInte_size(inte_size);
			iVo.setInte_type(inte_type);
			
			inteService.insertInte(iVo);
		}

		return "redirect:" + req.getContextPath() + "/recruit";
	}
	
	

}







