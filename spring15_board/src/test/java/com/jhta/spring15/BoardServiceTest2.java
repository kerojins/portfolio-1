package com.jhta.spring15;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
//Ŭ�����н� ��ġ���� �������� �ҷ�����
@ContextConfiguration({"classpath:root-context.xml","classpath:servlet-context.xml"})
@WebAppConfiguration
public class BoardServiceTest2 {
	@Autowired private WebApplicationContext ctx;
	private MockMvc mockMvc;
	@Before
	public void setUp() {
		mockMvc=MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	@Test
	public void insert() {
		try {
			//perform�޼ҵ带 ���� ��û������ dispatcher servlet�� ������
			mockMvc.perform(MockMvcRequestBuilders.post("/board/insert")
				.param("writer","gildong")
				.param("title","test...")
				.param("content","good"))
				.andExpect(MockMvcResultMatchers.status().isOk())
				.andExpect(MockMvcResultMatchers.forwardedUrl("/WEB-INF/views/result.jsp"));
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
	//��������� �׽�Ʈ�غ�����.
	@Test
	public void delete() {
		try {
			//perform�޼ҵ带 ���� ��û������ dispatcher servlet�� ������
			mockMvc.perform(MockMvcRequestBuilders.get("/board/delete")
				.param("num","5"))
				.andExpect(MockMvcResultMatchers.status().is(302))
				.andExpect(MockMvcResultMatchers.redirectedUrl("/board/list"));
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}
}





















