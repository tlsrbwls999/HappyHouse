package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.dto.PageBean;
import com.ssafy.happyhouse.model.service.DashboardService;

@Controller
@RequestMapping("dashboard")
@CrossOrigin(origins = {"*"}, maxAge = 6000)
public class DashboardController {
	
	private final Logger logger = LoggerFactory.getLogger(DashboardController.class);
	
	// 서비스 자동 주입
	@Autowired
	private DashboardService dashboardService;
	
	// ExceptionHandler

	// Mapping
	@RequestMapping("")
	private String dashboard(PageBean bean, Model model) throws SQLException {
		
		List<Map<String, Object>> modeldata;
		
		// 현재 서울 평균 집값
		model.addAttribute("allaver", dashboardService.getAllAver());	
		
		// 서울 평균 집값 추이
		List<Double> averchange = new ArrayList<>();
		modeldata = dashboardService.getAverChange();
		for (Map<String, Object> d : modeldata) {
			averchange.add(Double.parseDouble(String.valueOf(d.get("dealValue"))));
		}
		model.addAttribute("averchange", averchange);
		
		// 구군별 집값
		List<String> avergugun_key = new ArrayList<>();
		List<Double> avergugun_data = new ArrayList<>();
		modeldata = dashboardService.getAverGugun();
		for (Map<String, Object> d : modeldata) {
			avergugun_key.add((String) "'"+d.get("gugunName")+"'");
			avergugun_data.add(Double.parseDouble(String.valueOf(d.get("dealvalue"))));
		}
		System.out.println(avergugun_key.size());
		System.out.println(avergugun_data.size());
		model.addAttribute("avergugun_key", avergugun_key);
		model.addAttribute("avergugun_data", avergugun_data);
		
		// 평균 집값이 높은 지역 순위
		List<String> rankaver_key = new ArrayList<>();
		List<String> rankaver_code = new ArrayList<>();
		List<Double> rankaver_data = new ArrayList<>();
		modeldata = dashboardService.getRankAver();
		for (Map<String, Object> d : modeldata) {
			rankaver_key.add((String) "'"+d.get("dongName")+"'");
			rankaver_code.add((String) "'"+d.get("dong")+"'");
			rankaver_data.add(Double.parseDouble(String.valueOf(d.get("dealValue"))));
//			System.out.println(d);
		}
		model.addAttribute("rankaver_key", rankaver_key);
		model.addAttribute("rankaver_code", rankaver_code);
		model.addAttribute("rankaver_data", rankaver_data);
		
		// 면적 대비 집값이 높은 지역 순위
		List<String> rankarea_key = new ArrayList<>();
		List<String> rankarea_code = new ArrayList<>();
		List<Double> rankarea_data = new ArrayList<>();
		modeldata = dashboardService.getRankArea();
		for (Map<String, Object> d : modeldata) {
			rankarea_key.add((String) "'"+d.get("dongName")+"'");
			rankarea_code.add((String) "'"+d.get("dongCode")+"'");
			rankarea_data.add(Double.parseDouble(String.valueOf(d.get("dataValue"))));
		}
		model.addAttribute("rankarea_key", rankarea_key);
		model.addAttribute("rankarea_code", rankarea_code);
		model.addAttribute("rankarea_data", rankarea_data);
		
		return "dashboard";
	}

}
