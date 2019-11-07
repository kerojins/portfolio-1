package com.heybooks.sh.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.Admin_Login_Vo;

@Repository
public class Admin_Login_Dao {
	@Autowired
	private SqlSession sqlSession;
	private static final String NAMESPACE ="com.heybooks.sh.mybatis.mapper";
	public String getinfo(String admin_id) {
		return sqlSession.selectOne(NAMESPACE + ".admin_info",admin_id);
	}
}
