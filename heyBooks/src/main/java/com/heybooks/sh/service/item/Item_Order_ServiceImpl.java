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
	@Override
	public int cart_insert(Cart_Vo vo) {
		return dao.cart_insert(vo);
	}
	// 2. 장바구니 목록
	@Override
	public List<Cart_Vo> cart_list(int members_num){
		return dao.cart_list(members_num);
	}
	// 3. 장바구니 수정
	@Override
	public int cart_update(HashMap<String, Integer> map) {
		return dao.cart_update(map);
	}
	// 4. 장바구니 삭제
	@Override
	public int cart_delete(HashMap<String, Object> map) {
		return dao.cart_delete(map);
	} 
	// 5. 장바구니 상세정보 
	@Override
	public Cart_Vo cart_getinfo(int cart_item_num) {
		return dao.cart_getinfo(cart_item_num);
	}
	
	// ======= 주문 ========
	
	// 주문 전체 수 얻기
	@Override
	public int order_count(HashMap<String, Object> map) {
		return dao.order_count(map);
	}
	// 주문 상태별 수
	@Override
	public List<HashMap<String,Object>> order_status(){
		return dao.order_status(); 
	}
	// 1. 주문 추가
	@Override
	public int order_insert(Order_Vo vo) {
		return dao.order_insert(vo);
	}
	// 주문 아이템 항목 추가
	@Override
	public int order_item_insert(Order_Item_Vo vo) {
		return dao.order_item_insert(vo);
	}
	// 2. 주문 리스트
	@Override
	public List<Order_Vo> order_list(HashMap<String, Object> map){
		return dao.order_list(map);
	}
	// 주문 뷰 리스트
	@Override
	public List<HashMap<String, Object>> order_view_list(HashMap<String, Object> map){
		return dao.order_view_list(map);
	}
	// 주문 아이템 리스트
	@Override
	public List<Order_Item_Vo> order_item_list(int num){
		return dao.order_item_list(num);
	}
	// 3. 주문 상세정보
	@Override
	public Order_Vo order_detail(int num) {
		return dao.order_detail(num);
	} 
	
	// 주문 아이템 상세정보
	@Override
	public Order_Item_Vo order_item_detail(Object num) {
		return dao.order_item_detail(num);
	}  
	 
	// 4. 주문 상태 수정
	@Override
	public int order_status_update(Order_Vo vo) {
		return dao.order_status_update(vo);
	}
	// 5. 주문 삭제
	@Override
	public int order_delete(int num) {
		return dao.order_delete(num);
	} 
	// 주문 아이템 삭제
	@Override
	public int order_item_delete(int num) {
		return dao.order_item_delete(num);
	}
	
	// 주문 아이템 null
	@Override
	public int order_item_null(int num) {
		return dao.order_item_null(num);
	}
}
