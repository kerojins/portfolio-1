package com.jhta.spring15.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.spring15.service.MyBoardService;

@Controller
public class DeleteController {
	@Autowired
	private MyBoardService service;
	@RequestMapping(value="/board/delete",method=RequestMethod.GET)
	public String delete(int num) {
		try {
			service.delete(num);
			return "redirect:/board/list";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
}









