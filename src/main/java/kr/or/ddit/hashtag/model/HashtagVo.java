package kr.or.ddit.hashtag.model;

public class HashtagVo {
	
	private String hashtag_name; // 해시태그명
	
	public HashtagVo() {
		
	}

	public String getHashtag_name() {
		return hashtag_name;
	}

	public void setHashtag_name(String hashtag_name) {
		this.hashtag_name = hashtag_name;
	}

	@Override
	public String toString() {
		return "HashtagVo [hashtag_name=" + hashtag_name + "]";
	}
}
