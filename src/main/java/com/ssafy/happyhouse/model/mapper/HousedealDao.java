package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.Housedeal;
import com.ssafy.happyhouse.model.dto.PageBean;

@Mapper
public interface HousedealDao {
	public Housedeal search(int no) throws SQLException;
	public List<Housedeal> searchAll(PageBean bean) throws SQLException;
	public List<Housedeal> searchbyName(String aptName) throws SQLException;
	public List<Housedeal> searchbyAddress(String dongName) throws SQLException;
	public void add(Housedeal housedeal)	 throws SQLException;
	public void update(Housedeal housedeal)throws SQLException;
	public void remove(int no)    throws SQLException;
	public int count(PageBean bean);
}












