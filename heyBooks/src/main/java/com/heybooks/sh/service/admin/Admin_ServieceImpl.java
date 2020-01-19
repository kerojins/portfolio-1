package com.heybooks.sh.service.admin;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.admin.Admin_Dao;
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
}
 