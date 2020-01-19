package com.heybooks.sh.dao.item;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.item.Order_Item_Vo;
import com.heybooks.sh.vo.item.Order_Vo;

@Repository
public class Item_Order_DaoImpl implements Item_Order_Dao{
	
	@Resource
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.heybooks.sh.mybatis.Item_Mapper";
	
	// ======= ��ٱ��� ========
	
	// 1. ��ٱ��� �߰�
	@Override
	public int cart_insert(Cart_Vo vo) {
		return sqlSession.insert(NAMESPACE +".cart_insert", vo);
	};
	// 2. ��ٱ��� ���
	@Override
	public List<Cart_Vo> cart_list(int members_num){
		return sqlSession.selectList(NAMESPACE +".cart_list", members_num);
	}
	// 3. ��ٱ��� ����
	@Override
	public int cart_update(HashMap<String, Integer> map) {
		return sqlSession.update(NAMESPACE+".cart_update", map);
	}
	// 4. ��ٱ��� ����
	@Override
	public int cart_delete(int cart_item_num) {
		return sqlSession.delete(NAMESPACE+".cart_delete", cart_item_num);
	}
	// 5. ��ٱ��� ������
	@Override
	public Cart_Vo cart_getinfo(int cart_item_num) {
		return sqlSession.selectOne(NAMESPACE + ".cart_getinfo", cart_item_num);
	}
	
	// ======= �ֹ� =======
	
	// 1. �ֹ� �߰�
	public int order_insert(Order_Vo vo) {
		return sqlSession.insert(NAMESPACE +".order_insert", vo);
	}
	
	// �ֹ� ������ �׸� �߰�
	public int order_item_insert(Order_Item_Vo vo) {
		return sqlSession.insert(NAMESPACE +".order_item_insert", vo);
	}
} 
