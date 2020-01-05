package com.heybooks.sh.service.item;

import java.util.HashMap;
import java.util.List;

import com.heybooks.sh.vo.item.Item_Vo;

public interface Item_Main_Service {
	
	// 상품 총 갯수
	public int get_count() ;
	
	// 1. 상품 등록
	public int item_insert(Item_Vo vo);

	// 상품 이미지 등록
	public int item_img_insert(Item_Vo vo);
	
	// 2. 상품 리스트
	public List<Item_Vo> item_list(HashMap<String, Object> map);
	
	// 3. 상품 삭제
	public int item_delete(int proudct_num);
	
	// 4. 상품 상세정보
	public Item_Vo item_getinfo(int proudct_num);
	 
	// 5. 상품 이미지 수정
	public int item_img_update(Item_Vo vo);
} 
