package com.heybooks.sh.service.admin;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.admin.Admin_Dao;
import com.heybooks.sh.vo.admin.Admin_Alert_Vo;
import com.heybooks.sh.vo.admin.Admin_Vo;

@Service
public class Admin_ServieceImpl implements Admin_Service {
	
	@Resource 
	private Admin_Dao dao;
	
	// 1. ������ �α���
	@Override
	public Admin_Vo login(HashMap<String, Object> map) {
		return dao.login(map);
	}
	// 2. ������ ������
	@Override
	public Admin_Vo admin_detail(int num) {
		return dao.admin_detail(num);
	}
	
	// ������ Ȱ�� ���� 
	
	// 1. ������ Ȱ�� ���� ���
	public int admin_alert_insert(Admin_Alert_Vo vo) {
		return dao.admin_alert_insert(vo);
	}
		
	// 2. ������ Ȱ�� ���� ����Ʈ
	public List<Admin_Alert_Vo> admin_alert_list(){
		return dao.admin_alert_list();
	}
}
 