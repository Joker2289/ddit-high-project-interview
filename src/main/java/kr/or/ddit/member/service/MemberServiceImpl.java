package kr.or.ddit.member.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.model.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements IMemberService{

	@Resource(name="memberDao")
	private IMemberDao memberDao; 
	
	@Override
	public int insert_member(MemberVo vo) {
		return memberDao.insert_member(vo);
	}

	@Override
	public List<MemberVo> select_memberAllList() {
		return memberDao.select_memberAllList();
	}

	@Override
	public MemberVo select_memberInfo(String mem_id) {
		return memberDao.select_memberInfo(mem_id);
	}

	@Override
	public int delete_member(String mem_id) {
		return memberDao.delete_member(mem_id);
	}

}
