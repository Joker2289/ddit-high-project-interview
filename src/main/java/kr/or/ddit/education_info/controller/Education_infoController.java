package kr.or.ddit.education_info.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.education_info.service.IEducation_infoService;
import kr.or.ddit.files.model.FilesVo;
import kr.or.ddit.files.service.IFilesService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.util.fileupload.FileUpload;

@Controller
public class Education_infoController {
	private Logger logger = LoggerFactory.getLogger(Education_infoController.class);
	
	@Resource(name="education_infoService")
	private IEducation_infoService education_infoservice;
	
	@Resource(name="filesService")
	private IFilesService filesService;
	
	@RequestMapping("/educationInsert")
	public String careerInsert(UsersVo usersVo, MultipartHttpServletRequest file, HttpServletRequest req, Education_infoVo education_infoVo) {
		List<MultipartFile> fileList = file.getFiles("filesVo");
		List<FilesVo> filesVoList = new ArrayList<FilesVo>();
		HashMap<String, String> result = new HashMap<String, String>();
		
		education_infoservice.insert_education_info(education_infoVo);
		
		for(MultipartFile part : fileList){
			result = FileUpload.fileUpload(part,req);
			
			if (result != null){
				FilesVo filesVo = new FilesVo();
				filesVo.setFile_name(result.get("filename"));
				filesVo.setFile_path(result.get("realFilename"));
				filesVo.setDivision("12");
				filesVo.setRef_code(education_infoVo.getEducation_code());
				filesVoList.add(filesVo);
			}
		}
		
		for (FilesVo filesVo:filesVoList) {
			filesService.insert_usersFile(filesVo);
		}
		
		return "redirect:/profileHome";
		
	}
	
	@RequestMapping("/educationUpdate")
	public String educationUpdate(UsersVo usersVo, MultipartHttpServletRequest file, HttpServletRequest req, Education_infoVo education_infoVo) {
		String[] file_name = req.getParameterValues("file_name");
		String[] file_path = req.getParameterValues("file_path");
		List<MultipartFile> fileList = file.getFiles("filesVo");
		List<FilesVo> filesVoList = new ArrayList<FilesVo>();
		HashMap<String, String> result = new HashMap<String, String>();
		
		FilesVo delfilesVo = new FilesVo();
		delfilesVo.setDivision("12");
		delfilesVo.setRef_code(education_infoVo.getEducation_code());
		filesService.delete_allFile(delfilesVo);
		
		education_infoservice.update_educationInfo(education_infoVo);
		
		if(file_name != null) {
			for(int i = 0; i < file_name.length; i++) {
				FilesVo filesVo = new FilesVo();
				filesVo.setRef_code(education_infoVo.getEducation_code());
				filesVo.setFile_name(file_name[i]);
				filesVo.setFile_path(file_path[i]);
				filesVo.setDivision("12");
				filesVoList.add(filesVo);
			}
		}
		
		for(MultipartFile part : fileList){
			result = FileUpload.fileUpload(part,req);
			
			if (result != null){
				FilesVo filesVo = new FilesVo();
				filesVo.setRef_code(education_infoVo.getEducation_code());
				filesVo.setFile_name(result.get("filename"));
				filesVo.setFile_path(result.get("realFilename"));
				filesVo.setDivision("12");
				filesVo.setRef_code(education_infoVo.getEducation_code());
				filesVoList.add(filesVo);
			}
		}
		
		for (FilesVo filesVo:filesVoList) {
			filesService.insert_usersFile(filesVo);
		}
		
		return "redirect:/profileHome";
		
	}
	
	@ResponseBody
	@RequestMapping(path= {"/schoolNameAPI"})
	public JSONObject shoolNameAPI() throws ParseException {
		 StringBuilder sb = new StringBuilder();
		try {
			StringBuilder urlBuilder = new StringBuilder("http://www.career.go.kr/cnet/openapi/getOpenApi?apiKey=bcc9024f74e34b058727abe95a5ea204&svcType=api&svcCode=SCHOOL&contentType=json&gubun=univ_list&perPage=10000"); /*URL*/
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
        JSONObject parse_dataSearch = (JSONObject) obj.get("dataSearch");
         

		return parse_dataSearch;
		
	}
}
