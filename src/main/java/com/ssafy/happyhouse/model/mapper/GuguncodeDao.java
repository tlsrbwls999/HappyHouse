package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.Guguncode;

@Mapper
public interface GuguncodeDao {
	public List<Guguncode> searchAll( ) throws SQLException;
}
