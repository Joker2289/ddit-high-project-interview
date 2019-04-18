package kr.or.ddit.post.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

public class RegExpTest {
	private static final Logger logger = LoggerFactory.getLogger(RegExpTest.class);

	@Test
	public void 특정문자열제외test() {
		/***given***/
		String hashtag = "#test";
		
		String str = "#test <a src='test'>#test</a> #test test";
//		Pattern p = Pattern.compile("(#test)[^/<a>]");		//(#test)[^\\/<a>]
		Pattern p = Pattern.compile("(" + hashtag + ")[^/<a>]");		//(#test)[^\\/<a>]

		/***when***/
		Matcher m = p.matcher(str);
		List<String> matchedStringList = new ArrayList<String>();
		while(m.find()) {
			
			logger.debug("m.find() : {}", m.group().trim());
			matchedStringList.add(m.group());
		}
		logger.debug("matchStringList : {}" , matchedStringList);
		
		logger.debug("before str : {}", str);
		
		for(String matchedStrg : matchedStringList) 
			str = str.replaceAll(matchedStrg, "<a src='test'>" + hashtag +"</a>");
		logger.debug("after str : {}", str);
		
		/***then***/
		
	}

	public String hashtag_replace(String str){
		
		str = StringUtils.replace(str, "-_+=!@#$%^&*()[]{}|\\;:'\"<>,.?/~`） ","");
		
		if(str.length() < 1){
			return null;
		}
		
		return str;
	}
		
	@Test
	public void converttest() {
		
		String str = "<p>#test <a href='/hashtag/test'>#test</a> #기모띠 test</p><p><img src='/qweasd'></p>";
		Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
		Matcher m = p.matcher(str);
		
		String hashtag = "";
		List<String> matchedStringList = new ArrayList<String>();
//		List<String> tagList = new ArrayList<String>();
		
		while(m.find()){
			hashtag = hashtag_replace(m.group());
			
			if(hashtag != null){
				logger.debug("추출된 해시태그 : {}", hashtag);
//				tagList.add(hashtag);
				matchedStringList.add(hashtag);
			}
		}
		
		
		
		Pattern replacePattern = Pattern.compile("(#test)[^/<a>]");		//(#test)[^\\/<a>]
		Matcher replaceMatcher = replacePattern.matcher(str);
		
		
		while(m.find()) {
			logger.debug("replaceMatcher.find() : {}", replaceMatcher.group().trim());
			matchedStringList.add(replaceMatcher.group());
		}
		
		logger.debug("matchStringList : {}" , matchedStringList);
		logger.debug("before str : {}", str);
		
		for(String matchedStrg : matchedStringList) 
			str = str.replaceAll(matchedStrg, "<a href='/hashtag/" + hashtag.split("#")[1] +"'>" + hashtag +"</a>");
		logger.debug("after str : {}", str);
		
	}

	@Test
	public void replaceTest(){
		
		String str = "<p>#test <a href='/hashtag/test'>#test</a> #기모띠 test</p><p><img src='/qweasd'></p>";
		Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣]*)");
		Matcher m = p.matcher(str);
		
		String hashtag = "";
		List<String> matchedStringList = new ArrayList<String>();
		
		while(m.find()){
			
			hashtag = hashtag_replace(m.group());
			
			if(hashtag != null){
				logger.debug("추출된 해시태그 : {}", hashtag);
				matchedStringList.add(hashtag);
			}
		}
		
	}
	
}
