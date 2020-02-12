package com.heybooks.sh.dao.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;

public interface Member_Dao {
	
	// ====== 회원 관리 ======
	
	// 회원 수
	public int member_count(HashMap<String, Object> map);
	
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
	
	// 회원 리스트 정지 
	public int member_list_update(int num);
	
	// 4. 회원 리스트
	public List<Member_Vo> member_list(HashMap<String, Object> map);
	
	// ====== 마일리지 ======
	
	// 1. 마일리지 정보 추가
	public int mileage_insert(Mileage_Vo vo); 
	
	// 2. 마일리지 상세정보
	public List<Mileage_Vo> mileage_getinfo(int members_num);
	
	// 3. 마일리지 삭제
	public int milage_delete(int num);
	
}
