package com.heybooks.sh.dao.admin;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.admin.Admin_Alert_Vo;
import com.heybooks.sh.vo.admin.Admin_Memo_Vo;
import com.heybooks.sh.vo.admin.Admin_Vo;

public interface Admin_Dao {
	
	// 1. 관리자 로그인
	public Admin_Vo login(HashMap<String, Object> map);
	
	// 2. 관리자 상세정보
	public Admin_Vo admin_detail(int num);
	
	
	// 관리자 활동 내역
	
	// 1. 관리자 활동 내역 등록
	public int admin_alert_insert(Admin_Alert_Vo vo);
	
	// 2. 관리자 활동 내역 리스트
	public List<Admin_Alert_Vo> admin_alert_list();
	
	// 관리자 메모
	
	// 관리자 메모 등록수
	public int admin_memo_count();
	 
	// 1. 관리자 메모 등록
	public int admin_memo_insert(Admin_Memo_Vo vo);
	
	// 2. 관리자 활동 내역 리스트
	public List<Admin_Memo_Vo> admin_memo_list(HashMap<String, Object> map);
	
	
}
