package com.heybooks.sh.dao.item;

import java.util.List;

import com.heybooks.sh.vo.item.Item_Vo;

public interface Item_Main_Dao {
	
	// 1. 상품 등록
	public int item_insert(Item_Vo vo);
	
	// 상품 이미지 등록
	public int item_img_insert(Item_Vo vo);
	
	// 2. 상품 리스트
	public List<Item_Vo> item_list();
	
}
