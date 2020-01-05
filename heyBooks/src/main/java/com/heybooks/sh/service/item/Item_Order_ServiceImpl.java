package com.heybooks.sh.service.item;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.item.Item_Order_Dao;
import com.heybooks.sh.vo.item.Cart_Vo;

@Service
public class Item_Order_ServiceImpl implements Item_Order_Service{
	
	@Resource 
	Item_Order_Dao dao;
	
	// 1. ��ٱ��� �߰�
	public int cart_insert(Cart_Vo vo) {
		return dao.cart_insert(vo);
	}
	// 2. ��ٱ��� ���
	public List<Cart_Vo> cart_list(int members_num){
		return dao.cart_list(members_num);
	}
	
}
