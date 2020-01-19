package com.heybooks.sh.controller.member;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.heybooks.sh.service.member.Member_Service;
import com.heybooks.sh.vo.member.Member_Vo;

@Controller 
public class Member_Ajax_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Member_Ajax_Controller.class);
	@Resource
	private Member_Service service;
	
	@RequestMapping("/member_getinfo")  
	@ResponseBody
	public Member_Vo member_getinfo(int members_num) {
		logger.info("json/get member-getinfo");
		Member_Vo vo = service.getInfo(members_num);
		return vo; 
	}
}
