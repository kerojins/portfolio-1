package com.heybooks.sh.service.item;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.item.Item_Category_Dao;
import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;

@Service
public class Item_Category_ServiceImpl implements Item_Category_Service{
	
	@Resource Item_Category_Dao dao;
	
	// 아이템 카테고리 목록 리스트
	@Override
	public List<Item_Cate_Vo> cate_list(HashMap<String, Object> map) {
		return dao.cate_list(map);
	}
	// 아이템 카테고리 정보
	 public Item_Cate_Vo cate_info(int num){
		 return dao.cate_info(num);
	 } 
	// 작가 리스트 수  
	@Override
 	public int editor_get_count(HashMap<String, Object> map) {
 		return dao.editor_get_count(map);
 	}  
	// 작가 등록작품 수
	@Override
	 public int editor_item_count(int num) {
		return dao.editor_item_count(num);
	}
	// 1. 작가 등록 
	@Override
	public int editor_insert(Item_Editor_Vo vo) {
		return dao.editor_insert(vo);
	}
	// 2. 작가 리스트
	@Override
	public List<Item_Editor_Vo> editor_list(HashMap<String, Object> map) {
		return dao.editor_list(map);
	}
	// 관리자 작가 리스트
	@Override
	public List<HashMap<String, Object>> editor_sell_list(HashMap<String, Object> map){
		return dao.editor_sell_list(map);
	}
	 
	// 3. 작가 삭제
	@Override
	public int editor_delete(int num) {
		return dao.editor_delete(num);
	}
	
	// 작가 삭제 시 아이템 작가 값 비우기 
	@Override
	public int item_editor_null(int num) {
		return dao.item_editor_null(num);
	}; 
	// 4. 작가 정보 
	@Override
	public Item_Editor_Vo editor_getinfo(int num) {
		return dao.editor_getinfo(num);
	}
	// 작가 정보 수정
	@Override
	public int editor_update(Item_Editor_Vo vo) {
		return dao.editor_update(vo);
	}
	// 5. 출판사 리스트
	@Override
	public List<String> publishing_list() {
		return dao.publishing_list();
	}
	// 6. 상품 카테고리명 얻기
	@Override
	public List<Item_Cate_Vo> get_category(HashMap<String, Integer> map){
		return dao.get_category(map);
	}
	
	
	
}
