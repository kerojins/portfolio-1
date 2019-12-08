package com.heybooks.sh.service.item;

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
	public List<Item_Cate_Vo> cate_list(String cate_code) {
		return dao.cate_list(cate_code);
	}
	// 1. 작가 등록 
	@Override
	public int editor_insert(Item_Editor_Vo vo) {
		return dao.editor_insert(vo);
	}
	// 2. 작가 리스트
	@Override
	public List<Item_Editor_Vo> editor_list() {
		return dao.editor_list();
	}
	// 3. 작가 삭제
	@Override
	public int editor_delete(int num) {
		return dao.editor_delete(num);
	}
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
	
	
	
}
