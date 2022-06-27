package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface DashboardService {
	int getAllAver() throws SQLException;
	List<Map<String, Object>> getAverChange() throws SQLException;
	List<Map<String, Object>> getAverGugun() throws SQLException;
	List<Map<String, Object>> getRankAver() throws SQLException;
	List<Map<String, Object>> getRankArea() throws SQLException;
}
