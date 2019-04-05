package kr.or.ddit.users.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.ddit.files.model.FilesVo;
import kr.or.ddit.files.service.IFilesService;
import kr.or.ddit.profile.controller.profileController;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.users.service.IUsersService;

@Controller
public class UserController {
	private Logger logger = LoggerFactory.getLogger(profileController.class);
	
	@Resource(name="usersService")
	private IUsersService usersService;
	
	@Resource(name="filesService")
	private IFilesService filesService;
	
	private HashMap<String, String> fileUpload(MultipartFile file, HttpServletRequest req){
		HashMap<String, String> result = new HashMap<String, String>();
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/upload");
		String filename = file.getOriginalFilename();
		
		if (file.getSize() > 0 && !filename.equals("")) {
			int pos = filename.lastIndexOf( "." );
			String ext = filename.substring( pos + 1 );
			String uuidFilename = UUID.randomUUID().toString();
			String realFilename = path + File.separator + uuidFilename + ext;
			try {
				file.transferTo(new File(realFilename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			result.put("filename", filename);
			result.put("realFilename", realFilename);
		}
		
		return file.getSize() > 0 && !filename.equals("") ? result : null;
	}
	
	
	@RequestMapping("/usersProfileUpdate")
	public String otherDropdownView(UsersVo usersVo, MultipartHttpServletRequest file, HttpServletRequest req) {
		String[] file_name = req.getParameterValues("file_name");
		String[] file_path = req.getParameterValues("file_path");
		MultipartFile backgroundFile = file.getFile("backgroundFile");
		MultipartFile profileFile = file.getFile("profileFile");
		List<MultipartFile> fileList = file.getFiles("filesVo");
		
		HashMap<String, String> result = new HashMap<String, String>();
		List<FilesVo> filesVoList = new ArrayList<FilesVo>();
		
		FilesVo delfilesVo = new FilesVo();
		delfilesVo.setDivision("43");
		delfilesVo.setRef_code(usersVo.getUser_id());
		filesService.delete_allFile(delfilesVo);
		
		
		result = fileUpload(backgroundFile,req);
		if (result != null){
			usersVo.setBg_img(result.get("filename"));
			usersVo.setBg_path(result.get("realFilename"));
		}
		
		result = fileUpload(profileFile,req);
		if (result != null){
			usersVo.setProfile_img(result.get("filename"));
			usersVo.setProfile_path(result.get("realFilename"));
		}
		
		if(file_name != null) {
			for(int i = 0; i < file_name.length; i++) {
				FilesVo filesVo = new FilesVo();
				filesVo.setRef_code(usersVo.getUser_id());
				filesVo.setFile_name(file_name[i]);
				filesVo.setFile_path(file_path[i]);
				filesVo.setDivision("43");
				filesVoList.add(filesVo);
			}
		}
		
		for(MultipartFile part : fileList){
			result = fileUpload(part,req);
			
			if (result != null){
				FilesVo filesVo = new FilesVo();
				filesVo.setRef_code(usersVo.getUser_id());
				filesVo.setFile_name(result.get("filename"));
				filesVo.setFile_path(result.get("realFilename"));
				filesVo.setDivision("43");
				filesVoList.add(filesVo);
			}
		}
		
		usersService.update_userInfo(usersVo);
		
		for (FilesVo filesVo:filesVoList) {
			filesService.insert_usersFile(filesVo);
		}
		
		return "redirect:/profileHome";
	}
}

