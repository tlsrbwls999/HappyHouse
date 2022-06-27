package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.Sidocode;

@Mapper
public interface SidocodeDao {
	public List<Sidocode> searchAll( ) throws SQLException;
}
