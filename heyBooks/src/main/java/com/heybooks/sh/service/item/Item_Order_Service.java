package com.heybooks.sh.service.item;

import java.util.HashMap;
import java.util.List;

import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.item.Order_Item_Vo;
import com.heybooks.sh.vo.item.Order_Vo;

public interface Item_Order_Service {
	
	// =======  ��ٱ��� =======
	
	// 1. ��ٱ��� �߰�
	public int cart_insert(Cart_Vo vo);
	
	// 2. ��ٱ��� ���
	public List<Cart_Vo> cart_list(int members_num);
	
	// 3. ��ٱ��� ����
	public int cart_update(HashMap<String, Integer> map);
	
	// 4. ��ٱ��� ����
	public int cart_delete(int cart_item_num);
	
	// 5. ��ٱ��� ������
	public Cart_Vo cart_getinfo(int cart_item_num);
	
	// ======= �ֹ� ========
	
	// 1. �ֹ� �߰�
	public int order_insert(Order_Vo vo);
	
	// �ֹ� ������ �׸� �߰�
	public int order_item_insert(Order_Item_Vo vo);
} 
