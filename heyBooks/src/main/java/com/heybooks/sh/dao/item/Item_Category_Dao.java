package com.heybooks.sh.dao.item;


import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;
public interface Item_Category_Dao {
	
	// ������ ī�װ� ��� ����Ʈ
 	public List<Item_Cate_Vo> cate_list(HashMap<String, Object> map);
 	
 	// ������ ī�װ� ����
 	public Item_Cate_Vo cate_info(int num);
	 
    // �۰� ����Ʈ ��
 	public int editor_get_count(HashMap<String, Object> map) ;
 	
 	// �۰� �����ǰ ��
 	public int editor_item_count(int num);
 	
	// 1. �۰� ��� 
	public int editor_insert (Item_Editor_Vo vo);
	
	// 2. �۰� ����Ʈ
	public List<Item_Editor_Vo> editor_list(HashMap<String, Object> map);
	
	// ������ �۰� ����Ʈ
	public List<HashMap<String, Object>> editor_sell_list(HashMap<String, Object> map);
	
	// 3. �۰� ����
	public int editor_delete (int num);
	
	// �۰� ���� �� ������ �۰� �� ����
	public int item_editor_null(int num); 
	
	// 4. �۰� ����
	public Item_Editor_Vo editor_getinfo(int num);
	
	// �۰� ���� ����
	public int editor_update(Item_Editor_Vo vo);
	
	// 5. ���ǻ� ����Ʈ
	public List<String> publishing_list();
	
	// 6. ��ǰ ī�װ��� ������ 
	public List<Item_Cate_Vo> get_category(HashMap<String, Integer> map);
}
