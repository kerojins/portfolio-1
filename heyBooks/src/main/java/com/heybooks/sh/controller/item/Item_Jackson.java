package com.heybooks.sh.controller.item;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.vo.item.Item_Cate_Vo;

@Controller
public class Item_Jackson {
	private static final Logger logger = LoggerFactory.getLogger(Item_Jackson.class);
	@Resource 
	Item_Category_Service service;
	@RequestMapping("/jackson/item_cate")
	@ResponseBody
	public List<Item_Cate_Vo> cate_list(String cate_code){
		logger.info("get Item-cate-list");
		List<Item_Cate_Vo> clist = service.cate_list(cate_code);
		logger.info(String.valueOf(clist.size()));
		return clist; 
	}
}
