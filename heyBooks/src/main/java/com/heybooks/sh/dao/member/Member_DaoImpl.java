package com.heybooks.sh.dao.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.swing.GroupLayout.SequentialGroup;

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
	
	// 회원 수
	@Override
	public int member_count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".member_count", map);
	} 
	 
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
	// 4. 회원 정보 수정
	@Override
	public int update(Member_Vo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	} 
	
	// 회원 리스트 정지 
	@Override
	public int member_list_update(int num) {
		return sqlSession.update(NAMESPACE+".member_list_update", num);
	} 
	
	// 5. 회원 리스트 
	@Override
	public List<Member_Vo> member_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE +".member_list", map);
	} 
	
	// ======= 마일리지 ========
	
	// 1. 마일리지 정보 추가
	@Override
	public int mileage_insert(Mileage_Vo vo) {
		return sqlSession.insert(NAMESPACE+ ".mileage_insert", vo);
	}
	 
	// 2. 마일리지 상세 정보 
	@Override  
	public List<Mileage_Vo> mileage_getinfo(int members_num) {
		return sqlSession.selectList(NAMESPACE +".mileage_getinfo", members_num);
	} 
	
	// 3. 마일리지 삭제
	@Override
	public int milage_delete(int num) {
		return sqlSession.delete(NAMESPACE+".mileage_delete", num);
	}

}
