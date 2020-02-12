package com.heybooks.sh.service.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.member.Member_Dao;
import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;

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
	public List<Mileage_Vo> mileage_getinfo(int members_num) {
		return dao.mileage_getinfo(members_num);
	} 
	
	// 3. ���ϸ��� ����
	@Override
	public int milage_delete(int num) {
		return dao.milage_delete(num);
	}
	
}
