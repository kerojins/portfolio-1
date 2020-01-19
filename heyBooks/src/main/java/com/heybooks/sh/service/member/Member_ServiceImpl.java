package com.heybooks.sh.service.member;

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
	// ȸ�� ���� ����
	@Override
	public int update(Member_Vo vo) {
		return dao.update(vo);
	}
	
	// ======= ���ϸ��� ========
	
	//
	@Override
	public int mileage_insert(Mileage_Vo vo) {
		return dao.mileage_insert(vo);
	}
	// ���ϸ��� ������ 
	@Override
	public List<Mileage_Vo> mileage_getinfo(int members_num) {
		return dao.mileage_getinfo(members_num);
	} 
	
}
