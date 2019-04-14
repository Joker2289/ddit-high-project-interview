package kr.or.ddit.page.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.login.LoginController;

@RequestMapping("/page")
@Controller
public class PageController {

	private Logger logger = LoggerFactory.getLogger(LoginController.class);

	/**
	 * 
	 * Method : onenoteView 작성자 : pjk 변경이력 :
	 * 
	 * @return Method 설명 : 로그인 화면을 요청
	 */
	@RequestMapping(path = { "/onenote" }, method = RequestMethod.GET)
	public String onenoteView(HttpServletRequest req, Model model) {

		return "onenote/write";
	}

	/**
	 * 
	 * Method : imageUpload 작성자 : pjk 변경이력 :
	 * 
	 * @param imageStorage
	 * @param req
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException           Method 설명 : 업로드 이미지 서버저장
	 */
	@RequestMapping(path="/imageUpload", consumes={"multipart/form-data"})
	@ResponseBody
	public String imageUpload(@RequestParam(value="imageStorage")MultipartFile imageStorage, HttpServletRequest req)
			throws IllegalStateException, IOException {

		logger.debug("imageStorage : {}", imageStorage);

		String realFileName = "";
		String returnFileName = "";
		
		// 이미지를 업로드 한경우
		if (imageStorage.getSize() > 0) {
			String fileName = imageStorage.getOriginalFilename();
			
			String tmpFileName = UUID.randomUUID().toString();
			
			realFileName = req.getServletContext().getRealPath("/images/onenote/" + tmpFileName);
			imageStorage.transferTo(new File(realFileName));
			
			returnFileName = "/images/onenote/" + tmpFileName;

			logger.debug("fileName : {}", fileName);
			logger.debug("realFileName : {}", realFileName);
		}
		return returnFileName;
	}
}
