package com.jhta.spring15;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jhta.spring15.service.MyBoardService;
import com.jhta.spring15.vo.MyBoardVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardSeviceTest1 {
	@Autowired private MyBoardService service;	
	@Test
	public void insert() {
		int n=service.insert(new MyBoardVo(0,"�׽�Ʈ","�׽�Ʈ��","���", 0,null));
		boolean a=false;
		if(n>0) a=true;
		Assert.assertTrue(a);
	}
	
	@Test
	public void getinfo() {
		MyBoardVo vo=service.getinfo(61);
		//vo�� null�� �ƴ��� �˻�
		Assert.assertNotNull(vo);
	}
	//��������� �׽�Ʈ�غ�����.
	@Test
	public void delete() {
		int n=service.delete(61);
		Assert.assertEquals(n,1);
	}
}






































