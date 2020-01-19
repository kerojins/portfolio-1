package com.heybooks.sh.dao.member;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;

public interface Member_Dao {
	// ----  ȸ�� ���� ----- 
	
	// 1. ȸ�� ���� 
	public int join(Member_Vo vo);
	
	// ���̵� �ߺ� �˻�
	public String searchId(String id);
	
	// 2. �α���
	public Member_Vo login(Member_Vo vo);
	
	// 3. ȸ�� ����
	public Member_Vo getInfo(int num);
	
	// ȸ�� ���� ����
	public int update(Member_Vo vo);
	
	// ----- ���ϸ��� ------
	
	// ���ϸ��� ���� �߰�
	public int mileage_insert(Mileage_Vo vo); 
	
	// ���ϸ��� ������
	public List<Mileage_Vo> mileage_getinfo(int members_num);
	
	
}
