package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DashboardMapper {

	int getAllAver() throws SQLException;
	List<Map<String, Object>> getAverChange() throws SQLException;
	List<Map<String, Object>> getAverGugun() throws SQLException;
	List<Map<String, Object>> getRankAver() throws SQLException;
	List<Map<String, Object>> getRankArea() throws SQLException;

}
