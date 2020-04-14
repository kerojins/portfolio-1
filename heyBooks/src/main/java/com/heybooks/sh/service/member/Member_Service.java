package com.heybooks.sh.service.member;

import java.util.HashMap;
import java.util.List;

import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;
import com.heybooks.sh.vo.member.New_Item_Notice_Vo;
import com.heybooks.sh.vo.member.Push_Vo;
import com.heybooks.sh.vo.member.Today_View_Vo;
import com.heybooks.sh.vo.member.Wishlist_Vo;

public interface Member_Service {
	
	// ======== ȸ�� ========

	// ȸ�� ��
	public int member_count(HashMap<String, Object> map);
	
	// �� ���ϸ���
	public int total_mile();
	
	// 1. ȸ������
	public int join(Member_Vo vo);
	
	// ���̵� �ߺ� �˻�
	public String searchId(String id);
	
	// 2. �α���
	public Member_Vo login(Member_Vo vo); 
	
	// 3. ȸ�� ���� 
	public Member_Vo getInfo(int num); 
	
	// ȸ�� ���� ����
	public int update(Member_Vo vo);
	
	// ȸ�� ����Ʈ ���� 
	public int member_list_update(int num);
	
	// 4. ȸ�� ����Ʈ
	public List<Member_Vo> member_list(HashMap<String, Object> map);
	
	
	// ======= ���ϸ��� ========
	
	// 1. ���ϸ��� ���� �߰�
	public int mileage_insert(Mileage_Vo vo);
	
	// 2. ���ϸ��� ������
	public List<Mileage_Vo> mileage_getinfo(HashMap<String, Object> map);
	
	// 3. ���ϸ��� ����
	public int milage_delete(HashMap<String, Object> map);
	
	
	// ====== ���ø���Ʈ ======
	
	// ���ø���Ʈ ����
	public int wishlist_count(HashMap<String, Object> map);
	
	// 1. ���ø���Ʈ �߰�
	public int wishlist_insert(Wishlist_Vo vo);
	
	// 2. ���ø���Ʈ ���
	public List<Wishlist_Vo> wishlist_list(HashMap<String, Object> map);
	
	// 3. ���ø���Ʈ ����
	public int wishlist_delete(HashMap<String, Object> map);
	
	
	// ====== ���� �� å =======
	
	// ���� �� å
	public int today_view_count(HashMap<String, Object> map);
		
	// 1. ���� �� å �߰�
	public int today_view_insert(Today_View_Vo vo);
		 
	// 2. ���� �� å ���
	public List<Today_View_Vo> today_view_list(HashMap<String, Object> map);
	
	// 3. ���� �� å ����
	public int today_view_delete(HashMap<String, Object> map);
	
	// ===== ȸ�� �˸� ======
	
	// �˸� ����
	public int push_count(HashMap<String, Object> map);
	
	// 1. �˸� �߰�
	public int push_insert(Push_Vo vo);
	
	// 2. �˸� ���
	public  List<Push_Vo>  push_list(HashMap<String, Object> map);
	
	// 3. �˸� ����
	public int push_delete(HashMap<String, Object> map);
	
	// ===== �Ű� �˸� ======
	
	// �Ű� �˸� ����
	public int new_item_notice_count(HashMap<String, Object> map);
	
	// 1. �Ű� �˸� �߰�
	public int  new_item_notice_insert(New_Item_Notice_Vo vo);
	
	// 2. �Ű� �˸� ���
	public List<New_Item_Notice_Vo> new_item_notice_list(HashMap<String, Object> map);
	
	// 3. �Ű� �˸� ����
	public int new_item_notice_delete(HashMap<String, Object> map);
	
	// 4. �Ű� �˸� ���� 
	public New_Item_Notice_Vo new_item_notice_info(HashMap<String, Object> map);
		
	
}
