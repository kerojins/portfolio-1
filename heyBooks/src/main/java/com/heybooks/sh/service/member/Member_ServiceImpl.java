package com.heybooks.sh.service.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.member.Member_Dao;
import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;
import com.heybooks.sh.vo.member.New_Item_Notice_Vo;
import com.heybooks.sh.vo.member.Push_Vo;
import com.heybooks.sh.vo.member.Today_View_Vo;
import com.heybooks.sh.vo.member.Wishlist_Vo;

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
	// 총 마일리지
	@Override
	public int total_mile() {
		return dao.total_mile();
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
	public List<Mileage_Vo> mileage_getinfo(HashMap<String, Object> map) {
		return dao.mileage_getinfo(map);
	}   
	// 3. 마일리지 삭제
	@Override
	public int milage_delete(HashMap<String, Object> map) {
		return dao.milage_delete(map);
	}
	
	// ====== 위시리스트 ======
	
	// 위시리스트 갯수
	@Override
	public int wishlist_count(HashMap<String, Object> map) {
		return dao.wishlist_count(map);
	}
	// 1. 위시리스트 추가
	@Override
	public int wishlist_insert(Wishlist_Vo vo) {
		return dao.wishlist_insert(vo);
	}
	// 2. 위시리스트 목록
	@Override
	public List<Wishlist_Vo> wishlist_list(HashMap<String, Object> map){
		return dao.wishlist_list(map);
	}
	// 3. 위시리스트 삭제
	@Override
	public int wishlist_delete(HashMap<String, Object> map) {
		return dao.wishlist_delete(map);
	}
	
	// ====== 오늘 본 책 =======
	
	// 오늘 본 책
	@Override
	public int today_view_count(HashMap<String, Object> map) {
		return dao.today_view_count(map);
	}
	// 1. 오늘 본 책 추가
	@Override
	public int today_view_insert(Today_View_Vo vo) {
		return dao.today_view_insert(vo);
	}
	// 2. 오늘 본 책 목록 
	@Override
	public List<Today_View_Vo> today_view_list(HashMap<String, Object> map){
		return dao.today_view_list(map);
	}
	// 3. 오늘 본 책 삭제
	@Override
	public int today_view_delete(HashMap<String, Object> map) { 
		return dao.today_view_delete(map);
	} 
	
	// ===== 회원 알림 ======
	
	// 알림 갯수
	@Override
	public int push_count(HashMap<String, Object> map) {
		return dao.push_count(map);
	}
	// 1. 알림 추가
	@Override
	public int push_insert(Push_Vo vo) {
		return dao.push_insert(vo);
	}
	// 2. 알림 목록
	@Override
	public List<Push_Vo> push_list(HashMap<String, Object> map) {
		return dao.push_list(map);
	} 
	// 3. 알림 삭제
	@Override 
	public int push_delete(HashMap<String, Object> map) {
		return dao.push_delete(map); 
	}
	   
	// ===== 신간 알림 ======
	
	// 신간 알림 갯수
	@Override
	public int new_item_notice_count(HashMap<String, Object> map) {
		return dao.new_item_notice_count(map);
	}
	// 1. 신간 알림 추가
	@Override
	public int  new_item_notice_insert(New_Item_Notice_Vo vo) {
		return dao.new_item_notice_insert(vo);
	}
	// 2. 신간 알림 목록
	@Override
	public List<New_Item_Notice_Vo> new_item_notice_list(HashMap<String, Object> map){
		return dao.new_item_notice_list(map);
	} 
	// 3. 신간 알림 삭제
	@Override 
	public int new_item_notice_delete(HashMap<String, Object> map) {
		return dao.new_item_notice_delete(map);
	} 
	// 4. 신간 알림 정보
	@Override
	public New_Item_Notice_Vo new_item_notice_info(HashMap<String, Object> map) {
		return dao.new_item_notice_info(map);
	}
}
