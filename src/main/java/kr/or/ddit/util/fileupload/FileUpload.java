package kr.or.ddit.util.fileupload;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	
	static public HashMap<String, String> fileUpload(MultipartFile file, HttpServletRequest req){
		HashMap<String, String> result = new HashMap<String, String>();
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/upload");
		String filename = file.getOriginalFilename();
		
		if (file.getSize() > 0 && !filename.equals("")) {
			int pos = filename.lastIndexOf( "." );
			String ext = filename.substring( pos + 1 );
			String uuidFilename = UUID.randomUUID().toString();
			String realFilename = path + File.separator + uuidFilename;
			try {
				file.transferTo(new File(realFilename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			result.put("filename", filename);
			result.put("realFilename", uuidFilename);
		}
		
		return file.getSize() > 0 && !filename.equals("") ? result : null;
	}
}
