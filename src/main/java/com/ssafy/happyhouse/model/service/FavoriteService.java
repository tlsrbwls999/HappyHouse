package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.FavoriteDto;
import com.ssafy.happyhouse.model.dto.HouseInfoDto;
import com.ssafy.happyhouse.model.dto.MemberDto;


public interface FavoriteService {
	
	void insertFavorite(FavoriteDto favoriteDto) throws Exception; //좋아요 누름
	void deleteFavorite(FavoriteDto favoriteDto) throws Exception;//좋아요 해제 
	List<FavoriteDto> getFavorite(String id) throws Exception;
}
