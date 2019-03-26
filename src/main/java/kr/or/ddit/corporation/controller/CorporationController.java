package kr.or.ddit.corporation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CorporationController {
   
   
   
   @RequestMapping(path={"/corporationUpdate"},method={RequestMethod.GET})
   public String corporation(HttpSession session){
      return "corporation/corporationUpdate";
      
      
      
   }
}