package kr.or.ddit.users.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.model.MemberVo;
import kr.or.ddit.test.LogicTestConfig;
import kr.or.ddit.users.model.UsersVo;
import kr.or.ddit.util.encrypt.kisa.sha256.KISA_SHA256;

public class UsersDaoImplTest extends LogicTestConfig{

	private static Logger logger = LoggerFactory.getLogger(UsersDaoImplTest.class);
	
	@Resource(name="usersDao")
	private IUsersDao usersDao;
	
	@Resource(name="memberDao")
	private IMemberDao memberDao;
	
	@After
	public void tearDown() {
		memberDao.delete_member("test");
	}
	
	/**
	 * 
	 * Method : testSelect_userInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * Method 설명 : 특정 유저 조회 테스트
	 */
	@Test
	public void testSelect_userInfo() {
		/***Given***/
		
		/***When***/
		UsersVo uVo = usersDao.select_userInfo("brown");

		/***Then***/
		assertNotNull(uVo);
	}
	
	/**
	 * 
	 * Method : testInsert_users
	 * 작성자 : pjk
	 * 변경이력 :
	 * Method 설명 : 유저 등록 테스트
	 */
	@Test
	public void testInsert_users() {
		/***Given***/
		MemberVo mVo = new MemberVo();
		mVo.setMem_id("test");
		mVo.setMem_division("1");
		mVo.setPass(KISA_SHA256.encrypt("1234"));
		memberDao.insert_member(mVo);
		
		UsersVo uVo = new UsersVo();
		uVo.setUser_id("test");
		/***When***/
		int insertCnt = usersDao.insert_users(uVo);
		
		/***Then***/
		assertEquals(1, insertCnt);
	}
	
	/**
	 * 
	 * Method : testUpdate_userInfo
	 * 작성자 : pjk
	 * 변경이력 :
	 * Method 설명 : 유저 수정 테스트
	 */
	@Test
	public void testUpdate_userInfo() {
		/***Given***/
		MemberVo mVo = new MemberVo();
		mVo.setMem_id("test");
		mVo.setMem_division("1");
		mVo.setPass(KISA_SHA256.encrypt("1234"));
		memberDao.insert_member(mVo);
		
		UsersVo uVo = new UsersVo();
		uVo.setUser_id("test");
		usersDao.insert_users(uVo);
		
		/***When***/
		uVo.setEmail("test");
		int updateCnt = usersDao.update_userInfo(uVo);
		
		/***Then***/
		assertEquals(1, updateCnt);
	}
	
	@Test 
	public void testGoo() {
		
		List<String> hashTagList = new ArrayList<String>();
		hashTagList.add("#test2");
		hashTagList.add("#test");
		hashTagList.add("#test");
		hashTagList.add("#test2");
		hashTagList.add("#test");
		
		String data = "<p>#test2</p><span>#test#test</span><p>#test2#test</p>";
		
		String result = ""; // 가공한 데이터를 담을 변
		
		for(int i=0; i<hashTagList.size(); i++) {
			
			String[] tmp =  data.split(hashTagList.get(i), 2); // List에 담긴 Tag로 자르는데 2번 Limit을 걸어준다
			
			//#test2#test (태그가 붙어나올 경우) : #test2를 자른후 #test로 자르면 배열이 1개만 나옴 
			if(tmp.length == 1) {
				result += "<a href=''>" + hashTagList.get(i) + "</a>";
				data = tmp[0];		//뒤쪽문자열
			} else {
				result += tmp[0]; 	//앞쪽 문자열
				result += "<a href=''>" + hashTagList.get(i) + "</a>";
				data = tmp[1];		//뒤쪽문자열
			}
			
			//마지막회차에서 뒷배열 남은 태그 담아줘야함
			if(i == hashTagList.size() -1) {
				result += tmp[1];
			}
		}
		
		logger.debug("result : {}", result);
		
		assertEquals(result, "<p><a href=''>#test2</a></p><span><a href=''>#test</a><a href=''>#test</a></span><p><a href=''>#test2</a><a href=''>#test</a></p>");
		
		
	}

}
