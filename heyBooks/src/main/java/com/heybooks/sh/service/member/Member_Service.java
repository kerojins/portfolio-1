package com.heybooks.sh.service.member;

import java.util.HashMap;
import java.util.List;

import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;
import com.heybooks.sh.vo.member.New_Item_Notice_Vo;
import com.heybooks.sh.vo.member.Push_Vo;
import com.heybooks.sh.vo.member.Today_View_Vo;
import com.heybooks.sh.vo.member.Wishlist_Vo;

public interface Member_Service {
	
	// ======== 회원 ========

	// 회원 수
	public int member_count(HashMap<String, Object> map);
	
	// 총 마일리지
	public int total_mile();
	
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
	
	// 회원 리스트 정지 
	public int member_list_update(int num);
	
	// 4. 회원 리스트
	public List<Member_Vo> member_list(HashMap<String, Object> map);
	
	
	// ======= 마일리지 ========
	
	// 1. 마일리지 정보 추가
	public int mileage_insert(Mileage_Vo vo);
	
	// 2. 마일리지 상세정보
	public List<Mileage_Vo> mileage_getinfo(HashMap<String, Object> map);
	
	// 3. 마일리지 삭제
	public int milage_delete(HashMap<String, Object> map);
	
	
	// ====== 위시리스트 ======
	
	// 위시리스트 갯수
	public int wishlist_count(HashMap<String, Object> map);
	
	// 1. 위시리스트 추가
	public int wishlist_insert(Wishlist_Vo vo);
	
	// 2. 위시리스트 목록
	public List<Wishlist_Vo> wishlist_list(HashMap<String, Object> map);
	
	// 3. 위시리스트 삭제
	public int wishlist_delete(HashMap<String, Object> map);
	
	
	// ====== 오늘 본 책 =======
	
	// 오늘 본 책
	public int today_view_count(HashMap<String, Object> map);
		
	// 1. 오늘 본 책 추가
	public int today_view_insert(Today_View_Vo vo);
		 
	// 2. 오늘 본 책 목록
	public List<Today_View_Vo> today_view_list(HashMap<String, Object> map);
	
	// 3. 오늘 본 책 삭제
	public int today_view_delete(HashMap<String, Object> map);
	
	// ===== 회원 알림 ======
	
	// 알림 갯수
	public int push_count(HashMap<String, Object> map);
	
	// 1. 알림 추가
	public int push_insert(Push_Vo vo);
	
	// 2. 알림 목록
	public  List<Push_Vo>  push_list(HashMap<String, Object> map);
	
	// 3. 알림 삭제
	public int push_delete(HashMap<String, Object> map);
	
	// ===== 신간 알림 ======
	
	// 신간 알림 갯수
	public int new_item_notice_count(HashMap<String, Object> map);
	
	// 1. 신간 알림 추가
	public int  new_item_notice_insert(New_Item_Notice_Vo vo);
	
	// 2. 신간 알림 목록
	public List<New_Item_Notice_Vo> new_item_notice_list(HashMap<String, Object> map);
	
	// 3. 신간 알림 삭제
	public int new_item_notice_delete(HashMap<String, Object> map);
	
	// 4. 신간 알림 정보 
	public New_Item_Notice_Vo new_item_notice_info(HashMap<String, Object> map);
		
	
}
