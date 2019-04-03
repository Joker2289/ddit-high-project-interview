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

}
