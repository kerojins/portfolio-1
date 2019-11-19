package com.heybooks.sh.dao.admin;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.admin.Admin_Vo;

public interface Admin_Dao {
	
	// 1. 관리자 로그인
	public Admin_Vo login(Admin_Vo vo);
}
