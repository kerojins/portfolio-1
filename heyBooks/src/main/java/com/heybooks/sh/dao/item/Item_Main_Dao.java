package com.heybooks.sh.dao.item;

import java.util.HashMap;
import java.util.List;

import com.heybooks.sh.vo.item.Item_Vo;

public interface Item_Main_Dao {
	
	// 상품 총 갯수
	public int get_count(HashMap<String, Object> count_map);
	
	// 상품 판매 갯수
	public int sell_count(int num);
	
	// 상품 상태별 갯수
	public List<HashMap<String,Object>> product_status();
	 
	// 신규 상품 등록 갯수
	public int new_item();
	
	// 재고 2개 미만 상품 갯수
	public int stock_item();
	
	// 1. 상품 등록
	public int item_insert(Item_Vo vo);
	
	// 상품 이미지 등록 
	public int item_img_insert(Item_Vo vo);
	
	// 2. 상품 리스트
	public List<Item_Vo> item_list(HashMap<String, Object> map);
	
	// 상품 판매순 리스트
	public List<HashMap<String, Object>> sell_list(HashMap<String, Object> map);
	
	// 3. 상품 삭제
	public int item_delete(int product_num);
	
	// 4. 상품 상세정보
	public Item_Vo item_getinfo(int product_num);
	
	// 5. 상품 이미지 수정
	public int item_img_update(Item_Vo vo);
	
	// 6. 상품 별점 동기화
	public int item_grade_update(HashMap<String, Object> map);
	 
	
} 
