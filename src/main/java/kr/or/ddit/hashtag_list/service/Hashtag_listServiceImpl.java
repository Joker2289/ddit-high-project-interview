package kr.or.ddit.hashtag_list.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.hashtag_list.dao.IHashtag_listDao;
import kr.or.ddit.hashtag_list.model.Hashtag_listVo;

@Service("hashtag_listService")
public class Hashtag_listServiceImpl implements IHashtag_listService {

	@Resource(name="hashtag_listDao")
	private IHashtag_listDao hashtag_listDao;

	@Override
	public int insert_hashtaglist(Hashtag_listVo taglistVo) {
		return hashtag_listDao.insert_hashtaglist(taglistVo);
	}

	@Override
	public int update_hashtaglist(Hashtag_listVo taglistVo) {
		return hashtag_listDao.update_hashtaglist(taglistVo);
	}

	@Override
	public int delete_hashtaglist(String taglist_code) {
		return hashtag_listDao.delete_hashtaglist(taglist_code);
	}

	@Override
	public List<Hashtag_listVo> select_hashtaglist(Hashtag_listVo taglistVo) {
		return hashtag_listDao.select_hashtaglist(taglistVo);
	}
	
	
	
}
