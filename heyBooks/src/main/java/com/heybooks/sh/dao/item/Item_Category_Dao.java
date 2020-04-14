package com.heybooks.sh.dao.item;


import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;
public interface Item_Category_Dao {
	
	// 아이템 카테고리 목록 리스트
 	public List<Item_Cate_Vo> cate_list(HashMap<String, Object> map);
 	
 	// 아이템 카테고리 정보
 	public Item_Cate_Vo cate_info(int num);
	 
    // 작가 리스트 수
 	public int editor_get_count(HashMap<String, Object> map) ;
 	
 	// 작가 등록작품 수
 	public int editor_item_count(int num);
 	
	// 1. 작가 등록 
	public int editor_insert (Item_Editor_Vo vo);
	
	// 2. 작가 리스트
	public List<Item_Editor_Vo> editor_list(HashMap<String, Object> map);
	
	// 관리자 작가 리스트
	public List<HashMap<String, Object>> editor_sell_list(HashMap<String, Object> map);
	
	// 3. 작가 삭제
	public int editor_delete (int num);
	
	// 작가 삭제 시 아이템 작가 값 비우기
	public int item_editor_null(int num); 
	
	// 4. 작가 정보
	public Item_Editor_Vo editor_getinfo(int num);
	
	// 작가 정보 수정
	public int editor_update(Item_Editor_Vo vo);
	
	// 5. 출판사 리스트
	public List<String> publishing_list();
	
	// 6. 상품 카테고리명 얻어오기 
	public List<Item_Cate_Vo> get_category(HashMap<String, Integer> map);
}
