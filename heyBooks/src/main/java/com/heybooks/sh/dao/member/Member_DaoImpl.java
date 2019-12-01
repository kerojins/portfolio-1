package com.heybooks.sh.dao.member;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.member.Member_Vo;

@Repository
public class Member_DaoImpl implements Member_Dao{
	@Resource 
	private SqlSession sqlSession;
	private final static String NAMESPACE="com.heybooks.sh.mybatis.Member_Mapper";
	
	// 1. ȸ�� ����
	@Override
	public int join(Member_Vo vo) {
		return sqlSession.insert( NAMESPACE + ".join",vo);
	}
	// ���̵� �ߺ� �˻�
	@Override
	public String searchId(String id) {
		return sqlSession.selectOne(NAMESPACE + ".searchId", id); 
	}
	
	// 2. �α���
	@Override
	public Member_Vo login(Member_Vo vo) {
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
	}
	// 3. ȸ�� ���� 
	@Override
	public Member_Vo getInfo(int num) {
		return sqlSession.selectOne(NAMESPACE +".getInfo", num);
	}
	// ȸ�� ���� ����
	@Override
	public int update(Member_Vo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}
	
	
}
