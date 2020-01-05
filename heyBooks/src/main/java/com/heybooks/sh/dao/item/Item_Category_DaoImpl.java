package com.heybooks.sh.dao.item;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;

@Repository
public class Item_Category_DaoImpl implements Item_Category_Dao{
	
	@Resource SqlSession sqlSession;
	private static final String NAMESPACE ="com.heybooks.sh.mybatis.Item_Mapper";
	// 아이템 카테고리 목록 리스트
	
	@Override  
	public List<Item_Cate_Vo> cate_list(String cate_code) {
		return sqlSession.selectList(NAMESPACE + ".cate_list", cate_code); 
	} 
	
	 // 작가 리스트 수
	@Override
 	public int editor_get_count() {
 		return sqlSession.selectOne(NAMESPACE + ".editor_get_count"); 
 	} 
	
	
	// 1. 작가 등록 
	@Override
	public int editor_insert(Item_Editor_Vo vo) {
		return sqlSession.insert(NAMESPACE + ".editor_insert",vo);
	}
	
	// 2. 작가 리스트
	@Override
	public List<Item_Editor_Vo> editor_list(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".editor_list", map);
	}
	// 3. 작가 삭제
	@Override
	public int editor_delete(int num) {
		return sqlSession.delete(NAMESPACE + ".editor_delete", num);
	}
	
	// 작가 삭제 시 아이템 작가 값 비우기
	@Override
	public int item_editor_null(int num) {
		return sqlSession.update(NAMESPACE + ".item_editor_null", num);
	}; 
	// 4. 작가 정보
	@Override
	public Item_Editor_Vo editor_getinfo(int num) {
		return sqlSession.selectOne(NAMESPACE + ".editor_getinfo" , num);
	}
	// 작가 정보 수정
	@Override
	public int editor_update(Item_Editor_Vo vo) {
		return sqlSession.update(NAMESPACE + ".editor_update", vo);
	}
	// 5. 출판사 리스트
	@Override
	public List<String> publishing_list() {
		return sqlSession.selectList(NAMESPACE + ".publishing_list");
	}
	// 6. 상품 카테고리명 얻기
	@Override    
	public List<Item_Cate_Vo> get_category(HashMap<String, Integer> map){
		return sqlSession.selectList(NAMESPACE + ".get_category", map);
	} 
	
	
	

}
