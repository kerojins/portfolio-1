package com.heybooks.sh.service.item;

import java.util.HashMap;
import java.util.List;

import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.item.Order_Item_Vo;
import com.heybooks.sh.vo.item.Order_Vo;

public interface Item_Order_Service {
	
	// =======  장바구니 =======
	
	// 1. 장바구니 추가
	public int cart_insert(Cart_Vo vo);
	
	// 2. 장바구니 목록
	public List<Cart_Vo> cart_list(int members_num);
	
	// 3. 장바구니 수정
	public int cart_update(HashMap<String, Integer> map);
	
	// 4. 장바구니 삭제
	public int cart_delete(int cart_item_num);
	
	// 5. 장바구니 상세정보
	public Cart_Vo cart_getinfo(int cart_item_num);
	
	// ======= 주문 ========
	
	// 1. 주문 추가
	public int order_insert(Order_Vo vo);
	
	// 주문 아이템 항목 추가
	public int order_item_insert(Order_Item_Vo vo);
} 
