package com.heybooks.sh.dao.item;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.item.Item_Vo;

@Repository
public class Item_Main_DaoImpl implements Item_Main_Dao {
	
	
	@Resource SqlSession sqlSession;
	private static final String NAMESPACE ="com.heybooks.sh.mybatis.Item_Mapper";
	
	// 1. ��ǰ ���
	public int item_insert(Item_Vo vo) {
		return sqlSession.insert(NAMESPACE + ".item_insert", vo);
	}
	
	// ��ǰ �̹��� ���
	public int item_img_insert(Item_Vo vo) {
		return sqlSession.insert(NAMESPACE + ".item_img_insert", vo);
	}  
	
	// 2. ��ǰ ����Ʈ
	public List<Item_Vo> item_list(){
		return sqlSession.selectList(NAMESPACE + ".item_list"); 
	}
}
