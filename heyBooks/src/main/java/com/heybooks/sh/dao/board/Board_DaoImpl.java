package com.heybooks.sh.dao.board;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.board.Counsel_Reply_Vo;
import com.heybooks.sh.vo.board.Counsel_Vo;
import com.heybooks.sh.vo.board.Event_Vo;
import com.heybooks.sh.vo.board.Notice_Vo;

@Repository
public class Board_DaoImpl implements Board_Dao{
	@Resource
	private SqlSession sqlSession;
	private static final String NAMESPACE = "com.heybooks.sh.mybatis.Board_Mapper";
	
	// ====== 1:1 ���� =======
	
	// 1:1���� ��ü�� ����
	@Override 
	public int counsel_count(HashMap<String, Object> count_map) {
		return sqlSession.selectOne(NAMESPACE+".counsel_count", count_map);
	}
	// 1:1���Ǳ� �߰�
	@Override
	public int counsel_insert(Counsel_Vo vo) {
		return sqlSession.insert(NAMESPACE+".counsel_insert", vo);
	}
	// 1:1���Ǳ� ����
	@Override
	public int counsel_delete(int counsel_num) {
		return sqlSession.delete(NAMESPACE+".counsel_delete", counsel_num);
	}
	
	// 1:1���Ǳ� ����Ʈ
	@Override
	public List<Counsel_Vo> counsel_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".counsel_list", map);
	} 
	// 1:1���Ǳ� ��
	@Override
	public Counsel_Vo counsel_detail(int counsel_num) {
		return sqlSession.selectOne(NAMESPACE+".counsel_detail", counsel_num);
	} 
	// 1:1���Ǳ� ����
	@Override
	public int counsel_update(Counsel_Vo vo) {
		return sqlSession.update(NAMESPACE+".counsel_update", vo);
	} 
	// 1:1�亯 �߰�
	@Override
	public int counsel_reply_insert(Counsel_Reply_Vo vo) {
		return sqlSession.insert(NAMESPACE+".counsel_reply_insert", vo);
	}
	// 1:1�亯 ����
	public int counsel_reply_delete(int counsel_num) {
		return sqlSession.delete(NAMESPACE+".counsel_reply_delete", counsel_num);
	}
	
	// 1:1�亯 ��
	@Override
	public Counsel_Reply_Vo counsel_reply_detail(int counsel_num) {
		return sqlSession.selectOne(NAMESPACE+ ".counsel_reply_detail", counsel_num);
	}
	
	// ====== �������� =======
	
	// �������� ����
	@Override
	public int notice_count() {
		return sqlSession.selectOne(NAMESPACE+".notice_count");
	}
	// �������� �߰�
	@Override
	public int notice_insert(Notice_Vo vo) {
		return sqlSession.insert(NAMESPACE+".notice_insert", vo);
	}
	// �������� ����
	@Override
	public int notice_delete(int num) { 
		return sqlSession.delete(NAMESPACE+".notice_delete", num);
	} 
	// �������� ����
	@Override
	public int notice_update(Notice_Vo vo) {
		return sqlSession.update(NAMESPACE+".notice_update", vo);
	}
	// �������� ����Ʈ 
	@Override
	public List<Notice_Vo> notice_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".notice_list",map);
		
	}
	// �������� ������
	@Override
	public Notice_Vo notice_detail(int num) {
		return sqlSession.selectOne(NAMESPACE+".notice_detail", num);
	}
	 
	// ====== �̺�Ʈ =======
	
	// �̺�Ʈ �߰�  
	public int event_insert(Event_Vo vo) {
		return sqlSession.insert(NAMESPACE+".event_insert", vo);
	}
	
	// �̺�Ʈ ����
	public int event_count() {
		return sqlSession.selectOne(NAMESPACE+".event_count");
	}
	
	// �̺�Ʈ ����
	public int event_delete(int num) {
		return sqlSession.delete(NAMESPACE+".event_delete", num);
	}
	
	// �̺�Ʈ ����
	public int event_update(Event_Vo vo) {
		return sqlSession.update(NAMESPACE+".event_update", vo);
	}
	
	// �̺�Ʈ ����Ʈ 
	public List<Event_Vo> event_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE+".event_list", map);
	}
	
	// �̺�Ʈ ������
	public Event_Vo event_detail(int num) {  
		return sqlSession.selectOne(NAMESPACE+".event_detail", num);
	}
}    
 