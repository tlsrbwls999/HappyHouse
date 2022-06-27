package com.ssafy.happyhouse.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.HouseInfoDto;
import com.ssafy.happyhouse.model.dto.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.mapper.HouseMapMapper;

@Service
public class HouseMapServiceImpl implements HouseMapService {
	
	@Autowired
	private HouseMapMapper houseMapMapper;

	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return houseMapMapper.getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugunInSido(String sido) throws Exception {
		return houseMapMapper.getGugunInSido(sido);
	}

	@Override
	public List<HouseInfoDto> getDongInGugun(String gugun) throws Exception {
		return houseMapMapper.getDongInGugun(gugun);
	}

	@Override
	public List<HouseInfoDto> getAptInDong(String dong) throws Exception {
		return houseMapMapper.getAptInDong(dong);
	}

	/*
	@Override
    public List<HouseInfoDto> getAptByName(String aptName) throws Exception {
        List<HouseInfoDto> list = houseMapMapper.getAptAll();
        List<HouseInfoDto>newList=new ArrayList<HouseInfoDto>();
        for(HouseInfoDto info : list) {
        	if(info.getAptName().contains(aptName))
        		newList.add(info);
        }
        return newList;
    }
    */

	@Override
    public List<HouseInfoDto> getAptByName(String aptName) throws Exception {
        List<HouseInfoDto> list = houseMapMapper.getAptAll();
        List<HouseInfoDto>newList=new ArrayList<HouseInfoDto>();

        if(!list.isEmpty()) {
        	
        	// selection sort
        	int min;
            for(int i=0;i<list.size();i++) {
                min = i;
                
                for(int j=i+1;j<list.size();j++) {
                    HouseInfoDto h2=list.get(j);
                    String name2=h2.getAptName();

                    if(list.get(min).getAptName().compareTo(name2)>0) {
                        min = j;
                    }
                    
                }
                
                swap(list, i, min);
            }
        }

        int left=0;
        int right=0;

        // lower bound binary
        int start=0;
        int end=list.size()-1;
	    while(start<end) {
	        int mid=(start+end)/2;
	        if((list.get(mid).getAptName()).compareTo(aptName)>=0){
	            end=mid;
	        }else {
	            start=mid+1;
	        }
	    }
	    
	    left=end;
	    
        // upper bound binary
	    start=0;
	    end=list.size()-1;
	    while(start<end) {
	        int mid=(start+end)/2;
	        if((list.get(mid).getAptName()).compareTo(aptName)>0){
	            end=mid;
	        }else {
	            start=mid+1;
	        }
	    }
	    right=end;
	    
	    // find...
	    if((list.get(right).getAptName()).contains(aptName)) right++;
	    if((list.get(end).getAptName()).contains(aptName)) end++;

	    // make new List
	    newList=list.subList(left, right+1);
	    
	    System.out.println(left+" "+right);
	    
	    return newList;
	}

	private static void swap(List<HouseInfoDto>list, int a,int b) {
        HouseInfoDto temp=list.get(a);
        list.set(a, list.get(b));
        list.set(b, temp);
    }
}
