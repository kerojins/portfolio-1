package com.heybooks.sh.dao.member;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;

public interface Member_Dao {
	// ----  회원 관리 ----- 
	
	// 1. 회원 가입 
	public int join(Member_Vo vo);
	
	// 아이디 중복 검사
	public String searchId(String id);
	
	// 2. 로그인
	public Member_Vo login(Member_Vo vo);
	
	// 3. 회원 정보
	public Member_Vo getInfo(int num);
	
	// 회원 정보 수정
	public int update(Member_Vo vo);
	
	// ----- 마일리지 ------
	
	// 마일리지 정보 추가
	public int mileage_insert(Mileage_Vo vo); 
	
	// 마일리지 상세정보
	public List<Mileage_Vo> mileage_getinfo(int members_num);
	
	
}
