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
	public int cart_delete(HashMap<String, Object> map);
	
	// 5. ��ٱ��� ������
	public Cart_Vo cart_getinfo(int cart_item_num);
	
	// ======= �ֹ� ========
	
	// �ֹ� ��ü �� ���
	public int order_count(HashMap<String, Object> map);
	
	// 1. �ֹ� �߰�
	public int order_insert(Order_Vo vo);
	
	// �ֹ� ���º� ��
	public List<HashMap<String,Object>> order_status();
	 
	// �ֹ� ������ �׸� �߰�
	public int order_item_insert(Order_Item_Vo vo);
	
	// 2. �ֹ� ����Ʈ
	public List<Order_Vo> order_list(HashMap<String, Object> map);
	
	// �ֹ� �� ����Ʈ
	public List<HashMap<String, Object>> order_view_list(HashMap<String, Object> map);
	
	// �ֹ� ������ ����Ʈ 
	public List<Order_Item_Vo> order_item_list(int num);
	
	// 3. �ֹ� ������
	public Order_Vo order_detail(int num);
	
	// �ֹ� ������ ������
	public Order_Item_Vo order_item_detail(Object num);
	
	// 4. �ֹ� ���� ����
	public int order_status_update(Order_Vo vo);
	
	// 5. �ֹ� ���� 
	public int order_delete(int num);
		
	// �ֹ� ������ ����
	public int order_item_delete(int num);
	
	// �ֹ� ������ null
	public int order_item_null(int num);
} 
