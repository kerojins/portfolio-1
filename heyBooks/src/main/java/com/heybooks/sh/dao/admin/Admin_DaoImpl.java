package com.heybooks.sh.dao.admin;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.admin.Admin_Vo;

@Repository
public class Admin_DaoImpl implements Admin_Dao{
	@Resource
	private SqlSession sqlSession;
	private static final String NAMESPACE ="com.heybooks.sh.mybatis.Admin_Mapper";

	// 1. 관리자 로그인
	@Override
	public Admin_Vo login(Admin_Vo vo) {
		return sqlSession.selectOne(NAMESPACE +".login",vo);
	}
}
