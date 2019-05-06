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

	@Override
	public String getContentType() {
		return "image";
	}

	@Override
	public void render(Map<String, ?> model, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		resp.setContentType("image");
		
		ServletContext application = req.getServletContext();
		
		String realFileName = (String) model.get("path");
		
		FileInputStream fis;
		if(realFileName != null ) {
			fis = new FileInputStream(new File(application.getRealPath("/upload/"+realFileName)));
		}
		
		else {
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
