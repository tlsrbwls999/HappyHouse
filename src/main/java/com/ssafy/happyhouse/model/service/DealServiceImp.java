package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.dto.DealException;
import com.ssafy.happyhouse.model.dto.Housedeal;
import com.ssafy.happyhouse.model.dto.PageBean;
import com.ssafy.happyhouse.model.mapper.HousedealDao;
import com.ssafy.happyhouse.util.PageUtility;

@Service
public class DealServiceImp implements DealService {

	@Autowired
	private HousedealDao dao;
	
	@Override
	public void insert(Housedeal notebook) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Housedeal notebook) {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(String notecode) {
		// TODO Auto-generated method stub

	}

	@Override
	public Housedeal search(String notecode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public List<Housedeal> searchAll(PageBean bean) {
//		int cnt = dao.count(bean);
//		try {
//			PageUtility page = new PageUtility(bean.getInterval(), cnt, bean.getPageNo(), "");
//			bean.setPageLink(page.getPageBar());
//		} catch (Exception e) {
//			throw new DealException("페이징 처리 중 오류 발생");
//		}
//		try {
//			return dao.searchAll(bean);
//		} catch (SQLException e) {
//			e.printStackTrace();
//			throw new DealException("페이징 처리 중 오류 발생");
//		}
		return null;
	}

}
