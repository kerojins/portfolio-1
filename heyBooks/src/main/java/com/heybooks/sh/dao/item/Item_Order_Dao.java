package com.heybooks.sh.dao.item;

import java.util.List;

import com.heybooks.sh.vo.item.Cart_Vo;

public interface Item_Order_Dao {
	
	// 1. 장바구니 추가
	public int cart_insert(Cart_Vo vo);
	
	// 2. 장바구니 목록
	public List<Cart_Vo> cart_list(int members_num); 
}
