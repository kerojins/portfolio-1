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
	
	// ======= 장바구니 ========
	
	// 1. 장바구니 추가
	@Override
	public int cart_insert(Cart_Vo vo) {
		return sqlSession.insert(NAMESPACE +".cart_insert", vo);
	};
	// 2. 장바구니 목록
	@Override
	public List<Cart_Vo> cart_list(int members_num){
		return sqlSession.selectList(NAMESPACE +".cart_list", members_num);
	}
	// 3. 장바구니 수정
	@Override
	public int cart_update(HashMap<String, Integer> map) {
		return sqlSession.update(NAMESPACE+".cart_update", map);
	}
	// 4. 장바구니 삭제
	@Override
	public int cart_delete(HashMap<String, Object> map) {
		return sqlSession.delete(NAMESPACE+".cart_delete", map);
	}
	// 5. 장바구니 상세정보
	@Override
	public Cart_Vo cart_getinfo(int cart_item_num) {
		return sqlSession.selectOne(NAMESPACE + ".cart_getinfo", cart_item_num);
	}
	
	// ======= 주문 =======
	
	// 주문 전체 수 얻기
	@Override
	public int order_count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".order_count", map);
	}
	// 주문 상태 수
	@Override
	public List<HashMap<String,Object>> order_status(){
		return sqlSession.selectList(NAMESPACE+".order_status");
	}
	// 오늘 주문 정보
	@Override
	public List<HashMap<String,Object>> order_today(){
		return sqlSession.selectList(NAMESPACE+".order_today");
	}
	
	// 날짜별 주문 판매 정보
	@Override
	public int order_sale(HashMap<String,Object> map){
		return sqlSession.selectOne(NAMESPACE+".order_sale", map);
	}
	// 1. 주문 추가
	@Override
	public int order_insert(Order_Vo vo) {
		return sqlSession.insert(NAMESPACE +".order_insert", vo);
	}
	// 주문 아이템 항목 추가
	@Override
	public int order_item_insert(Order_Item_Vo vo) {
		return sqlSession.insert(NAMESPACE +".order_item_insert", vo);
	}
	// 2. 주문 리스트
	@Override
	public List<Order_Vo> order_list(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".order_list", map);	
	} 
	// 주문 뷰 리스트
	@Override
	public List<HashMap<String, Object>> order_view_list(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE+".order_view_list", map);	
	} 
	// 주문 아이템 리스트
	@Override
	public List<Order_Item_Vo> order_item_list(int num){
		return sqlSession.selectList(NAMESPACE+".order_item_list", num);
	}
	
	// 3. 주문 상세정보
	@Override
	public Order_Vo order_detail(int num) {
		return sqlSession.selectOne(NAMESPACE+".order_detail", num);
	}
	
	// 주문 아이템 상세정보
	@Override
	public Order_Item_Vo order_item_detail(Object num) {
		return sqlSession.selectOne(NAMESPACE+".order_item_detail", num);
	}
	 
	// 4. 주문 상태 수정
	@Override
	public int order_status_update(Order_Vo vo) {
		return sqlSession.update(NAMESPACE+".order_status_update", vo);
	}
	// 주문 배송지 수정 
	@Override
	public int order_update(Order_Vo vo) {
		return sqlSession.update(NAMESPACE+".order_update", vo);
		
	}
	// 5. 주문 삭제 
	@Override
	public int order_delete(int num) {
		return sqlSession.delete(NAMESPACE+".order_delete", num);
	}
	// 주문 아이템 삭제
	@Override
	public int order_item_delete(int num) {
		return sqlSession.delete(NAMESPACE+".order_item_delete", num);
	}
	
	// 주문 아이템 null
	@Override
	public int order_item_null(int num) {
		return sqlSession.update(NAMESPACE+".order_item_null", num);
	} 
}   
