package com.heybooks.sh.dao.item;

import java.util.HashMap;
import java.util.List;

import com.heybooks.sh.vo.item.Item_Vo;

public interface Item_Main_Dao {
	
	// ��ǰ �� ����
	public int get_count(HashMap<String, Object> count_map);
	
	// ��ǰ �Ǹ� ����
	public int sell_count(int num);
	
	// ��ǰ ���º� ����
	public List<HashMap<String,Object>> product_status();
	 
	// �ű� ��ǰ ��� ����
	public int new_item();
	
	// ��� 2�� �̸� ��ǰ ����
	public int stock_item();
	
	// 1. ��ǰ ���
	public int item_insert(Item_Vo vo);
	
	// ��ǰ �̹��� ��� 
	public int item_img_insert(Item_Vo vo);
	
	// 2. ��ǰ ����Ʈ
	public List<Item_Vo> item_list(HashMap<String, Object> map);
	
	// ��ǰ �Ǹż� ����Ʈ
	public List<HashMap<String, Object>> sell_list(HashMap<String, Object> map);
	
	// 3. ��ǰ ����
	public int item_delete(int product_num);
	
	// 4. ��ǰ ������
	public Item_Vo item_getinfo(int product_num);
	
	// 5. ��ǰ �̹��� ����
	public int item_img_update(Item_Vo vo);
	
	// 6. ��ǰ ���� ����ȭ
	public int item_grade_update(HashMap<String, Object> map);
	 
	
} 
