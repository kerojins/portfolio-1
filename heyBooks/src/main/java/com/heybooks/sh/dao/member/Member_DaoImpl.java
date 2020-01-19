package com.heybooks.sh.dao.member;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;

@Repository
public class Member_DaoImpl implements Member_Dao{
	@Resource 
	private SqlSession sqlSession;
	private final static String NAMESPACE="com.heybooks.sh.mybatis.Member_Mapper";
	
	
	// ===== 회원 관리 ======
	
	// 1. 회원 가입
	@Override
	public int join(Member_Vo vo) {
		return sqlSession.insert( NAMESPACE + ".join",vo);
	}
	// 아이디 중복 검사
	@Override
	public String searchId(String id) {
		return sqlSession.selectOne(NAMESPACE + ".searchId", id); 
	}
	
	// 2. 로그인
	@Override
	public Member_Vo login(Member_Vo vo) {
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
	}
	// 3. 회원 정보 
	@Override
	public Member_Vo getInfo(int num) {
		return sqlSession.selectOne(NAMESPACE +".getInfo", num);
	}
	// 회원 정보 수정
	@Override
	public int update(Member_Vo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	}
	
	// ======= 마일리지 ========
	
	//마일리지 정보 추가
	@Override
	public int mileage_insert(Mileage_Vo vo) {
		return sqlSession.insert(NAMESPACE+ ".mileage_insert", vo);
	}
	 
	// 마일리지 상세 정보 
	@Override  
	public List<Mileage_Vo> mileage_getinfo(int members_num) {
		return sqlSession.selectList(NAMESPACE +".mileage_getinfo", members_num);
	} 
}
