package com.heybooks.sh.service.item;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.item.Item_Main_Dao;
import com.heybooks.sh.vo.item.Item_Vo;

@Service
public class Item_Main_ServiceImpl implements Item_Main_Service{
	@Resource
	private Item_Main_Dao dao;
	
	// 상품 총 갯수
	@Override
	public int get_count() {
		return dao.get_count();
	}
	// 1. 상품 등록
	@Override
	public int item_insert(Item_Vo vo) {
		return dao.item_insert(vo);
	}
	// 상품 이미지등록
	@Override
	public int item_img_insert(Item_Vo vo) {
		return dao.item_img_insert(vo);
	} 
	// 2. 상품 리스트
	@Override
	public List<Item_Vo> item_list(HashMap<String, Object> map){
		return dao.item_list(map);
	}
	// 3. 상품 삭제
	@Override
	public int item_delete(int proudct_num) {
		return dao.item_delete(proudct_num);
	}
	// 4. 상품 상세정보
	@Override
	public Item_Vo item_getinfo(int proudct_num) {
		return dao.item_getinfo(proudct_num);
	}
	// 5. 상품 이미지 수정
	public int item_img_update(Item_Vo vo) {
		return dao.item_img_update(vo);
	}
} 
