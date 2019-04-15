package kr.or.ddit.post.service;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RegExpTest {
	private static final Logger logger = LoggerFactory.getLogger(RegExpTest.class);

	@Test
	public void 특정문자열제외test() {
		/***given***/
		String hashtag = "#test";
		String str = "#test <a src='test'>#test</a> #test test";
		Pattern p = Pattern.compile("(#test)[^/<a>]");		//(#test)[^\\/<a>]

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

}
