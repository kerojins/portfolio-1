package com.jhta.spring15.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jhta.spring15.service.MyBoardService;
import com.jhta.spring15.vo.MyBoardVo;

@Controller
public class DetailController {
	@Autowired private MyBoardService service;
	@RequestMapping(value="/board/detail",method=RequestMethod.GET)
	public String detail(int num,Model model) {
		MyBoardVo vo=service.getinfo(num);//글상세정보
		MyBoardVo prev=service.prev(num);//이전글
		MyBoardVo next=service.next(num);//다음글
		
		String content=vo.getContent();
		//텍스트에리어는 줄바꿈을 \n으로 표현하고 div는 <br>로 표현함
		//div에 보이기 위해서 <br>로 변환하기
		content=content.replaceAll("\n","<br>");
		vo.setContent(content);
		
		//조회수 증가하기
		service.addHit(num);		
		//모델객체에 값담기
		model.addAttribute("vo",vo);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);	
		return "board/detail";//뷰이름리턴하기
	}
}















