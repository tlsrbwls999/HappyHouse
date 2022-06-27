package com.ssafy.happyhouse.model.mapper;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssafy.happyhouse.model.dto.NewsDto;

public interface NewsMapper {
	public void insertNews(@Param("title") String title, @Param("date") int date, @Param("url") String url) throws IOException;
	public List<NewsDto>selectNews();
}
