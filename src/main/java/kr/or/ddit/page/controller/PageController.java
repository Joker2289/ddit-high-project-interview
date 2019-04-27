package kr.or.ddit.page.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
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
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.page.model.PageVo;
import kr.or.ddit.page.model.Page_sourceVo;
import kr.or.ddit.page.model.Page_videoVo;
import kr.or.ddit.page.service.IPageService;
import kr.or.ddit.page.service.IPage_sourceService;
import kr.or.ddit.page.service.IPage_videoService;
import kr.or.ddit.portfolio.model.PortfolioVo;
import kr.or.ddit.portfolio.service.IPortfolioService;
import kr.or.ddit.section.model.SectionVo;
import kr.or.ddit.section.service.ISectionService;

@RequestMapping("/page")
@Controller
public class PageController {

	private Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource(name="portfolioService")
	private IPortfolioService portfolioService;
	
	@Resource(name="sectionService")
	private ISectionService sectionService;
	
	@Resource(name="pageService")
	private IPageService pageService;
	
	@Resource(name="page_sourceService")
	private IPage_sourceService sourceService;
	
	@Resource(name="page_videoService")
	private IPage_videoService videoService;
	
	/**
	 * 
	 * Method : onenoteView 
	 * 작성자 : pjk 
	 * 변경이력 : Method 
	 * 설명 : 페이지 작성 화면 요청
	 * @return
	 */
	@RequestMapping(path = "/onenote", method = RequestMethod.GET)
	public String onenoteView(HttpServletRequest req, Model model, @RequestParam("section_code") String section_code) {

		model.addAttribute("section_code", section_code);

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
		String tmpFileName = "";

		// 이미지를 업로드 한경우 //spring 프로젝트에 ProfileImgView
		if (imageStorage.getSize() > 0) {
			String fileName = imageStorage.getOriginalFilename();

			tmpFileName = UUID.randomUUID().toString();

			realFileName = req.getServletContext().getRealPath("/images/onenote/" + tmpFileName);
			imageStorage.transferTo(new File(realFileName));

			// returnFileName = "/images/onenote/" + tmpFileName;

			logger.debug("fileName : {}", fileName);
			logger.debug("realFileName : {}", realFileName);
		}

		return tmpFileName;
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
	 * Method : saveThumnail
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param req
	 * @return
	 * @throws Exception
	 * Method 설명 : 스테이지 썸네일 사버 저장
	 */
	@RequestMapping(value="/saveThumbnail")
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
			stream = new FileOutputStream(application.getRealPath("/images/onenote/"+fileName));
			stream.write(file);
			stream.close();
			
		} catch (Exception e) {
			return fileName;
		
		} finally {
			stream.close();
		}
		
		return fileName;
	}
	
	/**
	 * 
	 * Method : savePage
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param pVo
	 * @param model
	 * @param req
	 * @return
	 * Method 설명 : 페이지 저장
	 */
	@RequestMapping(path = "/savePage", method = RequestMethod.POST)
	public String savePage(PageVo pVo, Model model, HttpServletRequest req) {
		
		//소스코드 저장
		String[] source_contents = req.getParameterValues("source_contents");
		String[] source_mode = req.getParameterValues("source_mode");
		String[] source_theme = req.getParameterValues("source_theme");
		String[] css_top = req.getParameterValues("css_top");
		String[] css_left = req.getParameterValues("css_left");
		
		//비디오 저장
		String[] video_link = req.getParameterValues("video_link");
		String[] video_css_top = req.getParameterValues("video_css_top");
		String[] video_css_left = req.getParameterValues("video_css_left");
		
		
		
		//page 저장
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		pageService.insert_page(pVo);
		
		if(source_contents != null) {
			Page_sourceVo psVo = new Page_sourceVo();
			for(int i=0; i<source_contents.length; i++) {
				psVo.setPage_code(pVo.getPage_code());
				psVo.setSource_contents(source_contents[i]);
				psVo.setSource_mode(source_mode[i]);
				psVo.setSource_theme(source_theme[i]);
				psVo.setCss_left(css_left[i]);
				psVo.setCss_top(css_top[i]);
				
				sourceService.insert_page_source(psVo);
			}
		}
		
		if(video_link != null) {
			Page_videoVo pvVo = new Page_videoVo();
			for(int i=0; i<video_link.length; i++) {
				
				pvVo.setPage_code(pVo.getPage_code());
				pvVo.setVideo_link(video_link[i]);
				pvVo.setVideo_css_left(video_css_left[i]);
				pvVo.setVideo_css_top(video_css_top[i]);
				
				videoService.insert_page_video(pvVo);
			}
		}
		
		
		
		return "redirect:/blog/blogMainView?user_id=" + mVo.getMem_id();
	}
	
	/**
	 * 
	 * Method : onenoteView 
	 * 작성자 : pjk 
	 * 변경이력 : Method 
	 * 설명 : 페이지 작성 화면 요청
	 * @return
	 */
	@RequestMapping(path = "/page_view", method = RequestMethod.GET)
	public String page_view(HttpServletRequest req, Model model, @RequestParam("page_code") String page_code) {

		PageVo pageVo = pageService.select_pageInfo(page_code);
		model.addAttribute("pageVo", pageVo);
		
		List<Page_sourceVo> page_sourceList = sourceService.select_page_source(page_code);
		model.addAttribute("page_sourceList", page_sourceList);
		
		return "onenote/onenote_view";
	}
	
	/**
	 * 
	 * Method : color_menu 
	 * 작성자 : pjk 
	 * 변경이력 :
	 * 
	 * @param model
	 * @return Method 설명 : 컬러 메뉴 페이지 body 출력
	 */
	@RequestMapping("/delete_page")
	public String delete_page(Model model, @RequestParam("page_code") String page_code) {
		
		PageVo pageVo = pageService.select_pageInfo(page_code);
		pageService.delete_page(page_code);
		
		String section_code = pageVo.getSection_code();
		
		SectionVo sVo = sectionService.select_sectionInfo(section_code);
		PortfolioVo pVo = portfolioService.select_portfolioInfo(sVo.getPortfolio_code());
		model.addAttribute("pVo", pVo);
		model.addAttribute("sVo", sVo);
		
		List<PageVo> pageList = pageService.select_pageList(section_code);
		model.addAttribute("pageList", pageList);
		
		return "blog/page_area_select";
	}
	
	/**
	 * 
	 * Method : update_onenote_write
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param model
	 * @param page_code
	 * @return
	 * Method 설명 : 수정 페이지로 이동
	 */
	@RequestMapping(path = "/update_onenote_write", method = RequestMethod.GET)
	public String update_onenote_write(Model model, @RequestParam("page_code") String page_code) {
		
		PageVo pVo = pageService.select_pageInfo(page_code);
		model.addAttribute("pVo", pVo);
		
		List<Page_sourceVo> page_sourceList = sourceService.select_page_source(page_code);
		model.addAttribute("page_sourceList", page_sourceList);
		
		return "onenote/onenote_write";
	}
	
	/**
	 * 
	 * Method : update_page
	 * 작성자 : pjk
	 * 변경이력 :
	 * @param pVo
	 * @param model
	 * @param req
	 * @return
	 * Method 설명 : 페이지 수정
	 */
	@RequestMapping(path = "/update_page", method = RequestMethod.POST)
	public String update_page(PageVo pVo, Model model, HttpServletRequest req) {
		
		String[] source_contents = req.getParameterValues("source_contents");
		String[] source_mode = req.getParameterValues("source_mode");
		String[] source_theme = req.getParameterValues("source_theme");
		String[] css_top = req.getParameterValues("css_top");
		String[] css_left = req.getParameterValues("css_left");
		
		MemberVo mVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		pageService.update_page(pVo);
		
		Page_sourceVo psVo = new Page_sourceVo();
		
		if(source_contents != null) {
			for(int i=0; i<source_contents.length; i++) {
				psVo.setPage_code(pVo.getPage_code());
				psVo.setSource_contents(source_contents[i]);
				psVo.setSource_mode(source_mode[i]);
				psVo.setSource_theme(source_theme[i]);
				psVo.setCss_left(css_left[i]);
				psVo.setCss_top(css_top[i]);
				
				sourceService.insert_page_source(psVo);
			}
		}
		
		return "redirect:/blog/blogMainView?user_id=" + mVo.getMem_id();
	}
	
	
}
