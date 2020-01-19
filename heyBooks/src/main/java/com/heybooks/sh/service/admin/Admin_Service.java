package com.heybooks.sh.service.admin;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.admin.Admin_Dao;
import com.heybooks.sh.vo.admin.Admin_Vo;


public interface Admin_Service {
	
	// 1. ������ �α���
	public Admin_Vo login(HashMap<String, Object> map);
	
	// 2. ������ ������
	public Admin_Vo admin_detail(int num);
}
