package com.heybooks.sh.dao.board;

import java.util.HashMap;
import java.util.List;

import com.heybooks.sh.vo.board.Counsel_Reply_Vo;
import com.heybooks.sh.vo.board.Counsel_Vo;
import com.heybooks.sh.vo.board.Event_Vo;
import com.heybooks.sh.vo.board.Notice_Vo;
import com.heybooks.sh.vo.board.Review_Reply_Vo;
import com.heybooks.sh.vo.board.Review_Vo;

public interface Board_Dao {
	
	// ====== 1:1 ���� =======
	
	// 1:1���Ǳ� ��ü�� ����
	public int counsel_count(HashMap<String, Object> count_map);
	
	// 1:1���Ǳ� �߰�
	public int counsel_insert(Counsel_Vo vo);
	
	// 1:1���Ǳ� ����
	public int counsel_delete(int counsel_num);
	
	// 1:1 ���Ǳ� ����Ʈ
	public List<Counsel_Vo> counsel_list(HashMap<String, Object> map);
	
	// 1:1���Ǳ� ��
	public Counsel_Vo counsel_detail(int counsel_num);
	
	
	// 1:1���Ǳ� ����
	public int counsel_update(Counsel_Vo vo);
	
	// 1:1�亯 �߰�
	public int counsel_reply_insert(Counsel_Reply_Vo vo); 
	
	// 1:1�亯 ����
	public int counsel_reply_delete(int counsel_num); 
	
	// 1:1�亯 ��
	public Counsel_Reply_Vo counsel_reply_detail(int counsel_num);
	
	
	// ====== �������� =======
	
	// �������� ����
	public int notice_count(HashMap<String, Object> map);
	
	// �������� �߰�
	public int notice_insert(Notice_Vo vo);
	
	// �������� ����
	public int notice_delete(int num);
	
	// �������� ����
	public int notice_update(Notice_Vo vo);
	
	// �������� ����Ʈ 
	public List<Notice_Vo> notice_list(HashMap<String, Object> map);
	
	// �������� ������
	public Notice_Vo notice_detail(int num);
	
	
	// ====== �̺�Ʈ =======
	
	// �̺�Ʈ ����
	public int event_count(HashMap<String, Object> map);
	
	// �̺�Ʈ �߰�  
	public int event_insert(Event_Vo vo);
	
	// �̺�Ʈ ����
	public int event_delete(int num); 
	
	// �̺�Ʈ ����
	public int event_update(Event_Vo vo);
	
	// �̺�Ʈ ����Ʈ 
	public List<Event_Vo> event_list(HashMap<String, Object> map);
	
	// �̺�Ʈ ������
	public Event_Vo event_detail(int num);
	
	
	// ======= ���� ========
	
	// ���� ����
	public int review_count(HashMap<String, Object> map);
		
	// ���� �߰�  
	public int review_insert(Review_Vo vo);
	
	// ���� ����
	public int review_delete(int num); 
	
	// ���� ����
	public int review_update(Review_Vo vo);
	
	// ���� ����Ʈ  
	public List<Review_Vo> review_list(HashMap<String, Object> map);
	
	// ���� ������
	public Review_Vo review_detail(int num);
	
	
	// ======= ���� ��� ========
	
	// ������ ����
	public int review_reply_count(HashMap<String, Object> map);
		
	// ������ �߰�  
	public int review_reply_insert(Review_Reply_Vo vo);
	
	// ������ ����
	public int review_reply_delete(HashMap<String, Object> map); 
	  
	// ������ ����
	public int review_reply_update(Review_Reply_Vo vo);
	 
	// ������ ����Ʈ  
	public List<Review_Reply_Vo> review_reply_list(HashMap<String, Object> map);
	
	// ������ ������
	public Review_Reply_Vo review_reply_detail(int num);
		
	
}
