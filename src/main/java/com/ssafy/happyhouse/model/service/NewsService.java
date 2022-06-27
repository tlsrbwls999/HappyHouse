package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.NewsDto;

public interface NewsService {
	public void insertNews() throws Exception;
	public List<NewsDto>retrieveNews();
}
