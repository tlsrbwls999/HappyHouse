package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.FavoriteDto;
import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.mapper.FavoriteMapper;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	
	@Autowired
	private FavoriteMapper favoriteMapper;
	
	@Override
	public void insertFavorite(FavoriteDto favoriteDto) throws Exception {
		favoriteMapper.insertFavorite(favoriteDto);
	}

	@Override
	public void deleteFavorite(FavoriteDto favoriteDto) throws Exception {
		
	}

	@Override
	public List<FavoriteDto> getFavorite(String id) throws Exception {
		return favoriteMapper.listFavorite(id);
	}

}
