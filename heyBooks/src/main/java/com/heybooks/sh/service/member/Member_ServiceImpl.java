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
	
	// ======= 회원 =======
	
	// 회원 수
	@Override
	public int member_count(HashMap<String, Object> map) {
		return dao.member_count(map); 
	}
	// 1. 회원 가입
	@Override
	public int join(Member_Vo vo) {
		return dao.join(vo);
	}
	// 아이디 중복 검사
	@Override
	public String searchId(String id) {
		return dao.searchId(id);
	} 
	// 2. 로그인
	@Override
	public Member_Vo login(Member_Vo vo) {
		return dao.login(vo);
	}
	// 3. 회원 정보 
	@Override
	public Member_Vo getInfo(int num) {
		return dao.getInfo(num);
	}
	// 4. 회원 정보 수정
	@Override
	public int update(Member_Vo vo) {
		return dao.update(vo);
	}
	
	// 회원 리스트 정지 
	@Override
	public int member_list_update(int num) {
		return dao.member_list_update(num);
	}
	
	// 5. 회원 리스트
	@Override
	public List<Member_Vo> member_list(HashMap<String, Object> map){
		return dao.member_list(map);
	}
	
	// ======= 마일리지 ========
	
	// 1. 마일리지 추가
	@Override
	public int mileage_insert(Mileage_Vo vo) {
		return dao.mileage_insert(vo);
	}
	// 2. 마일리지 상세정보 
	@Override
	public List<Mileage_Vo> mileage_getinfo(int members_num) {
		return dao.mileage_getinfo(members_num);
	} 
	
	// 3. 마일리지 삭제
	@Override
	public int milage_delete(int num) {
		return dao.milage_delete(num);
	}
	
}
