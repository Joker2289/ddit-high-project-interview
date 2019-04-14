package kr.or.ddit.education_info.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.education_info.dao.IEducation_infoDao;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.files.dao.IFilesDao;
import kr.or.ddit.files.model.FilesVo;

@Service("education_infoService")
public class Education_infoServiceImpl implements IEducation_infoService{

	@Resource(name="education_infoDao")
	private IEducation_infoDao educationDao;
	
	@Resource(name="filesDao")
	private IFilesDao filesDao;
	
	@Override
	public int insert_education_info(Education_infoVo vo) {
		return educationDao.insert_education_info(vo);
	}

	/**
	 * Method : select_educationInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자 학력 조회
	 */ 
	@Override
	public Map<String, Object> select_educationInfo(String user_id) {
		Map<String, Object> education_infoList = new HashMap<String, Object>();
		List<List<FilesVo>> education_infoFileVoList = new ArrayList<List<FilesVo>>(); 
		List<Education_infoVo> education_infoVoList = educationDao.select_educationInfo(user_id);
		
		for(Education_infoVo  education_infoVo : education_infoVoList ){
			FilesVo filesVo = new FilesVo();
			filesVo.setRef_code(education_infoVo.getEducation_code());
			filesVo.setDivision("12");
			List<FilesVo> filesVoList = filesDao.select_file(filesVo);
			education_infoFileVoList.add(filesVoList);
			
		}
		
		education_infoList.put("education_infoVoList", education_infoVoList);
		education_infoList.put("education_infoFileVoList", education_infoFileVoList);
		
		return education_infoList;
	}

}
