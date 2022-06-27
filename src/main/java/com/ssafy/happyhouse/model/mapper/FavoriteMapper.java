package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import com.ssafy.happyhouse.model.dto.FavoriteDto;

public interface FavoriteMapper {
	void insertFavorite(FavoriteDto favoriteDto) throws Exception;	//좋아요 추가 
	void deleteFavorite(FavoriteDto favoriteDto) throws Exception;  //좋아요 삭제
	List<FavoriteDto> listFavorite(String id) throws Exception;
}
