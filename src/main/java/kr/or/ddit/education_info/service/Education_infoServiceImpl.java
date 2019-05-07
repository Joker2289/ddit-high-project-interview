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
		Map<String, Object> education_infoMap = new HashMap<String, Object>();
		List<List<FilesVo>> education_infoFileVoList = new ArrayList<List<FilesVo>>(); 
		List<Education_infoVo> education_infoVoList = educationDao.select_educationInfo(user_id);
		
		for(Education_infoVo  education_infoVo : education_infoVoList ){
			FilesVo filesVo = new FilesVo();
			filesVo.setRef_code(education_infoVo.getEducation_code());
			filesVo.setDivision("12");
			List<FilesVo> filesVoList = filesDao.select_file(filesVo);
			education_infoFileVoList.add(filesVoList);
			
		}
		
		education_infoMap.put("education_infoVoList", education_infoVoList);
		education_infoMap.put("education_infoFileVoList", education_infoFileVoList);
		
		return education_infoMap;
	}
	
	/**
	 * Method : select_oneEducationInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param education_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 학력정보 조회
	 */
	@Override
	public Map<String, Object> select_oneEducationInfo(String education_code) {
		Map<String, Object> educationInfoMap = new HashMap<String, Object>();
		Education_infoVo education_infoVo = educationDao.select_oneEducationInfo(education_code);
		
		FilesVo filesVo = new FilesVo();
		filesVo.setRef_code(education_infoVo.getEducation_code());
		filesVo.setDivision("12");
		List<FilesVo> filesVoList = filesDao.select_file(filesVo);
	
		educationInfoMap.put("education_infoVo", education_infoVo);
		educationInfoMap.put("filesVoList", filesVoList);
		return educationInfoMap;
	}
	
	/**
	 * Method : update_educationInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param education_infoVo
	 * @return
	 * Method 설명 : 사용자의 학력정보 업데이트
	 */
	@Override
	public int update_educationInfo(Education_infoVo education_infoVo) {
		return educationDao.update_educationInfo(education_infoVo);
	}
	
	/**
	 * Method : delete_educationInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param education_code
	 * @return
	 * Method 설명 : 사용자의 학력정보 삭제
	 */
	@Override
	public int delete_educationInfo(String education_code) {
		return educationDao.delete_educationInfo(education_code);
	}

	/**
	 * 
	 * Method : getLastEdu
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 특정 유저의 마지막 학력정보 조회.
	 */
	@Override
	public Education_infoVo getLastEdu(String user_id) {
		Education_infoVo eVo = educationDao.getLastEdu(user_id);
		
		return eVo;
	}

}
