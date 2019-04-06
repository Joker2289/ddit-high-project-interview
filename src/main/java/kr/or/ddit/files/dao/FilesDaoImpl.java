package kr.or.ddit.files.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.files.model.FilesVo;

@Repository("filesDao")
public class FilesDaoImpl implements IFilesDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
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
		return sqlSessionTemplate.selectList("files.select_usersFile", filesVo);
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
		return sqlSessionTemplate.selectOne("files.select_oneFile", file_code);
	}

	/**
	 * Method : insert_usersFile
	 * 작성자 : jin
	 * 변경이력 :
	 * @param filesVo
	 * @return
	 * Method 설명 : 첨부파일 생성
	 */
	@Override
	public int insert_usersFile(FilesVo filesVo) {
		return sqlSessionTemplate.insert("files.insert_file", filesVo);
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
		
		return sqlSessionTemplate.delete("files.delete_allFile", filesVo);
	}

}
