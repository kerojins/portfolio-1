package com.heybooks.sh.dao.item;

import java.util.List;

import com.heybooks.sh.vo.item.Cart_Vo;

public interface Item_Order_Dao {
	
	// 1. ��ٱ��� �߰�
	public int cart_insert(Cart_Vo vo);
	
	// 2. ��ٱ��� ���
	public List<Cart_Vo> cart_list(int members_num); 
}
