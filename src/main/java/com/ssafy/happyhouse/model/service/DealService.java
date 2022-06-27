package com.ssafy.happyhouse.model.service;

import java.util.List;
import com.ssafy.happyhouse.model.dto.Housedeal;
import com.ssafy.happyhouse.model.dto.PageBean;

public interface DealService {
	public void				insert(Housedeal notebook);
	public void				update(Housedeal notebook);
	public void				remove(String notecode);
	public Housedeal		search(String notecode);
	public List<Housedeal>	searchAll(PageBean bean);
}
