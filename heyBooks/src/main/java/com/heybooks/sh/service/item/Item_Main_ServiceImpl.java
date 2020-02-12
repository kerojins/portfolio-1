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
	public int get_count(HashMap<String, Object> count_map) {
		return dao.get_count(count_map);
	}
	// ��ǰ �Ǹ� ����
	@Override
	public int sell_count(int num) {
		return dao.sell_count(num);
	}
	// ��ǰ ���º� ����
	@Override
	public List<HashMap<String,Object>> product_status(){
		return dao.product_status();
	} 
	// �ű� ��ǰ ��� ����
	public int new_item() {
		return dao.new_item();
	}
	// ��� 2�� �̸� ��ǰ ����
	public int stock_item() {
		return dao.stock_item();
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
	// ��ǰ �Ǹż� ����Ʈ
	@Override
	public List<HashMap<String, Object>> sell_list(HashMap<String, Object> map){
		return dao.sell_list(map);
	}
	// 3. ��ǰ ����
	@Override
	public int item_delete(int product_num) {
		return dao.item_delete(product_num);
	}
	// 4. ��ǰ ������
	@Override
	public Item_Vo item_getinfo(int product_num) {
		return dao.item_getinfo(product_num);
	}
	// 5. ��ǰ �̹��� ����
	public int item_img_update(Item_Vo vo) {
		return dao.item_img_update(vo);
	}
} 
