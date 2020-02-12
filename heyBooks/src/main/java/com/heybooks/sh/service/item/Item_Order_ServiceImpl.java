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
	
	
	// ======== ��ٱ��� ========= 
	
	// 1. ��ٱ��� �߰�
	@Override
	public int cart_insert(Cart_Vo vo) {
		return dao.cart_insert(vo);
	}
	// 2. ��ٱ��� ���
	@Override
	public List<Cart_Vo> cart_list(int members_num){
		return dao.cart_list(members_num);
	}
	// 3. ��ٱ��� ����
	@Override
	public int cart_update(HashMap<String, Integer> map) {
		return dao.cart_update(map);
	}
	// 4. ��ٱ��� ����
	@Override
	public int cart_delete(HashMap<String, Object> map) {
		return dao.cart_delete(map);
	} 
	// 5. ��ٱ��� ������ 
	@Override
	public Cart_Vo cart_getinfo(int cart_item_num) {
		return dao.cart_getinfo(cart_item_num);
	}
	
	// ======= �ֹ� ========
	
	// �ֹ� ��ü �� ���
	@Override
	public int order_count(HashMap<String, Object> map) {
		return dao.order_count(map);
	}
	// �ֹ� ���º� ��
	@Override
	public List<HashMap<String,Object>> order_status(){
		return dao.order_status(); 
	}
	// 1. �ֹ� �߰�
	@Override
	public int order_insert(Order_Vo vo) {
		return dao.order_insert(vo);
	}
	// �ֹ� ������ �׸� �߰�
	@Override
	public int order_item_insert(Order_Item_Vo vo) {
		return dao.order_item_insert(vo);
	}
	// 2. �ֹ� ����Ʈ
	@Override
	public List<Order_Vo> order_list(HashMap<String, Object> map){
		return dao.order_list(map);
	}
	// �ֹ� �� ����Ʈ
	@Override
	public List<HashMap<String, Object>> order_view_list(HashMap<String, Object> map){
		return dao.order_view_list(map);
	}
	// �ֹ� ������ ����Ʈ
	@Override
	public List<Order_Item_Vo> order_item_list(int num){
		return dao.order_item_list(num);
	}
	// 3. �ֹ� ������
	@Override
	public Order_Vo order_detail(int num) {
		return dao.order_detail(num);
	} 
	
	// �ֹ� ������ ������
	@Override
	public Order_Item_Vo order_item_detail(Object num) {
		return dao.order_item_detail(num);
	}  
	 
	// 4. �ֹ� ���� ����
	@Override
	public int order_status_update(Order_Vo vo) {
		return dao.order_status_update(vo);
	}
	// 5. �ֹ� ����
	@Override
	public int order_delete(int num) {
		return dao.order_delete(num);
	} 
	// �ֹ� ������ ����
	@Override
	public int order_item_delete(int num) {
		return dao.order_item_delete(num);
	}
	
	// �ֹ� ������ null
	@Override
	public int order_item_null(int num) {
		return dao.order_item_null(num);
	}
}
