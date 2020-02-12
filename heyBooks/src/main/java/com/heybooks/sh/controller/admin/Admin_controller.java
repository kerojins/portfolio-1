package com.heybooks.sh.controller.admin;

import java.io.Console;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.heybooks.sh.service.admin.Admin_Service;
import com.heybooks.sh.service.board.Board_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.service.item.Item_Order_Service;
import com.heybooks.sh.vo.admin.Admin_Alert_Vo;
import com.heybooks.sh.vo.admin.Admin_Vo;
import com.heybooks.sh.vo.board.Counsel_Vo;
import com.heybooks.sh.vo.board.Event_Vo;
import com.heybooks.sh.vo.board.Notice_Vo;
import com.heybooks.sh.vo.board.Review_Vo;

@Controller
public class Admin_controller {
	private static final Logger logger = LoggerFactory.getLogger(Admin_controller.class);
	@Resource
	private Admin_Service service;
	@Resource
	private Board_Service board_service;
	@Resource
	private Item_Order_Service order_service;
	@Resource
	private Item_Main_Service item_service;
	
	
	

 
	@Autowired
	BCryptPasswordEncoder passEncoder;


	// 1. 관리자 - 로그인 검사
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin_login() {
		logger.info("get admin-login");
		return ".admin.admin_login";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String admin_login(String admin_id, String admin_password, Model model, HttpServletRequest request)
			throws Exception {
		logger.info("post admin-login");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("admin_id", admin_id);
		map.put("admin_password", admin_password);
		Admin_Vo login = service.login(map);
		HttpSession session = request.getSession();
		if (login != null) { 
			session.setAttribute("admin", login);
			return "redirect:/admin_main"; 
		}else{
			session.setAttribute("admin", null);
			model.addAttribute("msg", "아이디나 비밀번호가 올바르지 않습니다.");
			return ".admin.admin_login";
		}
	}

	// 2. 관리자 - 로그아웃
	@RequestMapping(value = "/admin_logout", method = RequestMethod.GET)
	public String admin_logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/admin";
	} 
	
	// 관리자 홈
	@RequestMapping(value = "/admin_main", method = RequestMethod.GET)
	public String item_contoller(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(); // 세션얻어오기
		if ((session.getAttribute("admin") == null)) {
			return "redirect:/admin";
		} 
		HashMap<String, Object> e_map = new HashMap<String, Object>();
		e_map.put("list_arr", "event_date");
		HashMap<String, Object> n_map = new HashMap<String, Object>();
		n_map.put("list_arr", "notice_date");
		HashMap<String, Object> c_map = new HashMap<String, Object>();
		c_map.put("list_arr", "counsel_date");
		HashMap<String, Object> r_map = new HashMap<String, Object>();
		r_map.put("list_arr", "review_date");
		
		List<Event_Vo> event_list= board_service.event_list(e_map);
		List<Notice_Vo> notice_list= board_service.notice_list(n_map);
		List<Counsel_Vo> counsel_list= board_service.counsel_list(c_map);
		List<Review_Vo> review_list= board_service.review_list(r_map);
		List<HashMap<String, Object>> order_status_list = order_service.order_status();
		List<HashMap<String, Object>> item_status_list = item_service.product_status();
		List<Admin_Alert_Vo> admin_alert_list = service.admin_alert_list();
		int new_item_cnt = item_service.new_item();
		int stock_item_cnt = item_service.stock_item();
		// 주문 상태별 갯수
		int[] order_cnt_arr = new int[6]; 
		int order_total_cnt= 0;
		String[] status_arr = {"결제대기","결제완료","배송준비중","배송중","배송완료","환불"};
		for(HashMap<String, Object> map : order_status_list) {
			Object obj = map.get("ORDER_STATUS");
			Object obj_cnt = map.get("STATUS_CNT");
			String status = obj.toString();
			int cnt = Integer.parseInt(obj_cnt.toString()); 
			for(int i=0; i < status_arr.length; i++) {
				if(status.equals(status_arr[i])) { 
					order_cnt_arr[i] = cnt;
					order_total_cnt += cnt;
				}else if(!(status.equals(status_arr[i]))) {
					order_cnt_arr[i] = 0; 
				}
			} 
		} 
		
		// 아이템 상태별 갯수
		int[] item_cnt_arr = new int[3];
		int item_total_cnt= 0;
		String[] item_status_arr = {"정상","판매중지","품절"};
		for(HashMap<String, Object> map : item_status_list) {
			Object obj = map.get("PRODUCT_STATUS");
			Object obj_cnt = map.get("PRODUCT_CNT");
			String status = obj.toString();
			int cnt = Integer.parseInt(obj_cnt.toString());
			for(int i=0; i < item_status_arr.length; i++) {
				if(status.equals(item_status_arr[i])) { 
					item_cnt_arr[i] = cnt;
					item_total_cnt += cnt;
				}else if(!(status.equals(item_status_arr[i]))) {
					item_cnt_arr[i] = 0; 
				}
			}  
		}   
		
		
		model.addAttribute("event_list", event_list); 
		model.addAttribute("notice_list", notice_list); 
		model.addAttribute("counsel_list", counsel_list);
		model.addAttribute("review_list", review_list); 
		model.addAttribute("admin_alert_list", admin_alert_list); 
		
		model.addAttribute("order_cnt_arr", order_cnt_arr);  
		model.addAttribute("order_total_cnt", order_total_cnt);  
		model.addAttribute("item_cnt_arr", item_cnt_arr);  
		model.addAttribute("item_total_cnt", item_total_cnt);  
		model.addAttribute("new_item_cnt", new_item_cnt);  
		model.addAttribute("stock_item_cnt", stock_item_cnt);  
		  
		return ".admin.admin_main"; 
	} 





}
