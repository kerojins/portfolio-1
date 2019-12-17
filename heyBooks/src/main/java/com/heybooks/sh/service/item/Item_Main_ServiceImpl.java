package com.heybooks.sh.service.item;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.item.Item_Main_Dao;
import com.heybooks.sh.vo.item.Item_Vo;

@Service
public class Item_Main_ServiceImpl implements Item_Main_Service{
	@Resource
	private Item_Main_Dao dao;
	
	// 1. ��ǰ ���
	public int item_insert(Item_Vo vo) {
		return dao.item_insert(vo);
	}
	// ��ǰ �̹������
	public int item_img_insert(Item_Vo vo) {
		return dao.item_img_insert(vo);
	} 
	// 2. ��ǰ ����Ʈ
	public List<Item_Vo> item_list(){
		return dao.item_list();
	}
}
