package com.heybooks.sh.service.item;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.item.Item_Order_Dao;
import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.item.Order_Item_Vo;
import com.heybooks.sh.vo.item.Order_Vo;

@Service
public class Item_Order_ServiceImpl implements Item_Order_Service{
	
	@Resource 
	private Item_Order_Dao dao;
	
	
	// ======== 장바구니 ========= 
	
	// 1. 장바구니 추가
	public int cart_insert(Cart_Vo vo) {
		return dao.cart_insert(vo);
	}
	// 2. 장바구니 목록
	public List<Cart_Vo> cart_list(int members_num){
		return dao.cart_list(members_num);
	}
	// 3. 장바구니 수정
	public int cart_update(HashMap<String, Integer> map) {
		return dao.cart_update(map);
	}
	// 4. 장바구니 삭제
	public int cart_delete(int cart_item_num) {
		return dao.cart_delete(cart_item_num);
	} 
	// 5. 장바구니 상세정보
	public Cart_Vo cart_getinfo(int cart_item_num) {
		return dao.cart_getinfo(cart_item_num);
	}
	
	// ======= 주문 ========
	
	// 1. 주문 추가
	public int order_insert(Order_Vo vo) {
		return dao.order_insert(vo);
	}
	
	// 주문 아이템 항목 추가
	public int order_item_insert(Order_Item_Vo vo) {
		return dao.order_item_insert(vo);
	}
}
