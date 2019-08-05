package com.jhta.spring15.service;

import com.jhta.spring15.vo.MyBoardVo;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.spring15.dao.MyBoardDao;
@Service
public class MyBoardService {
	@Autowired private MyBoardDao dao;
	public void setDao(MyBoardDao dao) {
		this.dao = dao;
	}
	public int insert(MyBoardVo vo) {
		return dao.insert(vo);
	}
	public int getCount(HashMap<String,Object> map) {
		return dao.getCount(map);
	}
	public List<MyBoardVo> list(HashMap<String,Object> map){
		return dao.list(map);
	}
	public MyBoardVo getinfo(int num) {
		return dao.getinfo(num);
	}
	public int update(MyBoardVo vo) {
		return dao.update(vo);
	}
	public int delete(int num) {
		return dao.delete(num);
	}
	public int addHit(int num) {
		return dao.addHit(num);
	}
	public MyBoardVo prev(int num) {
		return dao.prev(num);
	}
	public MyBoardVo next(int num) {
		return dao.next(num);
	}
}













