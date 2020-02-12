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
	
	// 1. 관리자 로그인
	@Override
	public Admin_Vo login(HashMap<String, Object> map) {
		return dao.login(map);
	}
	// 2. 관리자 상세정보
	@Override
	public Admin_Vo admin_detail(int num) {
		return dao.admin_detail(num);
	}
	
	// 관리자 활동 내역 
	
	// 1. 관리자 활동 내역 등록
	public int admin_alert_insert(Admin_Alert_Vo vo) {
		return dao.admin_alert_insert(vo);
	}
		
	// 2. 관리자 활동 내역 리스트
	public List<Admin_Alert_Vo> admin_alert_list(){
		return dao.admin_alert_list();
	}
}
 