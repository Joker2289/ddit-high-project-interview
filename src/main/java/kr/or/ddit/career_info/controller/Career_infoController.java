package kr.or.ddit.career_info.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.career_info.service.ICareer_infoService;
import kr.or.ddit.files.model.FilesVo;
import kr.or.ddit.files.service.IFilesService;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.util.fileupload.FileUpload;

@Controller
public class Career_infoController {
	
	@Resource(name="career_infoService")
	private ICareer_infoService careerService;
	
	@Resource(name="filesService")
	private IFilesService filesService;
	
	@RequestMapping("/careerInsert")
	public String careerInsert(UsersVo usersVo, MultipartHttpServletRequest file, HttpServletRequest req, Career_infoVo career_infoVo) {
		List<MultipartFile> fileList = file.getFiles("filesVo");
		List<FilesVo> filesVoList = new ArrayList<FilesVo>();
		HashMap<String, String> result = new HashMap<String, String>();
		
		careerService.insert_career_info(career_infoVo);
		
		for(MultipartFile part : fileList){
			result = FileUpload.fileUpload(part,req);
			
			if (result != null){
				FilesVo filesVo = new FilesVo();
				filesVo.setRef_code(usersVo.getUser_id());
				filesVo.setFile_name(result.get("filename"));
				filesVo.setFile_path(result.get("realFilename"));
				filesVo.setDivision("05");
				filesVo.setRef_code(career_infoVo.getCurrval());
				filesVoList.add(filesVo);
			}
		}
		
		for (FilesVo filesVo:filesVoList) {
			filesService.insert_usersFile(filesVo);
		}
		
		return "redirect:/profileHome";
		
	}
}
