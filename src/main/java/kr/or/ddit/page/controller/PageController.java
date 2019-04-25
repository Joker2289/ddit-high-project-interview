package kr.or.ddit.page.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.login.LoginController;

@RequestMapping("/page")
@Controller
public class PageController {

	private Logger logger = LoggerFactory.getLogger(LoginController.class);

	/**
	 * 
	 * Method : onenoteView 작성자 : pjk 변경이력 : Method 설명 : 페이지 작성 화면 요청
	 * 
	 * @return
	 * 
	 */
	@RequestMapping(path = "/onenote", method = RequestMethod.GET)
	public String onenoteView(HttpServletRequest req, Model model, @RequestParam("section_code") String section_code) {

		logger.debug("section_code : {}", section_code);

		return "onenote/onenote_write";
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
	@RequestMapping(path = "/imageUpload", consumes = { "multipart/form-data" })
	@ResponseBody
	public String imageUpload(@RequestParam(value = "imageStorage") MultipartFile imageStorage, HttpServletRequest req)
			throws IllegalStateException, IOException {

		logger.debug("imageStorage : {}", imageStorage);

		String realFileName = "";
		String returnFileName = "";

		// 이미지를 업로드 한경우 //spring 프로젝트에 ProfileImgView
		if (imageStorage.getSize() > 0) {
			String fileName = imageStorage.getOriginalFilename();

			String tmpFileName = UUID.randomUUID().toString();

			realFileName = req.getServletContext().getRealPath("/images/onenote/" + tmpFileName);
			imageStorage.transferTo(new File(realFileName));

			// returnFileName = "/images/onenote/" + tmpFileName;

			logger.debug("fileName : {}", fileName);
			logger.debug("realFileName : {}", realFileName);
		}

		return realFileName;
	}

	/**
	 * 
	 * Method : ImageView 작성자 : pjk 변경이력 :
	 * 
	 * @param src
	 * @param model
	 * @return Method 설명 : model에 이미지경로를 속성으로 저장해주고 servlte-context 에 등록한 imageView
	 *         요청
	 */
	@RequestMapping("/onenoteImageView")
	public String imageView(@RequestParam(name = "src") String src, Model model) {
		model.addAttribute("src", src);
		return "onenoteImageView";
	}

	/**
	 * 
	 * Method : code_modal_body 작성자 : pjk 변경이력 :
	 * 
	 * @param model
	 * @return Method 설명 : 코드작성 페이지 body 출력
	 */
	@RequestMapping("/code_modal_body")
	public String code_modal_body(Model model) {

		return "onenote/code_modal_body";
	}

	/**
	 * 
	 * Method : color_menu 작성자 : pjk 변경이력 :
	 * 
	 * @param model
	 * @return Method 설명 : 컬러 메뉴 페이지 body 출력
	 */
	@RequestMapping("/color_menu")
	public String color_menu(Model model) {

		return "onenote/color_menu";
	}

	/**
	 * 
	 * Method : savePage 작성자 : pjk 변경이력 :
	 * 
	 * @param src
	 * @param model
	 * @return Method 설명 : 페이지 저장
	 */
	@RequestMapping("/savePage")
	public String savePage(@RequestParam(name = "src") String src, Model model) {
		model.addAttribute("src", src);
		return "onenoteImageView";
	}
	
	
	/**
	 * 
	 * Method : saveThumnail
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @return
	 * @throws Exception
	 * Method 설명 : 스테이지 썸네일 사버 저장
	 */
	@RequestMapping(value="/saveThumnail")
	@ResponseBody
	public String saveThumnail(HttpServletRequest req) throws Exception {
		
		String binaryData = req.getParameter("thumnail_data");
		FileOutputStream stream = null;
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		
		String fileName = "";
		
		ServletContext application = req.getServletContext();
		
		
		
		try {
			if (binaryData == null || binaryData == "") {
				throw new Exception();
			}
			binaryData = binaryData.replaceAll("data:image/png;base64,", "");
			
			byte[] file = Base64.decodeBase64(binaryData);
			fileName = UUID.randomUUID().toString();
			
			
			stream = new FileOutputStream(application.getRealPath("/images/onenote/thumnail/"+fileName));
			stream.write(file);
			stream.close();
			
		} catch (Exception e) {
			return fileName;
		
		} finally {
			stream.close();
		}
		
		return fileName;
	}

}
