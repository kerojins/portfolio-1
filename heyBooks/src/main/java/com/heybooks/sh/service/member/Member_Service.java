package com.heybooks.sh.service.member;

import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.member.Member_Vo;

public interface Member_Service {
	
	// ------ 회원 --------

	// 1. 회원가입
	public int join(Member_Vo vo);
	
	// 아이디 중복 검사
	public String searchId(String id);
	
	// 2. 로그인
	public Member_Vo login(Member_Vo vo);
	
	// 3. 회원 정보 
	public Member_Vo getInfo(int num); 
	
	// 회원 정보 수정
	public int update(Member_Vo vo);
	
	
}
