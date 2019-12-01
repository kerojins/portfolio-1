package com.heybooks.sh.service.item;


import java.util.List;

import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;

public interface Item_Category_Service {
	
	// ī�װ� ��� ����Ʈ
	public List<Item_Cate_Vo> cate_list(String cate_code);
	 	
	
	// 1. �۰� ���
	public int editor_insert(Item_Editor_Vo vo);
	
	// 2. �۰� ����Ʈ
	public List<Item_Editor_Vo> editor_list();
	
	// 3. �۰� ����
	public int editor_delete(int num);
	
	// 4. �۰� ����
	public Item_Editor_Vo editor_getinfo(int num);
	
	// �۰� ���� ����
	public int editor_update(Item_Editor_Vo vo);
}
