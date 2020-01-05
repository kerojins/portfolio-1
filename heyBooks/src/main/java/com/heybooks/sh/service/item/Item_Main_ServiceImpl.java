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
	
	// ��ǰ �� ����
	@Override
	public int get_count() {
		return dao.get_count();
	}
	// 1. ��ǰ ���
	@Override
	public int item_insert(Item_Vo vo) {
		return dao.item_insert(vo);
	}
	// ��ǰ �̹������
	@Override
	public int item_img_insert(Item_Vo vo) {
		return dao.item_img_insert(vo);
	} 
	// 2. ��ǰ ����Ʈ
	@Override
	public List<Item_Vo> item_list(HashMap<String, Object> map){
		return dao.item_list(map);
	}
	// 3. ��ǰ ����
	@Override
	public int item_delete(int proudct_num) {
		return dao.item_delete(proudct_num);
	}
	// 4. ��ǰ ������
	@Override
	public Item_Vo item_getinfo(int proudct_num) {
		return dao.item_getinfo(proudct_num);
	}
	// 5. ��ǰ �̹��� ����
	public int item_img_update(Item_Vo vo) {
		return dao.item_img_update(vo);
	}
} 
