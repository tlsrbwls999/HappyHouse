package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.Dongcode;

@Mapper
public interface DongcodeDao {
	public List<Dongcode> searchAll( ) throws SQLException;
}
