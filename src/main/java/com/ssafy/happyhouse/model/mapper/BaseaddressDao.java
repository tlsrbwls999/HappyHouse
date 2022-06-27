package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.Baseaddress;

@Mapper
public interface BaseaddressDao {
	public List<Baseaddress> searchAll( ) throws SQLException;
}
