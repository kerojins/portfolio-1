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
	
	// ��ǰ �� ����
	@Override
	public int get_count(HashMap<String, Object> count_map) {
		return sqlSession.selectOne(NAMESPACE + ".get_count",count_map);
	}
	// ��ǰ �Ǹ� ����
	@Override
	public int sell_count(int num) {
		return sqlSession.selectOne(NAMESPACE+".sell_count", num);
	}
	// ��ǰ ���º� ����
	@Override
	public List<HashMap<String,Object>> product_status(){
		return sqlSession.selectList(NAMESPACE+".product_status");
	}
	// �ű� ��ǰ ��� ����
	public int new_item() {
		return sqlSession.selectOne(NAMESPACE+".new_item");
	}
	// ��� 2�� �̸� ��ǰ ����
	public int stock_item() { 
		return sqlSession.selectOne(NAMESPACE+".stock_item");
	}
	
	// 1. ��ǰ ���
	@Override
	public int item_insert(Item_Vo vo) {
		return sqlSession.update(NAMESPACE + ".item_insert", vo);
	}
	// ��ǰ �̹��� ���
	@Override
	public int item_img_insert(Item_Vo vo) {
		return sqlSession.insert(NAMESPACE + ".item_img_insert", vo);
	}  
	// 2. ��ǰ ����Ʈ
	@Override
	public List<Item_Vo> item_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".item_list", map); 
	}
	// ��ǰ �Ǹż� ����Ʈ
	@Override
	public List<HashMap<String, Object>> sell_list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".sell_list", map);
	}
	 
	// 3. ��ǰ ����
	@Override
	public int item_delete(int product_num) {
		return sqlSession.delete(NAMESPACE + ".item_delete", product_num); 
	}
	// 4. ��ǰ ������ 
	@Override
	public Item_Vo item_getinfo(int product_num) {
		return sqlSession.selectOne(NAMESPACE + ".item_getinfo", product_num);
	}
	
	// 5. ��ǰ �̹��� ����
	@Override
	public int item_img_update(Item_Vo vo) {
		return sqlSession.update(NAMESPACE + ".item_img_update", vo);
	}
	// 6. ��ǰ ���� ����ȭ
	@Override
	public int item_grade_update(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE+".item_grade_update",map);
	} 
	
}
