package com.jhta.spring15.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.spring15.vo.MyBoardVo;
@Repository
public class MyBoardDao {
	@Autowired private SqlSession session;
	private final static String NAMESPACE="com.jhta.spring15.mybatis.MyBoardMapper";
	public void setSession(SqlSession session) {
		this.session = session;
	}
	public int insert(MyBoardVo vo) {
		return session.insert(NAMESPACE +".insert",vo);
	}
	public int getCount(HashMap<String,Object> map) {
		return session.selectOne(NAMESPACE +".getCount",map);
	}
	public List<MyBoardVo> list(HashMap<String,Object> map){
		return session.selectList(NAMESPACE +".list",map);
	}
	public int update(MyBoardVo vo) {
		return session.update(NAMESPACE +".update",vo);
	}
	public MyBoardVo getinfo(int num) {
		return session.selectOne(NAMESPACE +".getinfo",num);
	}
	public int delete(int num) {
		return session.delete(NAMESPACE +".delete",num);
	}
	public int addHit(int num) {
		return session.update(NAMESPACE+".addHit",num);
	}
	public MyBoardVo next(int num) {
		return session.selectOne(NAMESPACE+".next",num);
	}
	public MyBoardVo prev(int num) {
		return session.selectOne(NAMESPACE+".prev",num);
	}
}










