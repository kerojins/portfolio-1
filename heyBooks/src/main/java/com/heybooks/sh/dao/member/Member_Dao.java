package com.heybooks.sh.dao.member;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.member.Member_Vo;

public interface Member_Dao {
	
	// 1. 회원 가입 
	public int join(Member_Vo vo);
	
	// 아이디 중복 검사
	public String searchId(String id);
	
	// 2. 로그인
	public Member_Vo login(Member_Vo vo);
	
	// 3. 회원 정보 수정
	public Member_Vo getInfo(int num);
	
}
