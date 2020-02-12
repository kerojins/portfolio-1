package com.heybooks.sh.dao.admin;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.admin.Admin_Alert_Vo;
import com.heybooks.sh.vo.admin.Admin_Vo;

@Repository
public class Admin_DaoImpl implements Admin_Dao{
	@Resource
	private SqlSession sqlSession;
	private static final String NAMESPACE ="com.heybooks.sh.mybatis.Admin_Mapper";

	// 1. 관리자 로그인
	@Override
	public Admin_Vo login(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE +".login",map);
	}
	
	// 2. 관리자 상세정보 
	@Override
	public Admin_Vo admin_detail(int num) {
		return sqlSession.selectOne(NAMESPACE +".admin_detail", num);
	}
	
	// 관리자 활동 내역 
	 
	// 1. 관리자 활동 내역 등록
	public int admin_alert_insert(Admin_Alert_Vo vo) {
		return sqlSession.insert(NAMESPACE+".admin_alert_insert", vo);
	}
	// 2. 관리자 활동 내역 리스트
	public List<Admin_Alert_Vo> admin_alert_list(){
		return sqlSession.selectList(NAMESPACE+".admin_alert_list");
	}
	
}
