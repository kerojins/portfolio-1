package com.heybooks.sh.service.board;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heybooks.sh.dao.board.Board_Dao;
import com.heybooks.sh.vo.board.Counsel_Reply_Vo;
import com.heybooks.sh.vo.board.Counsel_Vo;
import com.heybooks.sh.vo.board.Event_Vo;
import com.heybooks.sh.vo.board.Notice_Vo;

@Service
public class Board_ServiceImpl implements Board_Service{
	@Resource
	private Board_Dao dao;
	
	// ====== 1:1 문의 =======
	
	// 1:1문의 전체글 갯수
	@Override
	public int counsel_count(HashMap<String, Object> count_map) {
		return dao.counsel_count(count_map);
	}
	// 1:1문의글 추가
	@Override
	public int counsel_insert(Counsel_Vo vo) {
		return dao.counsel_insert(vo);
	}
	
	// 1:1문의글 삭제 
	@Override
	public int counsel_delete(int counsel_num) {
		return dao.counsel_delete(counsel_num);
	}
	
	// 1:1문의글 리스트
	@Override
	public List<Counsel_Vo> counsel_list(HashMap<String, Object> map){
		return dao.counsel_list(map);
	}
	// 1:1문의글 상세
	@Override
	public Counsel_Vo counsel_detail(int counsel_num) {
		return dao.counsel_detail(counsel_num);
	}  
	// 1:1문의글 수정
	@Override
	public int counsel_update(Counsel_Vo vo) {
		return dao.counsel_update(vo);
	}
	// 1:1답변 추가
	@Override
	public int counsel_reply_insert(Counsel_Reply_Vo vo) {
		return dao.counsel_reply_insert(vo);
	} 
	// 1:1답변 삭제
	@Override
	public int counsel_reply_delete(int counsel_num) {
		return dao.counsel_reply_delete(counsel_num);
	}
	// 1:1문의글 답변 상세
	@Override
	public Counsel_Reply_Vo counsel_reply_detail(int counsel_num) {
		return dao.counsel_reply_detail(counsel_num);
	}
	
	// ====== 공지사항 =======
	
	// 공지사항 갯수
	@Override
	public int notice_count() {
		return dao.notice_count();
	}
	// 공지사항 추가
	@Override
	public int notice_insert(Notice_Vo vo) {
		return dao.notice_insert(vo);
	}
	// 공지사항 삭제
	@Override 
	public int notice_delete(int num) {
		return dao.notice_delete(num);
	}
	// 공지사항 수정
	@Override
	public int notice_update(Notice_Vo vo) {
		return dao.notice_update(vo);
	} 
	// 공지사항 리스트 
	@Override
	public List<Notice_Vo> notice_list(HashMap<String, Object> map){
		return dao.notice_list(map);
	} 
	// 공지사항 상세정보
	@Override
	public Notice_Vo notice_detail(int num) {
		return dao.notice_detail(num);
	}
	
	
	// ====== 이벤트 =======
	
	// 이벤트 갯수
	public int event_count() {
		return dao.event_count();
	} 
	// 이벤트 추가  
	public int event_insert(Event_Vo vo) {
		return dao.event_insert(vo);
	}
	// 이벤트 삭제 
	public int event_delete(int num) {
		return dao.event_delete(num);
	}
	// 이벤트 수정
	public int event_update(Event_Vo vo) {
		return dao.event_update(vo);
	}
	// 이벤트 리스트 
	public List<Event_Vo> event_list(HashMap<String, Object> map){
		return dao.event_list(map);
	}
	// 이벤트 상세정보
	public Event_Vo event_detail(int num) {
		return dao.event_detail(num);
	}
}
