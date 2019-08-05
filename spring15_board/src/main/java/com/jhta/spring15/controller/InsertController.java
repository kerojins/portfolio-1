package com.jhta.spring15.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.spring15.service.MyBoardService;
import com.jhta.spring15.vo.MyBoardVo;

@Controller
public class InsertController {
	@Autowired private MyBoardService service;
	
	@RequestMapping(value="/board/insert",method=RequestMethod.GET)
	public String insertForm() {
		return "board/insert";
	}
	@RequestMapping(value="/board/insert",method=RequestMethod.POST)
	public String insert(MyBoardVo vo) {
		try {
			service.insert(vo);
			return "result";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
}











