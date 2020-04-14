package com.heybooks.sh.service.admin;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.admin.Admin_Dao;
import com.heybooks.sh.vo.admin.Admin_Alert_Vo;
import com.heybooks.sh.vo.admin.Admin_Memo_Vo;
import com.heybooks.sh.vo.admin.Admin_Vo;


public interface Admin_Service {
	
	// 1. ������ �α���
	public Admin_Vo login(HashMap<String, Object> map);
	
	// 2. ������ ������
	public Admin_Vo admin_detail(int num);
	
	
	// ������ Ȱ�� ���� 
 
	// 1. ������ Ȱ�� ���� ���
	public int admin_alert_insert(Admin_Alert_Vo vo);
		
	// 2. ������ Ȱ�� ���� ����Ʈ 
	public List<Admin_Alert_Vo> admin_alert_list();
	
	// ������ �޸� 
	
	// ������ �޸� ��ϼ�
		public int admin_memo_count();
	// 1. ������ �޸� ���
	public int admin_memo_insert(Admin_Memo_Vo vo);
	
	// 2. ������ Ȱ�� ���� ����Ʈ 
	public List<Admin_Memo_Vo> admin_memo_list(HashMap<String, Object> map);
	
	
}
