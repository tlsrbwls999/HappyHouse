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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.Board;
import com.ssafy.happyhouse.model.dto.NewsDto;
import com.ssafy.happyhouse.model.service.NewsService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
@RequestMapping("/news")
public class NewsController {
	
	private static final Logger logger = LoggerFactory.getLogger(NewsController.class); 
	
	@Autowired
	private NewsService newsService;
	
	@GetMapping
	public ResponseEntity<List<NewsDto>> news() throws Exception{
		logger.debug("진입");
		newsService.insertNews(); //전부 다 sql에 추가 
		// 여기서 리스트 값을 가지고 반환해준다 
		return new ResponseEntity<List<NewsDto>>(newsService.retrieveNews(), HttpStatus.OK);
	}
	
}
