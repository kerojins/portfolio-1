package com.jhta.spring15.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.spring15.service.MyBoardService;
import com.jhta.spring15.vo.MyBoardVo;

@Controller
public class UpdateController {
	@Autowired private MyBoardService service;
	@RequestMapping(value="/board/update",method=RequestMethod.GET)
	public String updateForm(int num,Model model) {
		MyBoardVo vo=service.getinfo(num);
		model.addAttribute("vo",vo);	
		return "board/update";
	}
	@RequestMapping(value="/board/update",method=RequestMethod.POST)
	public String update(MyBoardVo vo) {
		try {
			service.update(vo);
			return "result";
		}catch(Exception e) {
			System.out.println(e.getMessage());
			return "error";
		}
	}
}







