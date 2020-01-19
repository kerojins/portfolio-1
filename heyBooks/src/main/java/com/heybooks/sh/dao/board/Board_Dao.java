package com.heybooks.sh.dao.board;

import java.util.HashMap;
import java.util.List;

import com.heybooks.sh.vo.board.Counsel_Reply_Vo;
import com.heybooks.sh.vo.board.Counsel_Vo;
import com.heybooks.sh.vo.board.Event_Vo;
import com.heybooks.sh.vo.board.Notice_Vo;

public interface Board_Dao {
	
	// ====== 1:1 문의 =======
	
	// 1:1문의글 전체글 갯수
	public int counsel_count(HashMap<String, Object> count_map);
	
	// 1:1문의글 추가
	public int counsel_insert(Counsel_Vo vo);
	
	// 1:1문의글 삭제
	public int counsel_delete(int counsel_num);
	
	// 1:1 문의글 리스트
	public List<Counsel_Vo> counsel_list(HashMap<String, Object> map);
	
	// 1:1문의글 상세
	public Counsel_Vo counsel_detail(int counsel_num);
	
	
	// 1:1문의글 수정
	public int counsel_update(Counsel_Vo vo);
	
	// 1:1답변 추가
	public int counsel_reply_insert(Counsel_Reply_Vo vo); 
	
	// 1:1답변 삭제
	public int counsel_reply_delete(int counsel_num); 
	
	// 1:1답변 상세
	public Counsel_Reply_Vo counsel_reply_detail(int counsel_num);
	
	
	// ====== 공지사항 =======
	
	// 공지사항 갯수
	public int notice_count();
	
	// 공지사항 추가
	public int notice_insert(Notice_Vo vo);
	
	// 공지사항 삭제
	public int notice_delete(int num);
	
	// 공지사항 수정
	public int notice_update(Notice_Vo vo);
	
	// 공지사항 리스트 
	public List<Notice_Vo> notice_list(HashMap<String, Object> map);
	
	// 공지사항 상세정보
	public Notice_Vo notice_detail(int num);
	
	
	// ====== 이벤트 =======
	
	// 이벤트 갯수
	public int event_count();
	
	// 이벤트 추가  
	public int event_insert(Event_Vo vo);
	
	// 이벤트 삭제
	public int event_delete(int num); 
	
	// 이벤트 수정
	public int event_update(Event_Vo vo);
	
	// 이벤트 리스트 
	public List<Event_Vo> event_list(HashMap<String, Object> map);
	
	// 이벤트 상세정보
	public Event_Vo event_detail(int num);
}
