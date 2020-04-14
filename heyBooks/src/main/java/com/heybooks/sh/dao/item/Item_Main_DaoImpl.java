package com.heybooks.sh.dao.item;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.item.Item_Vo;

@Repository
public class Item_Main_DaoImpl implements Item_Main_Dao {
	
	
	@Resource 
	private SqlSession sqlSession;
	private static final String NAMESPACE ="com.heybooks.sh.mybatis.Item_Mapper";
	
	// 상품 총 갯수
	@Override
	public int get_count(HashMap<String, Object> count_map) {
		return sqlSession.selectOne(NAMESPACE + ".get_count",count_map);
	}
	// 상품 판매 갯수
	@Override
	public int sell_count(int num) {
		return sqlSession.selectOne(NAMESPACE+".sell_count", num);
	}
	// 상품 상태별 갯수
	@Override
	public List<HashMap<String,Object>> product_status(){
		return sqlSession.selectList(NAMESPACE+".product_status");
	}
	// 신규 상품 등록 갯수
	public int new_item() {
		return sqlSession.selectOne(NAMESPACE+".new_item");
	}
	// 재고 2개 미만 상품 갯수
	public int stock_item() { 
		return sqlSession.selectOne(NAMESPACE+".stock_item");
	}
	
	// 1. 상품 등록
	@Override
	public int item_insert(Item_Vo vo) {
		return sqlSession.update(NAMESPACE + ".item_insert", vo);
	}
	// 상품 이미지 등록
	@Override
	public int item_img_insert(Item_Vo vo) {
		return sqlSession.insert(NAMESPACE + ".item_img_insert", vo);
	}  
	// 2. 상품 리스트
	@Override
	public List<Item_Vo> item_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".item_list", map); 
	}
	// 상품 판매순 리스트
	@Override
	public List<HashMap<String, Object>> sell_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".sell_list", map);
	}
	 
	// 3. 상품 삭제
	@Override
	public int item_delete(int product_num) {
		return sqlSession.delete(NAMESPACE + ".item_delete", product_num); 
	}
	// 4. 상품 상세정보 
	@Override
	public Item_Vo item_getinfo(int product_num) {
		return sqlSession.selectOne(NAMESPACE + ".item_getinfo", product_num);
	}
	
	// 5. 상품 이미지 수정
	@Override
	public int item_img_update(Item_Vo vo) {
		return sqlSession.update(NAMESPACE + ".item_img_update", vo);
	}
	// 6. 상품 별점 동기화
	@Override
	public int item_grade_update(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE+".item_grade_update",map);
	} 
	
}
