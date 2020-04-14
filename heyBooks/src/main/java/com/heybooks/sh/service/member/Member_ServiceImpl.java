package com.heybooks.sh.service.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.member.Member_Dao;
import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;
import com.heybooks.sh.vo.member.New_Item_Notice_Vo;
import com.heybooks.sh.vo.member.Push_Vo;
import com.heybooks.sh.vo.member.Today_View_Vo;
import com.heybooks.sh.vo.member.Wishlist_Vo;

@Service
public class Member_ServiceImpl implements Member_Service{
	@Resource
	private Member_Dao dao;
	
	// ======= ȸ�� =======
	
	// ȸ�� ��
	@Override
	public int member_count(HashMap<String, Object> map) {
		return dao.member_count(map); 
	}
	// �� ���ϸ���
	@Override
	public int total_mile() {
		return dao.total_mile();
	}
	
	// 1. ȸ�� ����
	@Override
	public int join(Member_Vo vo) {
		return dao.join(vo);
	}
	// ���̵� �ߺ� �˻�
	@Override
	public String searchId(String id) {
		return dao.searchId(id);
	} 
	// 2. �α���
	@Override
	public Member_Vo login(Member_Vo vo) {
		return dao.login(vo);
	}
	// 3. ȸ�� ���� 
	@Override
	public Member_Vo getInfo(int num) {
		return dao.getInfo(num);
	}
	// 4. ȸ�� ���� ����
	@Override
	public int update(Member_Vo vo) {
		return dao.update(vo);
	}
	
	// ȸ�� ����Ʈ ���� 
	@Override
	public int member_list_update(int num) {
		return dao.member_list_update(num);
	}
	
	// 5. ȸ�� ����Ʈ
	@Override
	public List<Member_Vo> member_list(HashMap<String, Object> map){
		return dao.member_list(map);
	}
	
	// ======= ���ϸ��� ========
	
	// 1. ���ϸ��� �߰�
	@Override
	public int mileage_insert(Mileage_Vo vo) {
		return dao.mileage_insert(vo);
	}
	// 2. ���ϸ��� ������ 
	@Override
	public List<Mileage_Vo> mileage_getinfo(HashMap<String, Object> map) {
		return dao.mileage_getinfo(map);
	}   
	// 3. ���ϸ��� ����
	@Override
	public int milage_delete(HashMap<String, Object> map) {
		return dao.milage_delete(map);
	}
	
	// ====== ���ø���Ʈ ======
	
	// ���ø���Ʈ ����
	@Override
	public int wishlist_count(HashMap<String, Object> map) {
		return dao.wishlist_count(map);
	}
	// 1. ���ø���Ʈ �߰�
	@Override
	public int wishlist_insert(Wishlist_Vo vo) {
		return dao.wishlist_insert(vo);
	}
	// 2. ���ø���Ʈ ���
	@Override
	public List<Wishlist_Vo> wishlist_list(HashMap<String, Object> map){
		return dao.wishlist_list(map);
	}
	// 3. ���ø���Ʈ ����
	@Override
	public int wishlist_delete(HashMap<String, Object> map) {
		return dao.wishlist_delete(map);
	}
	
	// ====== ���� �� å =======
	
	// ���� �� å
	@Override
	public int today_view_count(HashMap<String, Object> map) {
		return dao.today_view_count(map);
	}
	// 1. ���� �� å �߰�
	@Override
	public int today_view_insert(Today_View_Vo vo) {
		return dao.today_view_insert(vo);
	}
	// 2. ���� �� å ��� 
	@Override
	public List<Today_View_Vo> today_view_list(HashMap<String, Object> map){
		return dao.today_view_list(map);
	}
	// 3. ���� �� å ����
	@Override
	public int today_view_delete(HashMap<String, Object> map) { 
		return dao.today_view_delete(map);
	} 
	
	// ===== ȸ�� �˸� ======
	
	// �˸� ����
	@Override
	public int push_count(HashMap<String, Object> map) {
		return dao.push_count(map);
	}
	// 1. �˸� �߰�
	@Override
	public int push_insert(Push_Vo vo) {
		return dao.push_insert(vo);
	}
	// 2. �˸� ���
	@Override
	public List<Push_Vo> push_list(HashMap<String, Object> map) {
		return dao.push_list(map);
	} 
	// 3. �˸� ����
	@Override 
	public int push_delete(HashMap<String, Object> map) {
		return dao.push_delete(map); 
	}
	   
	// ===== �Ű� �˸� ======
	
	// �Ű� �˸� ����
	@Override
	public int new_item_notice_count(HashMap<String, Object> map) {
		return dao.new_item_notice_count(map);
	}
	// 1. �Ű� �˸� �߰�
	@Override
	public int  new_item_notice_insert(New_Item_Notice_Vo vo) {
		return dao.new_item_notice_insert(vo);
	}
	// 2. �Ű� �˸� ���
	@Override
	public List<New_Item_Notice_Vo> new_item_notice_list(HashMap<String, Object> map){
		return dao.new_item_notice_list(map);
	} 
	// 3. �Ű� �˸� ����
	@Override 
	public int new_item_notice_delete(HashMap<String, Object> map) {
		return dao.new_item_notice_delete(map);
	} 
	// 4. �Ű� �˸� ����
	@Override
	public New_Item_Notice_Vo new_item_notice_info(HashMap<String, Object> map) {
		return dao.new_item_notice_info(map);
	}
}
