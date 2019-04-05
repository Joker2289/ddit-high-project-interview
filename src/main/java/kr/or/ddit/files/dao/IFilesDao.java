package kr.or.ddit.files.dao;

import java.util.List;

import kr.or.ddit.files.model.FilesVo;

public interface IFilesDao {

	/**
	 * Method : select_usersfile
	 * 작성자 : jin
	 * 변경이력 :
	 * @param filesVo
	 * @return
	 * Method 설명 : users 첨부파일 조회
	 */
	List<FilesVo> select_usersFile(FilesVo filesVo);
	
	/**
	 * Method : select_oneFile
	 * 작성자 : jin
	 * 변경이력 :
	 * @param file_code
	 * @return
	 * Method 설명 : 하나의 첨부파일 조회
	 */
	FilesVo select_oneFile(String file_code);
	
	/**
	 * Method : insert_usersFile
	 * 작성자 : jin
	 * 변경이력 :
	 * @param filesVo
	 * @return
	 * Method 설명 : 첨부파일 생성
	 */
	int insert_usersFile(FilesVo filesVo);
	
	/**
	 * Method : delete_allFile
	 * 작성자 : jin
	 * 변경이력 :
	 * @param filesVo
	 * @return
	 * Method 설명 : 구분코드에 해당하는 참조코드명 전체 파일 삭제
	 */
	int delete_allFile(FilesVo filesVo);
	
}
