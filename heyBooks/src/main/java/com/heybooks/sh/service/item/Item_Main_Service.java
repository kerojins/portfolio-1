package com.heybooks.sh.service.item;

import java.util.HashMap;
import java.util.List;

import com.heybooks.sh.vo.item.Item_Vo;

public interface Item_Main_Service {
	
	// ��ǰ �� ����
	public int get_count(HashMap<String, Object> count_map) ;
	
	// 1. ��ǰ ���
	public int item_insert(Item_Vo vo);

	// ��ǰ �̹��� ���
	public int item_img_insert(Item_Vo vo);
	
	// 2. ��ǰ ����Ʈ
	public List<Item_Vo> item_list(HashMap<String, Object> map);
	
	// 3. ��ǰ ����
	public int item_delete(int product_num);
	
	// 4. ��ǰ ������
	public Item_Vo item_getinfo(int product_num);
	 
	// 5. ��ǰ �̹��� ����
	public int item_img_update(Item_Vo vo);
} 
