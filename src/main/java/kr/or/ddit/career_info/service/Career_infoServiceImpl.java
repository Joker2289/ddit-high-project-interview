package kr.or.ddit.career_info.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.career_info.dao.ICareer_infoDao;
import kr.or.ddit.career_info.model.Career_infoVo;
import kr.or.ddit.education_info.model.Education_infoVo;
import kr.or.ddit.files.dao.IFilesDao;
import kr.or.ddit.files.model.FilesVo;

@Service("career_infoService")
public class Career_infoServiceImpl implements ICareer_infoService{
	
	@Resource(name="career_infoDao")
	private ICareer_infoDao careerDao;
	
	@Resource(name="filesDao")
	private IFilesDao filesDao;

	@Override
	public int insert_career_info(Career_infoVo vo) {
		return careerDao.insert_career_info(vo);
	}

	/**
	 * Method : select_careerInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 사용자의 경력 사항 조회
	 */
	@Override
	public Map<String, Object> select_careerInfo(String user_id) {
		Map<String, Object> career_infoMap = new HashMap<String, Object>();
		List<List<FilesVo>> career_infoFileVoList = new ArrayList<List<FilesVo>>(); 
		List<Career_infoVo> career_infoVoList = careerDao.select_careerInfo(user_id);
		
		for(Career_infoVo  career_infoVo : career_infoVoList ){
			FilesVo filesVo = new FilesVo();
			filesVo.setRef_code(career_infoVo.getCareer_code());
			filesVo.setDivision("05");
			List<FilesVo> filesVoList = filesDao.select_file(filesVo);
			career_infoFileVoList.add(filesVoList);
		}
		
		career_infoMap.put("career_infoVoList", career_infoVoList);
		career_infoMap.put("career_infoFileVoList", career_infoFileVoList);
		
		return career_infoMap;
	}
	
	/**
	 * Method : select_oneCareerInfo
	 * 작성자 : jin
	 * 변경이력 :
	 * @param career_code
	 * @return
	 * Method 설명 : 사용자의 한 건의 경력정보 조회
	 */
	@Override
	public Map<String, Object> select_oneCareerInfo(String career_code) {
		Map<String, Object> career_infoMap = new HashMap<String, Object>();
		Career_infoVo career_infoVo = careerDao.select_oneCareerInfo(career_code);
		
		FilesVo filesVo = new FilesVo();
		filesVo.setRef_code(career_infoVo.getCareer_code());
		filesVo.setDivision("05");
		List<FilesVo> filesVoList = filesDao.select_file(filesVo);
	
		career_infoMap.put("career_infoVo", career_infoVo);
		career_infoMap.put("filesVoList", filesVoList);
		return career_infoMap;
	}

	/**
	 * Method : update_career_info
	 * 작성자 : jin
	 * 변경이력 :
	 * @param career_infoVo
	 * @return
	 * Method 설명 : 사용자의 경력정보 업데이트
	 */
	@Override
	public int update_career_info(Career_infoVo career_infoVo) {
		return careerDao.update_career_info(career_infoVo);
	}
	
	
	@Override
	public int delete_career_info(String career_code) {
		return careerDao.delete_career_info(career_code);
	}
	
	/**
	 * 회사의 직원수
	 */
	@Override
	public int employee_count(String corporate_name) {
		int empCount = careerDao.employee_count(corporate_name);
		return empCount;
	}

	
	/**
	 * 회사 직원의 각대학 count
	 */
	@Override
	public List<Education_infoVo> employee_education_count(String corporate_name) {
		List<Education_infoVo> eec = careerDao.employee_education_count(corporate_name);
		return eec;
	}
	
	/**
	 * 회사 직원의 각대학 count
	 */
	@Override
	public List<Integer> employee_education_count2(String corporate_name) {
		List<Integer> eec = careerDao.employee_education_count2(corporate_name);
		return eec;
	}

	/**
	 * 직원들이름과 대학교
	 */
	@Override
	public Map<String, Object> employee_education(String corporate_name) {
		Map<String, Object> ee = careerDao.employee_education(corporate_name);
		return ee;
	}

	/**
	 * 
	 * Method : getLastCareer
	 * 작성자 : PC19
	 * 변경이력 :
	 * @param user_id
	 * @return
	 * Method 설명 : 특정 유저의 마지막 경력정보 조회.
	 */
	@Override
	public Career_infoVo getLastCareer(String user_id) {
		Career_infoVo cVo = careerDao.getLastCareer(user_id);
		
		return cVo;
	}

	
}
