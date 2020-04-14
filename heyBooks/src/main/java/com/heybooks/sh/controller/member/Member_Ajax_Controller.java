package com.heybooks.sh.controller.member;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.heybooks.sh.service.board.Board_Service;
import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.service.item.Item_Order_Service;
import com.heybooks.sh.service.member.Member_Service;
import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.item.Item_Vo;
import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Wishlist_Vo;

@Controller 
public class Member_Ajax_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Member_Ajax_Controller.class);
	@Resource
	private Member_Service service;
	@Resource
	private Board_Service board_service;
	@Resource
	private Item_Order_Service order_service;
	@Resource
	private Item_Main_Service item_service;
	@Resource
	private Item_Category_Service cate_service;
	
	@RequestMapping("/member_getinfo")  
	@ResponseBody
	public Member_Vo member_getinfo(int members_num) {
		logger.info("json/get member-getinfo");
		Member_Vo vo = service.getInfo(members_num);
		return vo; 
	}
	
	@RequestMapping("/ajax/user_detail")  
	@ResponseBody
	public HashMap<String, Object> user_detail(int num) {
		logger.info("json/get user-detail");
		HashMap<String, Object> search_map = new HashMap<String, Object>();
		search_map.put("members_num", num);
		int order_cnt = order_service.order_count(search_map);
		int review_cnt = board_service.review_count(search_map);
		search_map.put("counsel_answer", "답변대기");
		int counsel_cnt = board_service.counsel_count(search_map);
		HashMap<String, Object> map = new HashMap<String, Object>();
		Member_Vo vo = service.getInfo(num);
		String cate_name = "";
		// 회원 선호 카테고리 이름화
		if(vo.getMembers_favorite() != null) {  
			String[] favor_arr = vo.getMembers_favorite().split(",");
			for(String arr : favor_arr) {
				int cate_code = Integer.parseInt(arr);
				String name = cate_service.cate_info(cate_code).getCate_name();
				cate_name += name + ", ";
			}
			cate_name = cate_name.substring(0, cate_name.length()-2);
			vo.setMembers_favorite(cate_name);
		}else {
			vo.setMembers_favorite("없음");
		} 
		
		map.put("vo", vo);
		map.put("counsel_cnt", counsel_cnt);
		map.put("review_cnt", review_cnt);
		map.put("order_cnt", order_cnt); 
		return map; 
	}
	
	//위시리스트 한개만 추가
	@RequestMapping("/wishlist_insert")
	@ResponseBody
	public String wishlist_insert(int product_num, HttpServletRequest request) {
		logger.info("get cart-insert");
		HttpSession session = request.getSession();
		Member_Vo member_vo = (Member_Vo) session.getAttribute("member");
		if (member_vo == null) {
			return "not login";
		} else {
			Wishlist_Vo vo = new Wishlist_Vo(0, member_vo.getMembers_num(), product_num, null);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("members_num", vo.getMembers_num());
			List<Wishlist_Vo> cart_list = service.wishlist_list(map);
			 for(Wishlist_Vo wish_vo : cart_list) {
				 if(wish_vo.getProduct_num() == product_num) {
					 return "overlap";
				 }  
			 }
			service.wishlist_insert(vo);
		}
		return "ok"; 
	}

	// 위시리스트 여러개 추가
	@RequestMapping(value = "/wish_multiple_insert", method = RequestMethod.POST ,produces ="application/text; charset=utf8")
	@ResponseBody
	public String wish_multiple_insert(HttpServletRequest request) {
		logger.info("get cart-multiple-insert"); 
		String[] item_checking = request.getParameterValues("item_checking");
		String item_name = "";
		boolean item_remove = false;
		boolean item_return = false;
		if(item_checking != null) {
			HttpSession session = request.getSession();
			List<String> item_check = new ArrayList<String>(Arrays.asList(item_checking)); 
			logger.info(item_check.toString());
			Member_Vo member_vo = (Member_Vo) session.getAttribute("member");
			if (member_vo == null) { 
				return "not login"; 
			} else {  
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("members_num", member_vo.getMembers_num());
				List<Wishlist_Vo> wishlist_list = service.wishlist_list(map);
				logger.info(wishlist_list.toString()); 
				for(int i =  item_check.size()-1; i >= 0; i--) { //위시리스트 추가 전 아이템 확인하기
					item_remove = false;
					 for(Wishlist_Vo vo : wishlist_list) {
						 if(vo.getProduct_num() == Integer.parseInt(item_check.get(i))) {
							 item_remove = true;
							 item_return = true;
							 Item_Vo item_vo = item_service.item_getinfo(vo.getProduct_num());
							 item_name += item_vo.getProduct_name()+", "; 
						 } 
					 }  
					 if(item_remove) {
						 item_check.remove(i);
					 }else{
						 service.wishlist_insert
						 (new Wishlist_Vo(0, member_vo.getMembers_num(), Integer.parseInt(item_check.get(i)), null));
					 }
				 }
			} 
		}
		 if(item_return) {
		     item_name = item_name.substring(0, item_name.length()-2);
			 return item_name; // 기존상품 존재 시 상품이름 반환
		 }else{    
			 return "wishlist_add_ok"; 
		 }   
		}
	 
}
