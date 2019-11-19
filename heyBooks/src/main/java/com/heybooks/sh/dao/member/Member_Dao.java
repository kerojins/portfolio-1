package com.heybooks.sh.dao.member;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.member.Member_Vo;

public interface Member_Dao {
	
	// 1. ȸ�� ���� 
	public int join(Member_Vo vo);
	
	// ���̵� �ߺ� �˻�
	public String searchId(String id);
	
	// 2. �α���
	public Member_Vo login(Member_Vo vo);
	
	// 3. ȸ�� ���� ����
	public Member_Vo getInfo(int num);
	
}
