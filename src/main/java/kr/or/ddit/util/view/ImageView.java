package kr.or.ddit.util.view;

import java.io.File;
import java.io.FileInputStream;
import java.util.Map;


import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.View;

public class ImageView implements View{
	
	//getContentType : view를 통한 결과물이 html이냐 이미지냐??
	@Override
	public String getContentType() {
		return "image";
	}
	
	//render : 화면을 그리는 응답을 만들어 내는 부분
	//가정 : 이 view를 사용하는 개발자는 유저 아이디를 model 객체에 userId라는 속성으로 설정한다
	@Override
	public void render(Map<String, ?> model, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		//파일로 다운로드
		//resp.setHeader("Content-Disposition", "attachment; filename=profile.png"); 
		
		//파일로 다운로드 and 이미지 출력도됨
		//resp.setContentType("application/octet-stream");
		
		//OS나 브라우저에 따라 화면이 이상하게 출력 될수 있으므로 
		resp.setContentType("image");
		
		String realFileName = (String) model.get("src");
		
		
		FileInputStream fis;
		if(realFileName != null ) {
			fis = new FileInputStream(new File(realFileName));
		}
		
		else {
			//application
			ServletContext application = req.getServletContext();
			String noimgPath = application.getRealPath("/upload/noimg2.png");
			fis = new FileInputStream(new File(noimgPath));
		}
		
		
		ServletOutputStream sos = resp.getOutputStream();
		
		byte[] buff = new byte[512];
		int len = 0; 
		while((len = fis.read(buff)) > -1) {
			sos.write(buff);
		}
		sos.close();
		fis.close();
		
	}

}
