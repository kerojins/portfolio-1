package com.jhta.spring15.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jhta.spring15.service.MyBoardService;
import com.jhta.spring15.vo.MyBoardVo;
import com.jhta.util.PageUtil;

@Controller
public class ListController {
	@Autowired private MyBoardService service;
	
	@RequestMapping("/board/list")
	//pageNum�̶�� �Ķ���Ͱ� ���޵��� ������ �⺻�� 1�� pageNum������ �����
	public ModelAndView list(@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			String field,String keyword) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("field",field);
		map.put("keyword",keyword);
		
		int totalRowCount=service.getCount(map);
		PageUtil pu=new PageUtil(pageNum, totalRowCount, 10, 10);
		map.put("startRow",pu.getStartRow());
		map.put("endRow",pu.getEndRow());
		List<MyBoardVo> list=service.list(map);
		
		ModelAndView mv=new ModelAndView("board/list");
		mv.addObject("list",list);
		mv.addObject("pu",pu);
		mv.addObject("field",field);
		mv.addObject("keyword",keyword);
		return mv;
	}
}













