package com.heybooks.sh.service.item;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.item.Item_Main_Dao;
import com.heybooks.sh.vo.item.Item_Vo;

@Service
public class Item_Main_ServiceImpl implements Item_Main_Service{
	@Resource
	private Item_Main_Dao dao;
	
	// 1. 상품 등록
	public int item_insert(Item_Vo vo) {
		return dao.item_insert(vo);
	}
}
