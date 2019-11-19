package com.heybooks.sh.service.admin;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.admin.Admin_Dao;
import com.heybooks.sh.vo.admin.Admin_Vo;

@Service
public class Admin_ServieceImpl implements Admin_Service {
	
	@Resource private Admin_Dao dao;
	
	// 1. 관리자 로그인
	@Override
	public Admin_Vo login(Admin_Vo vo) {
		return dao.login(vo);
	}
}
