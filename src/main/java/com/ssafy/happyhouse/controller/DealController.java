package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.model.dto.DealException;
import com.ssafy.happyhouse.model.dto.FavoriteDto;
import com.ssafy.happyhouse.model.dto.HouseInfoDto;
import com.ssafy.happyhouse.model.dto.MemberDto;
import com.ssafy.happyhouse.model.dto.PageBean;
import com.ssafy.happyhouse.model.dto.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.service.DealService;
import com.ssafy.happyhouse.model.service.HouseMapService;
import com.ssafy.happyhouse.model.service.FavoriteService;


@Controller
@RequestMapping("/deal")
@CrossOrigin(origins = {"*"}, maxAge = 6000)
public class DealController {
	
	private final Logger logger = LoggerFactory.getLogger(DealController.class);
	
	// 서비스 자동 주입
	@Autowired
	private DealService dealservice;

	@Autowired
	private FavoriteService favoriteService;
	
	@Autowired
	private HouseMapService haHouseMapService;
	
	// ExceptionHandler
	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView mav = new ModelAndView("Error");
		
		if(e instanceof DealException) {
			mav.addObject("msg", e.getMessage());
		} else {
			mav.addObject("msg", "거래 정보 처리 중 오류 발생");
		}
		return mav;		
	}

	// Mapping
	@GetMapping("/search_apt")
	public void list(PageBean bean, Model model) {
		model.addAttribute("search_apt", dealservice.searchAll(bean));
	}
	
	// Map
	@GetMapping("/sido")
	public ResponseEntity<List<SidoGugunCodeDto>> sido() throws Exception {
		logger.debug("sido : {}", haHouseMapService.getSido());
		return new ResponseEntity<List<SidoGugunCodeDto>>(haHouseMapService.getSido(), HttpStatus.OK);
	}
	
	@GetMapping("/gugun")
	public ResponseEntity<List<SidoGugunCodeDto>> gugun(@RequestParam("sido") String sido) throws Exception {
		return new ResponseEntity<List<SidoGugunCodeDto>>(haHouseMapService.getGugunInSido(sido), HttpStatus.OK);
	}
	
	@GetMapping("/dong")
	public ResponseEntity<List<HouseInfoDto>> dong(@RequestParam("gugun") String gugun) throws Exception {
		return new ResponseEntity<List<HouseInfoDto>>(haHouseMapService.getDongInGugun(gugun), HttpStatus.OK);
	}
	
	@GetMapping("/apt")
	public ResponseEntity<List<HouseInfoDto>> apt(@RequestParam("dong") String dong) throws Exception {
		return new ResponseEntity<List<HouseInfoDto>>(haHouseMapService.getAptInDong(dong), HttpStatus.OK);
	}
	
	@GetMapping("/aptname")
	public ResponseEntity<List<HouseInfoDto>> aptname(@RequestParam("aptname") String aptname) throws Exception {
		return new ResponseEntity<List<HouseInfoDto>>(haHouseMapService.getAptByName(aptname), HttpStatus.OK);
	}

	@PostMapping("/favorite")
	public ResponseEntity<List<FavoriteDto>> favorite(FavoriteDto favoriteDto,Model model, HttpSession session) throws Exception {
		MemberDto memberDto=(MemberDto) session.getAttribute("userInfo");
		favoriteDto.setId(memberDto.getId());
		favoriteService.insertFavorite(favoriteDto);
		return new ResponseEntity<List<FavoriteDto>>(favoriteService.getFavorite(memberDto.getId()),HttpStatus.OK);
	}
}
