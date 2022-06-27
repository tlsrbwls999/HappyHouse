package com.ssafy.happyhouse.model.service;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.NewsDto;
import com.ssafy.happyhouse.model.mapper.NewsMapper;

@Service
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	private NewsMapper newsMapper;

	@Override
	public void insertNews() throws Exception {
		String url="https://land.naver.com/news/";
		
		Document doc=Jsoup.connect(url).get();
		
		
		Elements span=doc.select("div.group2>ul.list>li");
		
		Elements total_url=doc.select("div.group2>ul.list>li>span.title>a");
		Elements total_url1=doc.select("div.group2>ul.list2>li>span.title>a");
		
		
		ArrayList<String>urlList=new ArrayList<String>();
		
		for (Element e:total_url) {
			String s=e.attr("href");
			urlList.add(s);
		}
		
		for (Element e:total_url1) {
			String s1=e.attr("href");
			urlList.add(s1);
		}
		
		for(int j=0;j<span.size();j++) {
			int len=span.get(j).text().length();
			String title=span.get(j).text().substring(0,len-11);
			String str=span.get(j).text().substring(len-10,len).replace(".", "");
			str=str.trim();
			int date=Integer.parseInt(str);
			String url1=urlList.get(j);
			newsMapper.insertNews(title, date,url1);
		}
		
		
		Elements span1=doc.select("div.group2>ul.list2>li");
		
		for(int j=0;j<span1.size();j++) {
			int len1=span1.get(j).text().length();
			String title1=span1.get(j).text().substring(0,len1-11);
			String str1=span1.get(j).text().substring(len1-10,len1).replace(".", "");
			str1=str1.trim();
			int date1=Integer.parseInt(str1);
			String url2=urlList.get(j);
			newsMapper.insertNews(title1, date1,url2);
		}
	}

	@Override
	public List<NewsDto> retrieveNews() {
		return newsMapper.selectNews();
	}
	

}
