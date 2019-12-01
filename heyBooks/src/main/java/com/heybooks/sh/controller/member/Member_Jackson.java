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
public class Member_Jackson {
	
	private static final Logger logger = LoggerFactory.getLogger(Member_Jackson.class);

	@Resource
	Member_Service service;

	@RequestMapping("/jackson/id_check")
	@ResponseBody
	public Boolean searchId(String id) {
		Boolean id_check = true;
		String members_id = service.searchId(id);
		logger.info(members_id); 
		if(members_id != null) {
			id_check= false;  
		};
		return id_check;
	}
}
