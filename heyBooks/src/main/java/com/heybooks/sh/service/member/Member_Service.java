package com.heybooks.sh.service.member;

import com.heybooks.sh.vo.member.Member_Vo;

public interface Member_Service {

	// 1. ȸ������
	public int join(Member_Vo vo);
	
	// ���̵� �ߺ� �˻�
	public String searchId(String id);
	
	// 2. �α���
	public Member_Vo login(Member_Vo vo);
	
	// 3. ȸ�� ���� ����
	public Member_Vo getInfo(int num); 
}