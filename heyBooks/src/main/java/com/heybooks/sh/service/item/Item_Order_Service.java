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
	public int cart_delete(HashMap<String, Object> map);
	
	// 5. 장바구니 상세정보
	public Cart_Vo cart_getinfo(int cart_item_num);
	
	// ======= 주문 ========
	
	// 주문 전체 수 얻기
	public int order_count(HashMap<String, Object> map);
	
	// 1. 주문 추가
	public int order_insert(Order_Vo vo);
	
	// 주문 상태별 수
	public List<HashMap<String,Object>> order_status();
	 
	// 주문 아이템 항목 추가
	public int order_item_insert(Order_Item_Vo vo);
	
	// 2. 주문 리스트
	public List<Order_Vo> order_list(HashMap<String, Object> map);
	
	// 주문 뷰 리스트
	public List<HashMap<String, Object>> order_view_list(HashMap<String, Object> map);
	
	// 주문 아이템 리스트 
	public List<Order_Item_Vo> order_item_list(int num);
	
	// 3. 주문 상세정보
	public Order_Vo order_detail(int num);
	
	// 주문 아이템 상세정보
	public Order_Item_Vo order_item_detail(Object num);
	
	// 4. 주문 상태 수정
	public int order_status_update(Order_Vo vo);
	
	// 5. 주문 삭제 
	public int order_delete(int num);
		
	// 주문 아이템 삭제
	public int order_item_delete(int num);
	
	// 주문 아이템 null
	public int order_item_null(int num);
} 
