package com.heybooks.sh.controller.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.heybooks.sh.service.board.Board_Service;
import com.heybooks.sh.service.item.Item_Order_Service;
import com.heybooks.sh.service.member.Member_Service;
import com.heybooks.sh.vo.member.Member_Vo;

@Controller 
public class Member_Ajax_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Member_Ajax_Controller.class);
	@Resource
	private Member_Service service;
	@Resource
	private Board_Service board_service;
	@Resource
	private Item_Order_Service order_service;
	
	@RequestMapping("/member_getinfo")  
	@ResponseBody
	public Member_Vo member_getinfo(int members_num) {
		logger.info("json/get member-getinfo");
		Member_Vo vo = service.getInfo(members_num);
		return vo; 
	}
	
	@RequestMapping("/ajax/user_detail")  
	@ResponseBody
	public HashMap<String, Object> user_detail(int num) {
		logger.info("json/get user-detail");
		HashMap<String, Object> search_map = new HashMap<String, Object>();
		search_map.put("members_num", num);
		int counsel_cnt = board_service.counsel_count(search_map);
		int review_cnt = board_service.review_count(search_map);
		int order_cnt = order_service.order_count(search_map);
		HashMap<String, Object> map = new HashMap<String, Object>();
		Member_Vo vo = service.getInfo(num);
		
		map.put("vo", vo);
		map.put("counsel_cnt", counsel_cnt);
		map.put("review_cnt", review_cnt);
		map.put("order_cnt", order_cnt); 
		return map; 
	}
	 
}
