package com.heybooks.sh.controller.item;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.service.item.Item_Order_Service;
import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.item.Item_Vo;
import com.heybooks.sh.vo.member.Member_Vo;

@Controller
public class Item_Order_Controller {
	@Resource
	Item_Category_Service cate_service;
	@Resource
	Item_Order_Service order_service;
	@Resource
	Item_Main_Service service;
	
	// 장바구니
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member_Vo member_vo = (Member_Vo)session.getAttribute("member");
		if(member_vo != null) {
			List<Cart_Vo> cart_list = order_service.cart_list(member_vo.getMembers_num());
			List<Item_Vo> item_list = new ArrayList<Item_Vo>();
			List<String> editor_name = new ArrayList<String>();
			for(Cart_Vo vo : cart_list) { //장바구니 리스트 목록 삽입
				item_list.add(service.item_getinfo(vo.getProduct_num())); 
			}
			for(Item_Vo vo : item_list) { //작가 이름 리스트 추가
				editor_name.add(cate_service.editor_getinfo(vo.getProduct_editor_num()).getEditor_name()); 
			} 
			model.addAttribute("item_list", item_list); 
			model.addAttribute("cart_list", cart_list); 
			model.addAttribute("editor_name", editor_name);
		}
		return ".order.cart"; 
	}
 
 
	// 주문 페이지
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order() {
		return ".order.order";
	}
}
