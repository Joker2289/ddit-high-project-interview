package kr.or.ddit.possesion_skills.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.possesion_skills.model.Possesion_skillsVo;
import kr.or.ddit.possesion_skills.service.IPossesion_skillsService;
import kr.or.ddit.users.model.UsersVo;

@Controller
public class Possesion_skillsController {
	
	private Logger logger = LoggerFactory.getLogger(Possesion_skillsController.class);
	
	@Resource(name="possesion_skillsService")
	private IPossesion_skillsService possesion_skillsService;
	
	@RequestMapping("/possesion_skillsInsert")
	public String possesion_skillsInsert(UsersVo usersVo, MultipartHttpServletRequest file, HttpServletRequest req, Possesion_skillsVo possesion_skillsVo) {
		
		possesion_skillsService.insert_possesion_skills(possesion_skillsVo);
		
		return "redirect:/profileHome";
		
	}
	
	@RequestMapping("/possesion_skillsUpdate")
	public String possesion_skillsUpdate(UsersVo usersVo, MultipartHttpServletRequest file, HttpServletRequest req, Possesion_skillsVo possesion_skillsVo) {
		
		possesion_skillsService.update_possesion_skills(possesion_skillsVo);
		
		return "redirect:/profileHome";
		
	}
	
	@ResponseBody
	@RequestMapping(path= {"/skillNameAPI"})
	public JSONObject shoolNameAPI() throws ParseException {
		 StringBuilder sb = new StringBuilder();
		try {
			StringBuilder urlBuilder = new StringBuilder("http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList?_type=json&serviceKey=whCny9qSCn41PrMdaafBGYEoCvdPzVf%2BXgpyYzItQJ11XKCKb0%2BWFOp9t434dzSIhDWYB3UU6jxrn6kpWLeBBQ%3D%3D"); /*URL*/
		     URL url = new URL(urlBuilder.toString());
		     HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		     conn.setRequestMethod("GET");
		     conn.setRequestProperty("Content-type", "application/json");
		     BufferedReader rd;
		     if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		         rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		     } else {
		         rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		     }
		     String line;
		     while ((line = rd.readLine()) != null) {
		         sb.append(line);
		     }
		     rd.close();
		     conn.disconnect();
		     
		} catch (IOException e) {
			e.printStackTrace();
		}
		JSONParser parser = new JSONParser();
        JSONObject obj = (JSONObject) parser.parse(sb.toString());
        JSONObject parse_response = (JSONObject) obj.get("response");
        // response 로 부터 body 찾아옵니다.
        JSONObject parse_body = (JSONObject) parse_response.get("body");
        // body 로 부터 items 받아옵니다.
        JSONObject parse_items = (JSONObject) parse_body.get("items");
         

		return parse_items;
		
	}
}
