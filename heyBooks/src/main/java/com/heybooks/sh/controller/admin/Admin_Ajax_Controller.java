package com.heybooks.sh.controller.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.heybooks.sh.service.board.Board_Service;
import com.heybooks.sh.service.member.Member_Service;
import com.heybooks.sh.util.PageUtil;
import com.heybooks.sh.vo.member.Push_Vo;

@Controller
public class Admin_Ajax_Controller { 
	@Resource
	Board_Service board_service;
	@Resource
	Member_Service member_service;
	
	// 상품 카테고리 리스트  
	@RequestMapping("/ajax/push_list")
	@ResponseBody
	public HashMap<String, Object> push_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			 								 @RequestParam(value = "rowCount", defaultValue = "5") int rowCount, String cate) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> push_map = new HashMap<String, Object>();
		SimpleDateFormat sdate = new SimpleDateFormat("yyyy.MM.dd"); 
		if (pageNum < 1) 
			pageNum = 1; 
		push_map.put("push_category", cate);
		int totalRowCount = member_service.push_count(push_map); // 전체 글 수 얻어오기
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5); // 페이징처리
		push_map.put("list_arr", "push_date desc");
		push_map.put("startRow", util.getStartRow());
		push_map.put("endRow", util.getEndRow()); 
		List<Push_Vo> push_list = member_service.push_list(push_map);
		List<String> date_list = new ArrayList<String>();
		if(push_list.size()>0) {
			for(Push_Vo vo : push_list) {
				String date_txt = sdate.format(vo.getPush_date());
				date_list.add(date_txt);
			}
		}
		map.put("rowCount", rowCount);
		map.put("cate", cate);
		map.put("date_list", date_list);
		map.put("list", push_list); 
		map.put("util", util);
		return map; 
	}
	
	@RequestMapping("/ajax/push_delete")
	@ResponseBody
	public int cate_list(int push_num, String push_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("push_num", push_num);
		member_service.push_delete(map);
		HashMap<String, Object> push_map = new HashMap<String, Object>();
		push_map.put("push_category", push_id);
		int totalRowCount = member_service.push_count(push_map); // 전체 글 수 얻어오기
		
		return totalRowCount;
	}
	 
}
