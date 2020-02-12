package com.heybooks.sh.service.member;

import java.util.HashMap;
import java.util.List;

import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;

public interface Member_Service {
	
	// ======== ȸ�� ========

	// ȸ�� ��
	public int member_count(HashMap<String, Object> map);
	
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
	public List<Mileage_Vo> mileage_getinfo(int members_num);
	
	// 3. ���ϸ��� ����
	public int milage_delete(int num);
}
