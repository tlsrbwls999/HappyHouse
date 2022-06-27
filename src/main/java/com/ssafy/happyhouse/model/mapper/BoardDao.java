package com.ssafy.happyhouse.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.Board;

@Mapper
public interface BoardDao {
	void regist(Board guestBookDto) throws Exception;
	List<Board> list(Map<String, Object> map) throws Exception;
	int getTotalCount(Map<String, String> map) throws Exception;
	Board getArticle(int no) throws Exception;
	void update(Board board) throws Exception;
	void delete(int no) throws Exception;
}
