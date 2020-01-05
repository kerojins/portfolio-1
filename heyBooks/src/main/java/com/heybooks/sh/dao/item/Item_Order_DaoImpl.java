package com.heybooks.sh.dao.item;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.item.Cart_Vo;

@Repository
public class Item_Order_DaoImpl implements Item_Order_Dao{
	
	@Resource
	SqlSession sqlSession;
	private static final String NAMESPACE = "com.heybooks.sh.mybatis.Item_Mapper";
	
	// 1. 장바구니 추가
	public int cart_insert(Cart_Vo vo) {
		return sqlSession.insert(NAMESPACE +".cart_insert", vo);
	};
	// 2. 장바구니 목록
	public List<Cart_Vo> cart_list(int members_num){
		return sqlSession.selectList(NAMESPACE +".cart_list", members_num);
	}
}
