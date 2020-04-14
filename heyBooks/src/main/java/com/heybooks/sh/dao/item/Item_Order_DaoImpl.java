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
	public int cart_delete(HashMap<String, Object> map) {
		return sqlSession.delete(NAMESPACE+".cart_delete", map);
	}
	// 5. ��ٱ��� ������
	@Override
	public Cart_Vo cart_getinfo(int cart_item_num) {
		return sqlSession.selectOne(NAMESPACE + ".cart_getinfo", cart_item_num);
	}
	
	// ======= �ֹ� =======
	
	// �ֹ� ��ü �� ���
	@Override
	public int order_count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".order_count", map);
	}
	// �ֹ� ���� ��
	@Override
	public List<HashMap<String,Object>> order_status(){
		return sqlSession.selectList(NAMESPACE+".order_status");
	}
	// ���� �ֹ� ����
	@Override
	public List<HashMap<String,Object>> order_today(){
		return sqlSession.selectList(NAMESPACE+".order_today");
	}
	
	// ��¥�� �ֹ� �Ǹ� ����
	@Override
	public int order_sale(HashMap<String,Object> map){
		return sqlSession.selectOne(NAMESPACE+".order_sale", map);
	}
	// 1. �ֹ� �߰�
	@Override
	public int order_insert(Order_Vo vo) {
		return sqlSession.insert(NAMESPACE +".order_insert", vo);
	}
	// �ֹ� ������ �׸� �߰�
	@Override
	public int order_item_insert(Order_Item_Vo vo) {
		return sqlSession.insert(NAMESPACE +".order_item_insert", vo);
	}
	// 2. �ֹ� ����Ʈ
	@Override
	public List<Order_Vo> order_list(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".order_list", map);	
	} 
	// �ֹ� �� ����Ʈ
	@Override
	public List<HashMap<String, Object>> order_view_list(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".order_view_list", map);	
	} 
	// �ֹ� ������ ����Ʈ
	@Override
	public List<Order_Item_Vo> order_item_list(int num){
		return sqlSession.selectList(NAMESPACE+".order_item_list", num);
	}
	
	// 3. �ֹ� ������
	@Override
	public Order_Vo order_detail(int num) {
		return sqlSession.selectOne(NAMESPACE+".order_detail", num);
	}
	
	// �ֹ� ������ ������
	@Override
	public Order_Item_Vo order_item_detail(Object num) {
		return sqlSession.selectOne(NAMESPACE+".order_item_detail", num);
	}
	 
	// 4. �ֹ� ���� ����
	@Override
	public int order_status_update(Order_Vo vo) {
		return sqlSession.update(NAMESPACE+".order_status_update", vo);
	}
	// �ֹ� ����� ���� 
	@Override
	public int order_update(Order_Vo vo) {
		return sqlSession.update(NAMESPACE+".order_update", vo);
		
	}
	// 5. �ֹ� ���� 
	@Override
	public int order_delete(int num) {
		return sqlSession.delete(NAMESPACE+".order_delete", num);
	}
	// �ֹ� ������ ����
	@Override
	public int order_item_delete(int num) {
		return sqlSession.delete(NAMESPACE+".order_item_delete", num);
	}
	
	// �ֹ� ������ null
	@Override
	public int order_item_null(int num) {
		return sqlSession.update(NAMESPACE+".order_item_null", num);
	} 
}   
