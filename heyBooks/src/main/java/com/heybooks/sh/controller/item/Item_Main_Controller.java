package com.heybooks.sh.controller.item;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.heybooks.sh.controller.admin.Admin_controller;
import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.vo.item.Item_Editor_Vo;
import com.heybooks.sh.vo.item.Item_Vo;

@Controller
public class Item_Main_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Admin_controller.class);
    @Resource   
    Item_Category_Service cate_service;
	// ��ǰ - �߰� 
	@RequestMapping(value = "/admin_item_add", method = RequestMethod.GET)
	public String admin_item_add(Model model) {
		logger.info("get item-add");
		// �۰� ����Ʈ ����
		List<Item_Editor_Vo> editor_list = cate_service.editor_list();
		model.addAttribute("editor_list",editor_list);
		
		// ���ǻ� ����Ʈ ����
		List<String> publishing_list = cate_service.publishing_list();
		model.addAttribute("publishing_list",publishing_list);
		return ".admin.admin_item_add";
	}
	
	@RequestMapping(value = "/admin_item_add", method = RequestMethod.POST)
	public String admin_item_add(Item_Vo vo) {
		
		return "redirect:/admin_item_list";
	}
 
}
