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
	
	// ====== 1:1 ���� =======
	
	// 1:1���� ��ü�� ����
	@Override
	public int counsel_count(HashMap<String, Object> count_map) {
		return dao.counsel_count(count_map);
	}
	// 1:1���Ǳ� �߰�
	@Override
	public int counsel_insert(Counsel_Vo vo) {
		return dao.counsel_insert(vo);
	}
	
	// 1:1���Ǳ� ���� 
	@Override
	public int counsel_delete(int counsel_num) {
		return dao.counsel_delete(counsel_num);
	}
	
	// 1:1���Ǳ� ����Ʈ
	@Override
	public List<Counsel_Vo> counsel_list(HashMap<String, Object> map){
		return dao.counsel_list(map);
	}
	// 1:1���Ǳ� ��
	@Override
	public Counsel_Vo counsel_detail(int counsel_num) {
		return dao.counsel_detail(counsel_num);
	}  
	// 1:1���Ǳ� ����
	@Override
	public int counsel_update(Counsel_Vo vo) {
		return dao.counsel_update(vo);
	}
	// 1:1�亯 �߰�
	@Override
	public int counsel_reply_insert(Counsel_Reply_Vo vo) {
		return dao.counsel_reply_insert(vo);
	} 
	// 1:1�亯 ����
	@Override
	public int counsel_reply_delete(int counsel_num) {
		return dao.counsel_reply_delete(counsel_num);
	}
	// 1:1���Ǳ� �亯 ��
	@Override
	public Counsel_Reply_Vo counsel_reply_detail(int counsel_num) {
		return dao.counsel_reply_detail(counsel_num);
	}
	
	// ====== �������� =======
	
	// �������� ����
	@Override
	public int notice_count() {
		return dao.notice_count();
	}
	// �������� �߰�
	@Override
	public int notice_insert(Notice_Vo vo) {
		return dao.notice_insert(vo);
	}
	// �������� ����
	@Override 
	public int notice_delete(int num) {
		return dao.notice_delete(num);
	}
	// �������� ����
	@Override
	public int notice_update(Notice_Vo vo) {
		return dao.notice_update(vo);
	} 
	// �������� ����Ʈ 
	@Override
	public List<Notice_Vo> notice_list(HashMap<String, Object> map){
		return dao.notice_list(map);
	} 
	// �������� ������
	@Override
	public Notice_Vo notice_detail(int num) {
		return dao.notice_detail(num);
	}
	
	
	// ====== �̺�Ʈ =======
	
	// �̺�Ʈ ����
	public int event_count() {
		return dao.event_count();
	} 
	// �̺�Ʈ �߰�  
	public int event_insert(Event_Vo vo) {
		return dao.event_insert(vo);
	}
	// �̺�Ʈ ���� 
	public int event_delete(int num) {
		return dao.event_delete(num);
	}
	// �̺�Ʈ ����
	public int event_update(Event_Vo vo) {
		return dao.event_update(vo);
	}
	// �̺�Ʈ ����Ʈ 
	public List<Event_Vo> event_list(HashMap<String, Object> map){
		return dao.event_list(map);
	}
	// �̺�Ʈ ������
	public Event_Vo event_detail(int num) {
		return dao.event_detail(num);
	}
}
