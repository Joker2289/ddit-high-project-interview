package kr.or.ddit.mail.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.chat_contents.model.Chat_contentsVo;
import kr.or.ddit.chat_contents.service.IChat_contentsService;
import kr.or.ddit.chat_member.model.Chat_memberVo;
import kr.or.ddit.chat_member.service.IChat_memberService;
import kr.or.ddit.chatroom.model.ChatroomVo;
import kr.or.ddit.chatroom.service.IChatroomService;
import kr.or.ddit.corporation.model.CorporationVo;
import kr.or.ddit.corporation.service.ICorporationService;
import kr.or.ddit.files.model.FilesVo;
import kr.or.ddit.files.service.IFilesService;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.personal_connection.service.IPersonal_connectionService;
import kr.or.ddit.recruit.model.RecruitVo;
import kr.or.ddit.recruit.service.IRecruitService;
import kr.or.ddit.users.model.UsersVo;

@Controller
public class MailController{
	
	private Logger logger = LoggerFactory.getLogger(MailController.class);
	
	@Resource(name="personalService")
	IPersonal_connectionService personalService;
	
	@Resource(name="chatroomService")
	IChatroomService chatroomService;
	
	@Resource(name="chat_memberService")
	IChat_memberService chat_memberService;
	
	@Resource(name="chat_contentsService")
	IChat_contentsService chat_contentsService;
	
	@Resource(name="recruitService")
	private IRecruitService recrService;
	
	@Resource(name="corporationService")
	private ICorporationService corpService;
	
	@Resource(name="filesService")
	private IFilesService filesService;

	@RequestMapping(path={"/mailHome"})
	public String mailHomeView(Model model, HttpServletRequest req, Chat_contentsVo chat_contentsVo) throws ParseException{
		MemberVo memberVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		List<Map<String, String>> userChatroomsMap = null;
		String chat_code = null;
		
		userChatroomsMap = chatroomService.select_userChatrooms(memberVo.getMem_id());
		
		if(chat_contentsVo.getChat_code() == null){
			if(userChatroomsMap.size() > 0) {
				chat_code = String.valueOf(userChatroomsMap.get(0).get("CHAT_CODE"));
				model.addAttribute("chatContentsVoList",chat_contentsService.select_chatContents(chat_code));
			}
		}else{
			model.addAttribute("chatContentsVoList",chat_contentsService.select_chatContents(chat_contentsVo.getChat_code()));
		}
		
		model.addAttribute("userChatroomsMap",userChatroomsMap);
		
		/////////////////////////////// newList
		
		// 광고 부분 -> 신규 채용공고 (newList)
		List<RecruitVo> newList = recrService.getNewList();
		
		// newList size : 7. index 6 -> index 0에 add.
		newList.add(0, newList.get(6));
		
		List<String> newImgList = new ArrayList<>();
		List<String> newNmList = new ArrayList<>();
		List<String> newTimeList = new ArrayList<>();
		
		for(int i=0; i < newList.size(); i++){
			RecruitVo rVo = newList.get(i);
			CorporationVo cVo = corpService.select_corpInfo(rVo.getCorp_id());
			newImgList.add(cVo.getLogo_path());
			newNmList.add(cVo.getCorp_name());
			
			String start_date = rVo.getStart_date();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd HH:mm");
			Date start = sdf.parse(start_date);
			Date now = new Date();
			
			long temp_time = now.getTime() - start.getTime();
			
			int time_diff = (int) (temp_time / (60*1000));
			
			if(time_diff < 2){
				newTimeList.add("방금");
			}else if(time_diff < 60){
				newTimeList.add(time_diff + "분");
			}else if(time_diff < 1440){
				newTimeList.add(time_diff/60 + "시간");
			}else if(time_diff < 43200){
				newTimeList.add(time_diff/(60*24) + "일");
			}else{
				newTimeList.add(time_diff/(60*24*30) + "달");
			}				
		}		
		
		model.addAttribute("newList", newList);
		model.addAttribute("newImgList", newImgList);
		model.addAttribute("newNmList", newNmList);
		model.addAttribute("newTimeList", newTimeList);
		
		/////////////////////////////// newList		
		
		return "mailTiles";
	}
	
	@RequestMapping(path={"/produceRoomView"})
	public String produceRoomView(HttpSession session, Model model){
		MemberVo memberVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		model.addAttribute("usersVoList",personalService.select_connections(memberVo));
		
		return "/mail/produceRoom";
	}
	
	@RequestMapping(path={"/chatRoomMove"})
	public String chatRoomMove(Model model, String chat_code, HttpServletRequest req){
		req.getSession().setAttribute("chat_code", chat_code);
		
		return "redirect:/mailHome";
	}
	
	@RequestMapping(path={"/serverRecive"})
	public String serverRecive(Model model, String chat_code){
		
		model.addAttribute("chatContentsVoList",chat_contentsService.select_chatContents(chat_code));
		return "/mail/chatContents";
	}
	
	@RequestMapping(path={"/reflashChatRooms"})
	public String reflashChatRooms(Model model,HttpServletRequest req, String chat_code){
		MemberVo memberVo = (MemberVo) req.getSession().getAttribute("SESSION_MEMBERVO");
		List<Map<String, String>> userChatroomsMap = chatroomService.select_userChatrooms(memberVo.getMem_id());
		model.addAttribute("userChatroomsMap",userChatroomsMap);
		model.addAttribute("chat_code",chat_code);
		return "/mail/chatRoom";
	}
	
	@ResponseBody
	@RequestMapping(path={"/insertChatRoom"})
	public String insertChatRoom(HttpSession session, String[] chat_member, String chat_name, String chat_content){
		MemberVo memberVo = (MemberVo) session.getAttribute("SESSION_MEMBERVO");
		
		ChatroomVo chatroomVo = new ChatroomVo(); 
		chatroomVo.setChat_name(chat_name);
		chatroomVo.setMem_id(memberVo.getMem_id());
		
		String chat_code = chatroomService.insert_chatroom(chatroomVo, chat_member,chat_content);
		                          
		return chat_code+"="+chat_content;
	}
	
	@RequestMapping(path={"/deleteChatMember"})
	public String deleteChatMember(Chat_memberVo chat_memberVo){
		
		List<Chat_memberVo> chat_memberVoList = chat_memberService.select_chatMember(chat_memberVo.getChat_code());
		
		if(chat_memberVoList.size() == 1) {
			chatroomService.delete_chatroom(chat_memberVo.getChat_code());
		}else{
			chat_memberService.delete_chatmember(chat_memberVo);
		}
		
		return "redirect:/mailHome";
	}
	
	@ResponseBody
	@RequestMapping(path={"/chatContentSearch"})
	public List<String> chatContentSearch(Chat_contentsVo chat_contentsVo){
		
		List<String> chat_codeVoList = chat_contentsService.select_chatContentsSearch(chat_contentsVo);
		
		return chat_codeVoList;
	}
	
	@ResponseBody
	@RequestMapping(path={"/insertChatcontents"}, consumes = { "multipart/form-data" })
	public String insertChatcontents(@RequestParam(value = "imageFile") MultipartFile imageFile, String type,Chat_contentsVo chat_contentsVo ,HttpServletRequest req){
		String file_path  = UUID.randomUUID().toString(); 
		
		if(type.equals("image")){
			chat_contentsVo.setChat_content(file_path+"▣"+type);
		}else{
			chat_contentsVo.setChat_content(file_path+"▣"+type+"▣"+imageFile.getOriginalFilename());
		}
		chat_contentsService.insert_chatcontets(chat_contentsVo);

		if(imageFile.getSize() > 0) {
			String file_name = imageFile.getOriginalFilename();
			String realFileName =  req.getServletContext().getRealPath("/upload/" + file_path);
			try {
				imageFile.transferTo(new File(realFileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			FilesVo filesVo = new FilesVo(); 
			filesVo.setRef_code(chat_contentsVo.getCurrval());
			filesVo.setDivision("06");
			filesVo.setFile_name(file_name);
			filesVo.setFile_path(file_path);
			
			filesService.insert_usersFile(filesVo);
		}
		return file_path;
	}
	
	@RequestMapping(path= {"/chat_contentsImage"})
	public void chat_contentsImage(HttpServletRequest req, HttpServletResponse resp, String uuid) throws IOException {
		resp.setHeader("content-Disposition", "attachment;"); 
		resp.setContentType("image");
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/upload");
		
		InputStream fis = null;
		String filePath = "";
				
		filePath = path + File.separator + uuid;
		fis = new FileInputStream(new File(filePath));
		
		ServletOutputStream sos = resp.getOutputStream();
		byte[] buff = new byte[512];
		int len = 0;
		while ((len = fis.read(buff)) > -1) {
			sos.write(buff);
		}
		sos.close();
		fis.close();
	}
	
	@RequestMapping(path={"/chatContentsFileDownload"})
	public void chatContentsFileDownload(String content_code, Model model, HttpServletRequest req, HttpServletResponse resp) throws IOException{
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/octet-stream");
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/upload");
		
		FilesVo filesVo = new FilesVo();
		filesVo.setDivision("06");
		filesVo.setRef_code(content_code);
		
		List<FilesVo> filesVoList = filesService.select_file(filesVo);
		
		String realFilename = path + File.separator + filesVoList.get(0).getFile_path();
		
		String docName = new String(filesVoList.get(0).getFile_name().getBytes("UTF-8"), "ISO-8859-1");
		
		FileInputStream fis = new FileInputStream(new File(realFilename));
		resp.setHeader("Content-Disposition", "attachment; filename=\"" + docName + "\"");

		//4.FileInputStream을 response객체의 outputStream 객체에 write
		ServletOutputStream sos = resp.getOutputStream();
		byte[] buff = new byte[512];
		int len = 0;
		while ((len = fis.read(buff)) > -1) {
			sos.write(buff);
		}
		
		sos.close();
		fis.close();
		
	}
	
	
}
