package com.heybooks.sh.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.Admin_Login_Dao;
import com.heybooks.sh.vo.Admin_Login_Vo;

@Service
public class Admin_Login_Service {
	@Autowired private Admin_Login_Dao dao;
	public void setDao(Admin_Login_Dao dao) {
		this.dao = dao;
	}
	public Admin_Login_Vo getinfo(HashMap<String, String> map) {
		return dao.getinfo(map);
	}
}
