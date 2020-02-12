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
	
	
	// ===== ȸ�� ���� ======
	
	// ȸ�� ��
	@Override
	public int member_count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".member_count", map);
	} 
	 
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
	// 4. ȸ�� ���� ����
	@Override
	public int update(Member_Vo vo) {
		return sqlSession.update(NAMESPACE + ".update", vo);
	} 
	
	// ȸ�� ����Ʈ ���� 
	@Override
	public int member_list_update(int num) {
		return sqlSession.update(NAMESPACE+".member_list_update", num);
	} 
	
	// 5. ȸ�� ����Ʈ 
	@Override
	public List<Member_Vo> member_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE +".member_list", map);
	} 
	
	// ======= ���ϸ��� ========
	
	// 1. ���ϸ��� ���� �߰�
	@Override
	public int mileage_insert(Mileage_Vo vo) {
		return sqlSession.insert(NAMESPACE+ ".mileage_insert", vo);
	}
	 
	// 2. ���ϸ��� �� ���� 
	@Override  
	public List<Mileage_Vo> mileage_getinfo(int members_num) {
		return sqlSession.selectList(NAMESPACE +".mileage_getinfo", members_num);
	} 
	
	// 3. ���ϸ��� ����
	@Override
	public int milage_delete(int num) {
		return sqlSession.delete(NAMESPACE+".mileage_delete", num);
	}

}
