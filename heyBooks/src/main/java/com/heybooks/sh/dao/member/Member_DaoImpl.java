package com.heybooks.sh.dao.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.swing.GroupLayout.SequentialGroup;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;
import com.heybooks.sh.vo.member.New_Item_Notice_Vo;
import com.heybooks.sh.vo.member.Push_Vo;
import com.heybooks.sh.vo.member.Today_View_Vo;
import com.heybooks.sh.vo.member.Wishlist_Vo;

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
	// �� ���ϸ���
	@Override
	public int total_mile() {
		return sqlSession.selectOne(NAMESPACE + ".total_mile");
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
	public List<Mileage_Vo> mileage_getinfo(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE +".mileage_getinfo", map);
	} 
	// 3. ���ϸ��� ����
	@Override
	public int milage_delete(HashMap<String, Object> map) {
		return sqlSession.delete(NAMESPACE+".mileage_delete", map);
	}
	
	// ====== ���ø���Ʈ ======
	 
	// ���ø���Ʈ ����
	@Override
	public int wishlist_count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".wishlist_count",map);
	}
	
	// 1. ���ø���Ʈ �߰�
	@Override
	public int wishlist_insert(Wishlist_Vo vo) {
		return sqlSession.insert(NAMESPACE+".wishlist_insert", vo);
	} 
	// 2. ���ø���Ʈ ���
	@Override
	public List<Wishlist_Vo> wishlist_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".wishlist_list", map);
	}
	// 3. ���ø���Ʈ ����
	@Override
	public int wishlist_delete(HashMap<String, Object> map) {
		return sqlSession.delete(NAMESPACE+".wishlist_delete", map);
	}

	// ====== ���� �� å =======
	
	// ���� �� å
	@Override
	public int today_view_count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".today_view_count", map);
	}
	// 1. ���� �� å �߰�
	@Override
	public int today_view_insert(Today_View_Vo vo) {
		return sqlSession.insert(NAMESPACE+".today_view_insert", vo);
	}
	// 2. ���� �� å ��� 
	@Override
	public List<Today_View_Vo> today_view_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".today_view_list", map);
	}
	// 3. ���� �� å ����
	@Override
	public int today_view_delete(HashMap<String, Object> map) { 
		return sqlSession.delete(NAMESPACE+".today_view_delete", map);
	}
	
	// ===== ȸ�� �˸� ======
	
	// �˸� ����
	@Override
	public int push_count(HashMap<String, Object> map) { 
		return sqlSession.selectOne(NAMESPACE+".push_count", map);
	}
	// 1. �˸� �߰�
	@Override
	public int push_insert(Push_Vo vo) {
		return sqlSession.insert(NAMESPACE+".push_insert", vo);
	}
	// 2. �˸� ���
	@Override 
	public List<Push_Vo> push_list(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".push_list", map);
	}
	// 3. �˸� ����
	@Override 
	public int push_delete(HashMap<String, Object> map) {
		return sqlSession.delete(NAMESPACE+".push_delete", map);
	}
		  
	
	// ===== �Ű� �˸� ======
	
	// �Ű� �˸� ����
	@Override
	public int new_item_notice_count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".new_item_notice_count", map);
	}
	// 1. �Ű� �˸� �߰�
	@Override
	public int  new_item_notice_insert(New_Item_Notice_Vo vo) {
		return sqlSession.insert(NAMESPACE+".new_item_notice_insert", vo);
	}
	// 2. �Ű� �˸� ���
	@Override
	public List<New_Item_Notice_Vo> new_item_notice_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".new_item_notice_list", map);
	}
	// 3. �Ű� �˸� ����
	@Override
	public int new_item_notice_delete(HashMap<String, Object> map) {
		return sqlSession.delete(NAMESPACE+".new_item_notice_delete", map);
	} 
	// 4. �Ű� �˸� ����
	@Override
	public New_Item_Notice_Vo new_item_notice_info(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".new_item_notice_info", map);
	}
		
}  
