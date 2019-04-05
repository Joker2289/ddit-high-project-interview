package kr.or.ddit.files.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.education_info.dao.IEducation_infoDao;
import kr.or.ddit.files.dao.IFilesDao;
import kr.or.ddit.files.model.FilesVo;

@Service("filesService")
public class FilesServiceImpl implements IFilesService{
	
	@Resource(name="filesDao")
	private IFilesDao filesDao;

	/**
	 * Method : select_usersFile
	 * 작성자 : jin
	 * 변경이력 :
	 * @param filesVo
	 * @return
	 * Method 설명 : users 첨부파일 조회
	 */
	@Override
	public List<FilesVo> select_usersFile(FilesVo filesVo) {
		return filesDao.select_usersFile(filesVo);
	}
	
	/**
	 * Method : select_oneFile
	 * 작성자 : jin
	 * 변경이력 :
	 * @param file_code
	 * @return
	 * Method 설명 : 하나의 첨부파일 조회
	 */
	@Override
	public FilesVo select_oneFile(String file_code) {
		return filesDao.select_oneFile(file_code);
	}

	/**
	 * Method : insert_usersFile
	 * 작성자 : jin
	 * 변경이력 :
	 * @param filesVo
	 * @return
	 * Method 설명 : 파일 첨부 생성
	 */
	@Override
	public int insert_usersFile(FilesVo filesVo) {
		return filesDao.insert_usersFile(filesVo);
	}
	
	/**
	 * Method : delete_allFile
	 * 작성자 : jin
	 * 변경이력 :
	 * @param filesVo
	 * @return
	 * Method 설명 : 구분코드에 해당하는 참조코드명 전체 파일 삭제
	 */
	@Override
	public int delete_allFile(FilesVo filesVo) {
		return filesDao.delete_allFile(filesVo);
	}
}
