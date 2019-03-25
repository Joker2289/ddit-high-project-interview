package kr.or.ddit.member.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.member.model.MemberVo;

@Repository("memberDao")
public class MemberDaoImpl implements IMemberDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<MemberVo> select_memberAllList() {
		List<MemberVo> memList = sqlSessionTemplate.selectList("member.select_memberAllList");
		return memList;
	}
	
	@Override
	public int insert_member(MemberVo vo) {
		int insertCnt = sqlSessionTemplate.insert("member.insert_member", vo);
		return insertCnt;
	}

	@Override
	public MemberVo select_memberInfo(String mem_id) {
		return sqlSessionTemplate.selectOne("member.select_memberInfo", mem_id);
	}

	@Override
	public int delete_member(String mem_id) {
		int deleteCnt = sqlSessionTemplate.delete("member.delete_member", mem_id);
		return deleteCnt;
	}
	
	
	
}
