package com.heybooks.sh.dao.item;

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
	// ī�װ� ��� ����Ʈ
	
	@Override  
	public List<Item_Cate_Vo> cate_list(String cate_code) {
		return sqlSession.selectList(NAMESPACE + ".cate_list", cate_code); 
	} 
	
	// 1. �۰� ��� 
	@Override
	public int editor_insert(Item_Editor_Vo vo) {
		return sqlSession.insert(NAMESPACE + ".editor_insert",vo);
	}
	
	// 2. �۰� ����Ʈ
	@Override
	public List<Item_Editor_Vo> editor_list() {
		return sqlSession.selectList(NAMESPACE + ".editor_list");
	}
	// 3. �۰� ����
	@Override
	public int editor_delete(int num) {
		return sqlSession.delete(NAMESPACE + ".editor_delete", num);
	}
	// 4. �۰� ����
	@Override
	public Item_Editor_Vo editor_getinfo(int num) {
		return sqlSession.selectOne(NAMESPACE + ".editor_getinfo" , num);
	}
	// �۰� ���� ����
	@Override
	public int editor_update(Item_Editor_Vo vo) {
		return sqlSession.update(NAMESPACE + ".editor_update", vo);
	}

	
	
	

}
