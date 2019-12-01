package com.heybooks.sh.service.item;


import java.util.List;

import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;

public interface Item_Category_Service {
	
	// 카테고리 목록 리스트
	public List<Item_Cate_Vo> cate_list(String cate_code);
	 	
	
	// 1. 작가 등록
	public int editor_insert(Item_Editor_Vo vo);
	
	// 2. 작가 리스트
	public List<Item_Editor_Vo> editor_list();
	
	// 3. 작가 삭제
	public int editor_delete(int num);
	
	// 4. 작가 정보
	public Item_Editor_Vo editor_getinfo(int num);
	
	// 작가 정보 수정
	public int editor_update(Item_Editor_Vo vo);
}
