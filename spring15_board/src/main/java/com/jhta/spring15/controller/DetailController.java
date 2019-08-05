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
		MyBoardVo vo=service.getinfo(num);//�ۻ�����
		MyBoardVo prev=service.prev(num);//������
		MyBoardVo next=service.next(num);//������
		
		String content=vo.getContent();
		//�ؽ�Ʈ������� �ٹٲ��� \n���� ǥ���ϰ� div�� <br>�� ǥ����
		//div�� ���̱� ���ؼ� <br>�� ��ȯ�ϱ�
		content=content.replaceAll("\n","<br>");
		vo.setContent(content);
		
		//��ȸ�� �����ϱ�
		service.addHit(num);		
		//�𵨰�ü�� �����
		model.addAttribute("vo",vo);
		model.addAttribute("prev",prev);
		model.addAttribute("next",next);	
		return "board/detail";//���̸������ϱ�
	}
}















