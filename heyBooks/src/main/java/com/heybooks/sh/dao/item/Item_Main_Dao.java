package com.heybooks.sh.dao.item;

import java.util.List;

import com.heybooks.sh.vo.item.Item_Vo;

public interface Item_Main_Dao {
	
	// 1. ��ǰ ���
	public int item_insert(Item_Vo vo);
	
	// ��ǰ �̹��� ���
	public int item_img_insert(Item_Vo vo);
	
	// 2. ��ǰ ����Ʈ
	public List<Item_Vo> item_list();
	
}
