package com.heybooks.sh.controller.item;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.service.item.Item_Order_Service;
import com.heybooks.sh.service.member.Member_Service;
import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;
import com.heybooks.sh.vo.item.Item_Vo;
import com.heybooks.sh.vo.item.Order_Item_Vo;
import com.heybooks.sh.vo.item.Order_Vo;
import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;

@Controller
public class Item_Order_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Item_Order_Controller .class);
	@Resource
	private Item_Category_Service cate_service;
	@Resource
	private Item_Order_Service order_service;
	@Resource
	private Item_Main_Service service;
	@Resource
	private Member_Service member_service;
	
	// 장바구니 리스트
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model, HttpServletRequest request) {
		logger.info("get cart-list");
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
			logger.info(cart_list.toString());
			model.addAttribute("item_list", item_list); 
			model.addAttribute("cart_list", cart_list); 
			model.addAttribute("editor_name", editor_name);
		}
		return ".order.cart"; 
	}
	@RequestMapping(value = "/cart_update", method = RequestMethod.GET)
	public String cart_update(int cart_item_num , int cart_item_quantity) {
		logger.info("get cart-update");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cart_item_num", cart_item_num);
		map.put("cart_item_quantity", cart_item_quantity);
		order_service.cart_update(map);
		return "redirect:/cart";
	} 
	@RequestMapping(value = "/cart_delete", method = RequestMethod.GET)
	public String cart_delete(int cart_item_num) {
		logger.info("get cart-delete");
		order_service.cart_delete(cart_item_num);
		return "redirect:/cart";
	} 
	@RequestMapping(value = "/cart_delete", method = RequestMethod.POST)
	public String cart_delete(String cart_ck_list) {
		logger.info("post cart-list");
			if(cart_ck_list != null) {
			String[] del_arr = cart_ck_list.split(",");
			for(String cart_item_num : del_arr) {
				order_service.cart_delete(Integer.parseInt(cart_item_num));
			}
		} 
		return "redirect:/cart";
	} 
	// 주문 페이지 
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order(int product_num, int item_count, Model model, HttpServletRequest request) {
		logger.info("get order-page");
		Item_Vo vo = service.item_getinfo(product_num);
		String editor = cate_service.editor_getinfo(vo.getProduct_editor_num()).getEditor_name(); //작가 이름
		HttpSession session = request.getSession();
		Member_Vo mem_vo = (Member_Vo)session.getAttribute("member");
		Member_Vo member_vo = member_service.getInfo(mem_vo.getMembers_num()); //주문자 정보 담기
		List<Mileage_Vo> mile_list = member_service.mileage_getinfo(mem_vo.getMembers_num()); // 마일리지 정보 담기
		Mileage_Vo mileage_vo = mile_list.get(0);
		String[] phone = member_vo.getMembers_phone_number().split("-"); // 휴대폰 번호 배열생성
		model.addAttribute("phone", phone); 
		if (member_vo.getMembers_add_number() != null) { // 전화번호 배열생성
			String[] add_number = member_vo.getMembers_add_number().split("-");
			model.addAttribute("add_number", add_number); 
		} 
		model.addAttribute("one_info", vo);
		model.addAttribute("item_count", item_count); 
		model.addAttribute("editor", editor); 
		model.addAttribute("member_vo", member_vo); // 주문자 정보
		model.addAttribute("mileage_vo", mileage_vo); //주문자 적립 정보
		return ".order.order";
	} 
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String order(String cart_ck_list, String qnt, int count_subject_val, int count_num_val, String total_count_val, String item_total_price_val,String parcel_val , String total_price_val, String mileage_val, Model model , HttpServletRequest request) {
		logger.info("post order-page");
		String[] qnt_arr = qnt.split(",");
		String[] cart_arr = cart_ck_list.split(",");
		HttpSession session = request.getSession();
		Member_Vo mem_vo = (Member_Vo)session.getAttribute("member");
		Member_Vo member_vo = member_service.getInfo(mem_vo.getMembers_num()); //주문자 정보 담기
		List<Mileage_Vo> mile_list = member_service.mileage_getinfo(mem_vo.getMembers_num()); // 마일리지 정보 담기
		Mileage_Vo mileage_vo = mile_list.get(0);
		logger.info (mile_list.toString());
		String[] phone = member_vo.getMembers_phone_number().split("-"); // 휴대폰 번호 배열생성
		model.addAttribute("phone", phone);
		if (member_vo.getMembers_add_number() != null) { // 전화번호 배열생성
			String[] add_number = member_vo.getMembers_add_number().split("-");
			model.addAttribute("add_number", add_number); 
		} 
		List<Cart_Vo> cart_list = new ArrayList<Cart_Vo>();
		List<Item_Vo> item_list = new ArrayList<Item_Vo>();
		List<Item_Editor_Vo> editor_list = new ArrayList<Item_Editor_Vo>();
		for(String cart_num: cart_arr) {
			cart_list.add(order_service.cart_getinfo(Integer.parseInt(cart_num)));
		}
		for(Cart_Vo cart_vo : cart_list) {
			item_list.add(service.item_getinfo(cart_vo.getProduct_num()));
		}
		for(Item_Vo vo : item_list) {
			editor_list.add(cate_service.editor_getinfo(vo.getProduct_editor_num()));
		} 
		model.addAttribute("list",item_list); 
		model.addAttribute("one_info",item_list.get(0));  
		model.addAttribute("editor_list",editor_list);    
		model.addAttribute("qnt", qnt_arr); // 상품 개별 수량 리스트
		model.addAttribute("item_count", qnt_arr[0]); // 상품 개별 수량 리스트
		model.addAttribute("count_num_val", count_num_val); // 상품 총 갯수 리스트
		model.addAttribute("count_subject_val", count_subject_val); // 상품 총 종류 리스트
		model.addAttribute("total_count_val", total_count_val); // 총수량
		model.addAttribute("parcel_val", parcel_val); // 배송비 
		model.addAttribute("item_total_price_val", item_total_price_val); // 총아이템 금액
		model.addAttribute("total_price_val", total_price_val); // 총금액
		model.addAttribute("mileage_val", mileage_val); //총적립금
		model.addAttribute("member_vo", member_vo); //주문자 정보
		model.addAttribute("mileage_vo", mileage_vo); //주문자 적립 정보
		return ".order.order"; 
	} 
	@RequestMapping(value= "/order_insert", method=RequestMethod.POST)
	public String order_add(Order_Vo order_vo, Order_Item_Vo order_item_vo, String product_num, String get_mileage, String use_mileage) {
		int order_num = (int) (Math.random() * 1000000000) + 1;
		order_vo.setOrder_num(order_num); // 주문번호 랜덤값 생성 
		order_vo.setOrder_phone_number(order_vo.getOrder_phone_number().replace(",", "-"));
		order_vo.setOrder_add_number(order_vo.getOrder_add_number().replace(",", "-"));
		order_vo.getOrder_message().replaceAll("<br>","\r\n");
		order_service.order_insert(order_vo);
		logger.info(order_vo.toString()); 
		int use_mile = Integer.parseInt(use_mileage) * -1; 
		int get_mile = Integer.parseInt(get_mileage);
		List<Mileage_Vo> mile_list = member_service.mileage_getinfo(order_vo.getMembers_num()); // 마일리지 정보 담기
		Mileage_Vo mileage_vo = mile_list.get(0);
		int total_mile = 0; 
		if(mileage_vo != null) {
			total_mile = mileage_vo.getMileage_total();
		}  
		total_mile = total_mile + use_mile;
		member_service.mileage_insert(new Mileage_Vo(0,order_num, order_vo.getMembers_num(), use_mile, total_mile, null));
		total_mile = total_mile + get_mile; 
		member_service.mileage_insert(new Mileage_Vo(0,order_num, order_vo.getMembers_num(), get_mile, total_mile, null));
		
		 
		//주문 아이템 항목 추가
		order_item_vo.setOrder_num(order_num);
		
		String[] order_product_num_arr = product_num.split(",");
		String[] order_item_quantity_arr = order_item_vo.getOrder_item_quantity().split(",");
		if(order_product_num_arr.length >=2) {
			order_item_vo.setOrder_item_price(order_item_vo.getOrder_item_price().substring(0, order_item_vo.getOrder_item_price().length()-2)); //뒤에 /, 날려주기
		} 
		String[] order_item_price = order_item_vo.getOrder_item_price().split("/,");
		for(int i = 0 ; i < order_product_num_arr.length ; i++) {
			order_item_vo.setProduct_num(Integer.parseInt(order_product_num_arr[i]));
			order_item_vo.setOrder_item_quantity(order_item_quantity_arr[i]);
			order_item_vo.setOrder_item_price(order_item_price[i]);
			logger.info(order_item_vo.toString());
			order_service.order_item_insert(order_item_vo);
		}
		
		
		return "redirect:/";  
	}
 
}
