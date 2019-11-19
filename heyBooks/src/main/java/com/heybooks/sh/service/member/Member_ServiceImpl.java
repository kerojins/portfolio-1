package com.heybooks.sh.service.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.member.Member_Dao;
import com.heybooks.sh.vo.member.Member_Vo;

@Service
public class Member_ServiceImpl implements Member_Service{
	@Resource
	private Member_Dao dao;
	
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
	// 3. ȸ�� ���� ����
	@Override
	public Member_Vo getInfo(int num) {
		return dao.getInfo(num);
	}
	
}
