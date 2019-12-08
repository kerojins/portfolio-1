package com.heybooks.sh.dao.item;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.item.Item_Vo;

@Repository
public class Item_Main_DaoImpl implements Item_Main_Dao {
	
	@Resource SqlSession sqlSession;
	private static final String NAMESPACE ="com.heybooks.sh.mybatis.Item_Mapper";
	
	// 1. 상품 등록
	public int item_insert(Item_Vo vo) {
		return sqlSession.insert(NAMESPACE + ".item_insert");
	}
}
