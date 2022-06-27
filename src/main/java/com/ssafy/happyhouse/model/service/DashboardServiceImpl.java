package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssafy.happyhouse.model.mapper.DashboardMapper;

@Service
public class DashboardServiceImpl implements DashboardService {
	
	@Autowired
	private DashboardMapper dashboardMapper;

	@Override
	public int getAllAver() throws SQLException {
		return dashboardMapper.getAllAver();
	}
	@Override
	public List<Map<String, Object>> getAverChange() throws SQLException {
		List list = dashboardMapper.getAverChange();
		return list;
	}
	@Override
	public List<Map<String, Object>> getAverGugun() throws SQLException {
		List list = dashboardMapper.getAverGugun();
		return list;
	}
	@Override
	public List<Map<String, Object>> getRankAver() throws SQLException {
		List list = dashboardMapper.getRankAver();
		return list;
	}
	@Override
	public List<Map<String, Object>> getRankArea() throws SQLException {
		List list = dashboardMapper.getRankArea();
		return list;
	}

}