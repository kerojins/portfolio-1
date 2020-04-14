package com.heybooks.sh.controller.member;

import java.lang.reflect.Member;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;import org.springframework.web.servlet.mvc.condition.ProducesRequestCondition;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.heybooks.sh.service.board.Board_Service;
import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.service.item.Item_Order_Service;
import com.heybooks.sh.service.member.Member_Service;
import com.heybooks.sh.util.PageUtil;
import com.heybooks.sh.vo.board.Event_Vo;
import com.heybooks.sh.vo.board.Review_Vo;
import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;
import com.heybooks.sh.vo.item.Item_Vo;
import com.heybooks.sh.vo.item.Order_Item_Vo;
import com.heybooks.sh.vo.item.Order_Vo;
import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;
import com.heybooks.sh.vo.member.New_Item_Notice_Vo;
import com.heybooks.sh.vo.member.Push_Vo;
import com.heybooks.sh.vo.member.Today_View_Vo;
import com.heybooks.sh.vo.member.Wishlist_Vo;

@Controller
public class Member_Controller {

	private static final Logger logger = LoggerFactory.getLogger(Member_Controller.class);

	@Resource
	private Member_Service service;
	@Resource
	private Item_Main_Service item_service;
	@Resource
	private Item_Category_Service cate_service;
	@Resource
	private Board_Service board_service;
	@Resource
	private Item_Order_Service order_service;
	@Autowired
	BCryptPasswordEncoder passEncoder;

	// 1. ȸ�� ����
	@RequestMapping(value = "/member_join", method = RequestMethod.GET)
	public String join(Model model) {
		logger.info("get member-join");
		HashMap<String, Object> cate_map = new HashMap<String, Object>(); 
		cate_map.put("cate_code", "100");
		List<Item_Cate_Vo> domestic_vo = cate_service.cate_list(cate_map);
		model.addAttribute("domestic_vo",domestic_vo);
		return ".registration.join";
	}
 
	@RequestMapping(value = "/member_join", method = RequestMethod.POST)
	public String join(Member_Vo vo) {
		logger.info("post member-join");

		String inputPass = vo.getMembers_password(); // ��й�ȣ ��ȣȭ
		String password = passEncoder.encode(inputPass);
		vo.setMembers_password(password);

		String[] member_years = vo.getMembers_years().split(","); // �������, ��������
		vo.setMembers_years(member_years[0]);
		if (member_years[1].equals("2")) {
			vo.setMembers_gender("����");
		} else {
			vo.setMembers_gender("����");
		}

		String member_phone = vo.getMembers_phone_number().replace(",", "-"); // �ڵ��� ��ȣ "-"��ȯ
		vo.setMembers_phone_number(member_phone);

		String member_email = vo.getMembers_email().replace(",", "@"); // �̸��� "@"�߰�
		vo.setMembers_email(member_email);

		String member_add_number = vo.getMembers_add_number().replace(",", "-"); // �߰� ����ó "-"��ȯ
		vo.setMembers_add_number(member_add_number);

		if (vo.getMembers_favorite() == null) {
			String members_favorite = "";
			vo.setMembers_favorite(members_favorite);
		}
		try {
			service.join(vo);
			return "redirect:/member_login";
		} catch (Exception e) {
			return ".registration.alert";
		}

	}

	// 2. ȸ�� �α���
	@RequestMapping(value = "/member_login", method = RequestMethod.GET)
	public String login() {
		logger.info("get member-login");
		return ".registration.login";
	}

	@RequestMapping(value = "/member_login", method = RequestMethod.POST)
	public String login(Member_Vo vo, HttpServletRequest request, RedirectAttributes rttr) {
		logger.info("post member-login");
		Member_Vo login = service.login(vo);
		HttpSession session = request.getSession();
		boolean passMatch = passEncoder.matches(vo.getMembers_password(), login.getMembers_password());
		if (login != null && passMatch) {
			session.setAttribute("member", login);
			return "redirect:/";
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", "���̵� ��й�ȣ�� �ٽ� �Է����ּ���");
			return "redirect:/member_login";
		}
	}
	// ȸ�� �α� �ƿ�
	@RequestMapping(value = "/member_logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		logger.info("post member-logout");
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	// 3. ȸ�� ���� ����
	@RequestMapping(value = "/member_update", method = RequestMethod.GET)
	public String update(int members_num, Model model) {
		Member_Vo vo = service.getInfo(members_num);
		if (vo != null) {
			logger.info(vo.toString());
			model.addAttribute("vo", vo);
			String[] phone = vo.getMembers_phone_number().split("-"); // �޴��� ��ȣ �迭����
			model.addAttribute("phone", phone);
			String[] email = vo.getMembers_email().split("@"); // �̸��� �迭 ����			
			model.addAttribute("email", email);
			
			if (vo.getMembers_add_number() != null) { // ��ȭ��ȣ �迭����
				String[] add_number = vo.getMembers_add_number().split("-");
				model.addAttribute("add_number", add_number);
			} 
			if (vo.getMembers_gender().equals("����")) { // ������� ���� ���й�ȣ
				model.addAttribute("gender", "2");
			} else {
				model.addAttribute("gender", "1");
			} 
			HashMap<String, Object> cate_map = new HashMap<String, Object>(); 
			cate_map.put("cate_code", "100");
			List<Item_Cate_Vo> domestic_vo = cate_service.cate_list(cate_map);
			model.addAttribute("domestic_vo",domestic_vo);
			 
			return ".registration.modification";
		} else {
			return ".registration.alert";
		}
	}

	@RequestMapping(value = "/member_update", method = RequestMethod.POST)
	public String update(Member_Vo vo) {
		logger.info("post member-update");

		String inputPass = vo.getMembers_password(); // ��й�ȣ ��ȣȭ
		String password = passEncoder.encode(inputPass);
		vo.setMembers_password(password);

		String[] member_years = vo.getMembers_years().split(","); // �������, ��������
		vo.setMembers_years(member_years[0]);
		if (member_years[1].equals("2")) {
			vo.setMembers_gender("����");
		} else {
			vo.setMembers_gender("����");
		}

		String member_phone = vo.getMembers_phone_number().replace(",", "-"); // �ڵ��� ��ȣ "-"��ȯ
		vo.setMembers_phone_number(member_phone);

		String member_email = vo.getMembers_email().replace(",", "@"); // �̸��� "@"�߰�
		vo.setMembers_email(member_email);

		String member_add_number = vo.getMembers_add_number().replace(",", "-"); // �߰� ����ó "-"��ȯ
		vo.setMembers_add_number(member_add_number);

		if (vo.getMembers_favorite() == null) {
			String members_favorite = "";
			vo.setMembers_favorite(members_favorite);
		}

		try {
			service.update(vo);
			return "redirect:/mypage";
		} catch (Exception e) {
			return ".registration.alert";
		} 
	}
	
	// ȸ�� �������
		@RequestMapping(value = "/member_search", method = RequestMethod.POST)
		public String member_search(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "rowCount", defaultValue = "10") int rowCount,  Model model, HttpServletRequest request,
									@RequestParam(value = "list_arr", defaultValue = "members_regdate") String list_arr, String keyword, String birth_date, String birth_end_date, String join_date, String join_end_date ,String mile_start, String mile_end, String order_start, 
									String order_end, String review_start, String review_end, String members_gender) {
			HashMap<String, Object> map = new HashMap<String, Object>(); 
			map.put("list_arr", list_arr);
			if(keyword != null && !(keyword.equals(""))) {
				map.put("keyword", keyword);
			} 
			if(birth_date != null && !(birth_date.equals(""))) {
				map.put("birth_date", birth_date); 
			}
			if(birth_end_date != null && !(birth_end_date.equals(""))) {
				map.put("birth_end_date", birth_end_date); 
			} 
			if(join_date != null && !(join_date.equals(""))) {
				map.put("join_date", join_date);
			} 
			if(join_end_date != null && !(join_end_date.equals(""))) {
				map.put("join_end_date", join_end_date);
			}  
			if(mile_start != null && !(mile_start.equals(""))) {
				map.put("mile_start", mile_start);
			} 
			if(mile_end != null && !(mile_end.equals(""))) {
				map.put("mile_end", mile_end);  
			} 
			int totalRowCount = service.member_count(map); // ��ü �� �� ���
			if(pageNum<1) pageNum = 1;
			PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5); // ����¡ó��
			map.put("startRow", util.getStartRow());
			map.put("endRow", util.getEndRow());
			List<Member_Vo> member_list = service.member_list(map);
			List<Mileage_Vo> mile_list = new ArrayList<Mileage_Vo>();
			logger.info(member_list.toString());
			HashMap<String, Object> mile_map = new HashMap<String, Object>();
			for(Member_Vo vo : member_list) { 
				mile_map.put("members_num", vo.getMembers_num());
				mile_list.add(service.mileage_getinfo(mile_map).get(0));
			}
			model.addAttribute("keyword", keyword); 
			model.addAttribute("totalRowCount", totalRowCount);
			model.addAttribute("rowCount", rowCount);
			model.addAttribute("list_arr", list_arr);
			model.addAttribute("member_list", member_list);
			model.addAttribute("mile_list", mile_list);
			model.addAttribute("util", util);
			return ".admin.admin_user_list"; 
		}
		  
	
	// ȸ�� �������
	@RequestMapping(value = "/admin_user_list", method = RequestMethod.GET)
	public String admin_item_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
								  @RequestParam(value = "rowCount", defaultValue = "10") int rowCount,  Model model, HttpServletRequest request,
							 	  @RequestParam(value = "list_arr", defaultValue = "members_regdate") String list_arr, String keyword, String birth_date, String birth_end_date, String join_date, String join_end_date ,String mile_start, String mile_end, String order_start, 
							 	  String order_end, String review_start, String review_end, String members_gender, String members_status, String members_today) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("list_arr", list_arr);
		if(keyword != null && !(keyword.equals(""))) {
			map.put("keyword", keyword); 
		}
		if(members_status != null && !(members_status.equals(""))) {
			map.put("members_status", members_status);  
		}
		if(birth_date != null && !(birth_date.equals(""))) {
			map.put("birth_date", birth_date.replaceAll("-", "")); 
		}
		if(birth_end_date != null && !(birth_end_date.equals(""))) {
			map.put("birth_end_date", birth_end_date.replaceAll("-", "")); 
		} 
		if(join_date != null && !(join_date.equals(""))) {
			map.put("join_date", join_date.replaceAll("-", ""));
		}  
		if(join_end_date != null && !(join_end_date.equals(""))) {
			map.put("join_end_date", join_end_date.replaceAll("-", ""));
		}  
		if(mile_start != null && !(mile_start.equals(""))) {
			map.put("mile_start", mile_start);
		} 
		if(mile_end != null && !(mile_end.equals(""))) {
			map.put("mile_end", mile_end);  
		} 
		if(order_start != null && !(order_start.equals(""))) {
			map.put("order_start", order_start);  
		} 
		if(order_end != null && !(order_end.equals(""))) {
			map.put("order_end", order_end);  
		} 
		if(review_start != null && !(review_start.equals(""))) {
			map.put("review_start", review_start);  
		} 
		if(review_end != null && !(review_end.equals(""))) {
			map.put("review_end", review_end);   
		}  
		if(members_gender != null && !(members_gender.equals(""))) {
			map.put("members_gender", members_gender);   
		}
		
		int totalRowCount = service.member_count(map); // ��ü �� �� ���
		if(pageNum<1) pageNum = 1;
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5); // ����¡ó��
		map.put("startRow", util.getStartRow());
		map.put("endRow", util.getEndRow());
		List<Member_Vo> member_list = service.member_list(map);
		List<Integer> mile_list = new ArrayList<Integer>();
		logger.info(member_list.toString());
		HashMap<String, Object> mile_map = new HashMap<String, Object>();
		for(Member_Vo vo : member_list) { 
			// ȸ�� ���ϸ��� ���
			mile_map.put("members_num", vo.getMembers_num());
			if(service.mileage_getinfo(mile_map).size() > 0){
				mile_list.add(service.mileage_getinfo(mile_map).get(0).getMileage_total());
			}else {   
				mile_list.add(0); 
			} 
			
		}
		 
		model.addAttribute("keyword", keyword);   
		model.addAttribute("birth_date", birth_date); 
		model.addAttribute("birth_end_date", birth_end_date); 
		model.addAttribute("join_date", join_date);
		model.addAttribute("join_end_date", join_end_date);
		model.addAttribute("mile_start", mile_start);
		model.addAttribute("mile_end", mile_end);  
		 
		model.addAttribute("totalRowCount", totalRowCount);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("list_arr", list_arr);
		model.addAttribute("member_list", member_list);
		model.addAttribute("mile_list", mile_list);
		model.addAttribute("util", util);
		return ".admin.admin_user_list"; 
	}
	  
	// ����������
	@RequestMapping(value = "/user_list_update", method = RequestMethod.GET)
	public String user_list_update(String select_ck_num, String members_num) {
		if(select_ck_num !=null) { // ȸ�� ���� ���߼���
			String[] user_arr = select_ck_num.split(","); 
			for(String user_num : user_arr) {
				service.member_list_update(Integer.parseInt(user_num));
			}
		} 
		if(members_num != null) { // �ϳ��� ����
			service.member_list_update(Integer.parseInt(members_num));
		}  
		 
		return "redirect:/admin_user_list";
	}

	// ���������� - ���ø���Ʈ
	@RequestMapping(value = "/mypage_wishlist", method = RequestMethod.GET)
	public String mypage_wishlist(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "rowCount", defaultValue = "10") int rowCount, @RequestParam(value = "list_arr", defaultValue = "wishlist_date") String list_arr,
								 HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member_Vo vo = (Member_Vo)session.getAttribute("member");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("members_num", vo.getMembers_num());
		int totalRowCount = service.wishlist_count(map); // ��ü �� �� ���
		if(pageNum<1) pageNum = 1;
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5); // ����¡ó��
		map.put("list_arr", list_arr);
		map.put("startRow", util.getStartRow());
		map.put("endRow", util.getEndRow());
		List<Wishlist_Vo> wishlist_list = service.wishlist_list(map);
		
		if(wishlist_list.size() > 0) {
			List<Item_Vo> wish_item_list = new ArrayList<Item_Vo>();
			List<String> editor_name_list = new ArrayList<String>();
			for(Wishlist_Vo wish_vo : wishlist_list) { 
				Item_Vo item_vo =  item_service.item_getinfo(wish_vo.getProduct_num ());
				wish_item_list.add(item_vo);
				editor_name_list.add(cate_service.editor_getinfo(item_vo.getProduct_editor_num()).getEditor_name());
			}
			model.addAttribute("wish_item_list", wish_item_list);
			model.addAttribute("editor_name_list", editor_name_list);
		}
		model.addAttribute("util", util);
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("list_arr", list_arr);
		return ".member.mypage_wishlist";
	}
	 
	// ���������� - ���ø���Ʈ ����
	@RequestMapping(value = "/wishlist_delete", method = RequestMethod.GET)
	public String wishlist_delete(String product_num, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member_Vo vo = (Member_Vo)session.getAttribute("member");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("members_num", vo.getMembers_num());
		map.put("product_num", Integer.parseInt(product_num));
		service.wishlist_delete(map);
		return "redirect:/mypage_wishlist"; 
	} 
	// ���������� - ���ø���Ʈ  ���� ����
	@RequestMapping(value = "/wishlist_delete", method = RequestMethod.POST)
	public String wishlist_delete(String[] item_checking, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member_Vo vo = (Member_Vo)session.getAttribute("member");
		int members_num = vo.getMembers_num();
		for(String product_num : item_checking) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("members_num", members_num);
			map.put("product_num", Integer.parseInt(product_num));
			service.wishlist_delete(map);
		}
		return "redirect:/mypage_wishlist"; 
	} 
	
	// ���������� - �������
	@RequestMapping(value = "/mypage_review", method = RequestMethod.GET)
	public String mypage_review(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "rowCount", defaultValue = "10") int rowCount, @RequestParam(value = "list_arr", defaultValue = "review_date") String list_arr,Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member_Vo vo = (Member_Vo)session.getAttribute("member");
		int members_num = 0; 
		if(vo != null) {
			members_num = vo.getMembers_num();
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("members_num", members_num);
		int totalRowCount = service.wishlist_count(map); // ��ü �� �� ���
		if(pageNum<1) pageNum = 1;
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5); // ����¡ó��
		map.put("startRow", util.getStartRow());
		map.put("endRow", util.getEndRow());
		List<Review_Vo> review_list = board_service.review_list(map);
		if(review_list.size() > 0) { 
			List<Item_Vo> item_list = new ArrayList<Item_Vo>();
			for(Review_Vo review_vo : review_list) {
				item_list.add(item_service.item_getinfo(review_vo.getProduct_num()));
			} 
			model.addAttribute("review_list", review_list);
			model.addAttribute("item_list", item_list);
		}
		model.addAttribute("rowCount", rowCount);
		model.addAttribute("list_arr", list_arr);
		model.addAttribute("util", util);
		
		return ".member.mypage_review"; 
	} 
	// ���������� - �ֹ� ���
	@RequestMapping(value = "/mypage_order", method = RequestMethod.GET)
	public String mypage_order(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
							   @RequestParam(value = "rowCount", defaultValue = "10") int rowCount,
							   @RequestParam(value = "list_arr", defaultValue = "order_date") String list_arr,  String search_date, String search_end_date, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member_Vo vo = (Member_Vo)session.getAttribute("member");
		int members_num = 0; 
		if(vo != null) { 
			members_num = vo.getMembers_num();
		}
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("members_num", members_num);
		if(search_date != null && !(search_date.equals(""))) {
			map.put("search_date", search_date.replaceAll("-", ""));  
		}  
		if(search_end_date != null && !(search_end_date.equals(""))) {
			map.put("search_end_date", search_end_date.replaceAll("-", "")); 
		}   
		int totalRowCount = order_service.order_count(map); // ��ü �� �� ���
		if(pageNum<1) pageNum = 1;
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5); // ����¡ó��
		map.put("list_arr", list_arr);
		map.put("startRow", util.getStartRow());
		map.put("endRow", util.getEndRow());
		List<HashMap<String, Object>> order_view_list = order_service.order_view_list(map);
		for(HashMap<String, Object> order_map : order_view_list) {
		  Object obj = order_map.get("ORDER_ITEM_NUM");
		  Order_Item_Vo order_item_vo = order_service.order_item_detail(obj);
		  Item_Vo item_vo = item_service.item_getinfo(order_item_vo.getProduct_num());
		  if(item_vo != null && item_vo.getProduct_picture() != null) {
			  System.out.println(item_vo.toString());
			 order_map.put("PRODUCT_IMG",item_service.item_getinfo(order_item_vo.getProduct_num()).getProduct_picture().split(",")[0]);
			 order_map.put("PRODUCT_NAME",item_service.item_getinfo(order_item_vo.getProduct_num()).getProduct_name());
		  }else {
			  order_map.put("PRODUCT_IMG"," ");
			  order_map.put("PRODUCT_NAME",item_service.item_getinfo(order_item_vo.getProduct_num()).getProduct_name());
		  }      
		}  
		model.addAttribute("order_list",order_view_list);
		return ".member.mypage_order"; 
	} 


	// ���������� - �ֹ� ��� ��
	@RequestMapping(value = "/mypage_order_detail", method = RequestMethod.GET)
	public String mypage_order_detail(int order_num, Model model) {
		List<Order_Item_Vo> order_item_list = order_service.order_item_list(order_num);
		List<Item_Vo> item_list = new ArrayList<Item_Vo>();
		List<Item_Editor_Vo> editor_list = new ArrayList<Item_Editor_Vo>();
		HashMap<String, Object> mile_map = new HashMap<String, Object>();
	
		mile_map.put("order_num", order_num);
		List<Mileage_Vo> mile_list = service.mileage_getinfo(mile_map);
		int use_mileage = 0;
		if(mile_list.size()>0) {
			for(Mileage_Vo vo:mile_list) {
				if(vo.getMileage_status() == "���") {
					use_mileage = vo.getMileage_score();
				} 
			} 
		}
		for(Order_Item_Vo vo: order_item_list) {
			Item_Vo item_vo = item_service.item_getinfo(vo.getProduct_num());
			if(item_vo.getProduct_picture() != null) {
				item_vo.setProduct_picture(item_vo.getProduct_picture().split(",")[1]); // �̹��� ����ũ�⸸ ����
			} 
			item_list.add(item_vo); 
			editor_list.add(cate_service.editor_getinfo(item_vo.getProduct_editor_num()));
		}  
		Order_Vo order_vo = order_service.order_detail(order_num); // �ֹ� ����
		Member_Vo member_vo = service.getInfo(order_vo.getMembers_num());
		String[] phone = order_vo.getOrder_phone_number().split("-"); // �޴��� ��ȣ �迭����
		if (member_vo.getMembers_add_number() != null) { // ��ȭ��ȣ �迭����
			String[] add_number = order_vo.getOrder_add_number().split("-");
			model.addAttribute("add_number", add_number); 
		} 
		model.addAttribute("phone", phone); 
		model.addAttribute("order_item_list", order_item_list); 
		model.addAttribute("item_list", item_list);   
		model.addAttribute("editor_list", editor_list); 
		model.addAttribute("member_vo", member_vo);  
		model.addAttribute("use_mileage", use_mileage); 
		model.addAttribute("vo", order_vo);  
		 
		return ".member.mypage_order_detail";
	} 
	// ���������� - �ֹ� ��������� ����
	@RequestMapping(value = "/order_update", method = RequestMethod.POST)
	public String order_update(Order_Vo vo, RedirectAttributes redirect) {
		vo.setOrder_phone_number(vo.getOrder_phone_number().replace(",", "-"));
		if(vo.getOrder_add_number() != null) {
			vo.setOrder_add_number(vo.getOrder_add_number().replace(",", "-"));
		}
		order_service.order_update(vo);
		redirect.addAttribute("order_num", vo.getOrder_num());
		return "redirect:/mypage_order_detail";  
	} 
	@RequestMapping(value = "/order_status_update", method = RequestMethod.GET)
	public String order_status_update(String order_status, int order_num, RedirectAttributes redirect, HttpServletRequest request) {
		Order_Vo vo = order_service.order_detail(order_num); 
		HttpSession session = request.getSession();
		Member_Vo member_vo = (Member_Vo)session.getAttribute("member");
		HashMap<String, Object> mile_map = new HashMap<String, Object>();
		mile_map.put("members_num", member_vo.getMembers_num());
		List<Mileage_Vo> mile_list = service.mileage_getinfo(mile_map); // ���ϸ��� ���� ���
		int total_mile = 0; 
		if(mile_list != null && mile_list.size() > 0) {
			Mileage_Vo mileage_vo = mile_list.get(0);
			total_mile = mileage_vo.getMileage_total(); 
		} 
		System.out.println(vo.toString());
		System.out.println(vo.getTotal_mileage().replaceAll(",", ""));
		int get_mile = Integer.parseInt(vo.getTotal_mileage().replaceAll(",", ""));
		total_mile = total_mile + get_mile; 
		service.mileage_insert(new Mileage_Vo(0,order_num, member_vo.getMembers_num(),  get_mile, total_mile,"����",null));
		
		vo.setOrder_status(order_status);
		order_service.order_status_update(vo); 
		
		
		redirect.addAttribute("order_num", vo.getOrder_num());
		return "redirect:/mypage_order_detail";  
	} 
 
	// ���������� - ���ϸ���
	@RequestMapping(value = "/mypage_mileage", method = RequestMethod.GET)
	public String mypage_mileage(String search_date, String search_end_date, HttpServletRequest request, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		HttpSession session = request.getSession();
		Member_Vo member_vo = (Member_Vo)session.getAttribute("member");
		map.put("members_num", member_vo.getMembers_num());
		if(search_date != null && !(search_date.equals(""))) { // ���ϸ��� �Ⱓ�� �˻�
			map.put("search_date", search_date.replaceAll("-", ""));  
		}  
		if(search_end_date != null && !(search_end_date.equals(""))) {
			map.put("search_end_date", search_end_date.replaceAll("-", "")); 
		}  
		List<List<Mileage_Vo>> monthly_mile_list = new ArrayList<List<Mileage_Vo>>();
		Calendar today = Calendar.getInstance();
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH) + 1;
		String month_txt = "";
		List<Integer> month_val_list = new ArrayList<Integer>();
		for (int i = month; i > 0; i--) {
			month_txt = String.valueOf(year) + "0" + i;
			map.put("monthly", month_txt); 
			List<Mileage_Vo> mile_list = service.mileage_getinfo(map); 
			if(mile_list.size() > 0) { //�ش���� �����ݳ����� ������ ��� 
				monthly_mile_list.add(mile_list);
				month_val_list.add(i); // �� ���� ���
			}   
		}     
		int mileage = 0;
		if(monthly_mile_list.size()>0) {
			mileage = monthly_mile_list.get(0).get(0).getMileage_total(); //���� ������ ���
		}
		model.addAttribute("year", year);
		model.addAttribute("mileage", mileage);
		model.addAttribute("month_val_list", month_val_list);
		model.addAttribute("monthly_mile_list", monthly_mile_list);
		return ".member.mypage_mileage";
	} 
	// ���ϸ��� ����
		@RequestMapping(value = "/mileage_delete", method = RequestMethod.GET)
		public String mileage_delete(int mileage_num, HttpServletRequest request, RedirectAttributes redirect) {
			logger.info("get mileage_delete");
			HttpSession session = request.getSession();
			Member_Vo member_vo = (Member_Vo)session.getAttribute("member");
			redirect.addAttribute("members_num", member_vo.getMembers_num());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("mileage_num", mileage_num); 
			service.milage_delete(map);
			 
			return "redirect:/mypage_mileage";
		}
		
		
	// ���������� - �ֱ� �� ��ǰ
	@RequestMapping(value = "/mypage_recent", method = RequestMethod.GET)
	public String mypage_recent(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
								@RequestParam(value = "rowCount", defaultValue = "10") int rowCount,  Model model, HttpServletRequest request,
								@RequestParam(value = "list_arr", defaultValue = "today_view_date") String list_arr) {
		logger.info("get mypage_recent");
		HttpSession session = request.getSession();
		Member_Vo member_vo = (Member_Vo)session.getAttribute("member");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("members_num", member_vo.getMembers_num());
		map.put("today", "today");
		int totalRowCount = service.today_view_count(map); // ��ü �� �� ���
		if(pageNum<1) pageNum = 1;
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5); // ����¡ó��
		map.put("list_arr", list_arr);
		map.put("startRow", util.getStartRow());
		map.put("endRow", util.getEndRow());
		List<Today_View_Vo> today_view_list = service.today_view_list(map);
		List<Item_Vo> item_list = new ArrayList<Item_Vo>();
		List<String> editor_list = new ArrayList<String>();
		for(Today_View_Vo vo : today_view_list) { // ������ ����Ʈ ä���ֱ�
			Item_Vo item_vo = item_service.item_getinfo(vo.getProduct_num());
			if(item_vo.getProduct_picture() != null) {
				item_vo.setProduct_picture(item_vo.getProduct_picture().split(",")[1]);
			}
			editor_list.add(cate_service.editor_getinfo(item_vo.getProduct_editor_num()).getEditor_name());
			item_list.add(item_vo);
		} 
		model.addAttribute("util", util);
		model.addAttribute("item_list", item_list);
		model.addAttribute("editor_list", editor_list);
		
		return ".member.mypage_recent";
	} 

	// ���������� - �˸�
	@RequestMapping(value = "/mypage_notice", method = RequestMethod.GET)
	public String mypage_notice(Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startRow = 0;
		map.put("startRow", startRow);
		map.put("endRow", startRow+10);
		List<Push_Vo> push_list = service.push_list(map);
		List<String> img_list = new ArrayList<String>();
		List<Integer> day_list = new ArrayList<Integer>();
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		for(Push_Vo vo: push_list) {
			if(vo.getPush_category().equals("�̺�Ʈ")) {
				Event_Vo event_vo = board_service.event_detail(vo.getPush_ref());
				if(event_vo.getEvent_thumbnail() != null) {
					img_list.add(event_vo.getEvent_thumbnail());
				}else {
					img_list.add(null);
				}
			}else {
				img_list.add(null);
			}
			long calDate =   date.getTime() - vo.getPush_date().getTime();
			int calDateDays = (int)Math.abs(calDate / (24*60*60*1000));
			day_list.add(calDateDays); 
		}
		model.addAttribute("day_list", day_list);
		model.addAttribute("push_list", push_list);
		model.addAttribute("img_list", img_list);
		return ".member.mypage_notice"; 
	}  
	//�Ű��˸� �߰�
	@RequestMapping(value = "/editor_notice_insert", method = RequestMethod.GET)
	public String editor_notice(HttpServletRequest request, Model model, int editor_num, RedirectAttributes redirect) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		Member_Vo member_vo = (Member_Vo)session.getAttribute("member");
		map.put("members_num", member_vo.getMembers_num());
		map.put("editor_num", editor_num);
		New_Item_Notice_Vo vo = service.new_item_notice_info(map);
		if(member_vo != null && vo == null) {
			service.new_item_notice_insert(new New_Item_Notice_Vo(0, member_vo.getMembers_num(), editor_num, null));
			redirect.addAttribute("msg","success");
		}else { 
			redirect.addAttribute("msg","error");
		}
		redirect.addAttribute("editor_num",editor_num);
		return "redirect:/editor_detail";  
	}
	
	// ���������� - �Ű��˸�
	@RequestMapping(value = "/mypage_book_notice", method = RequestMethod.GET)
	public String mypage_book_notice(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
									 @RequestParam(value = "rowCount", defaultValue = "10") int rowCount,
									 @RequestParam(value = "list_arr", defaultValue = "product_date") String list_arr,HttpServletRequest request, Model model) {
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		HashMap<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession(); 
		Member_Vo member_vo = (Member_Vo)session.getAttribute("member");
		map.put("members_num", member_vo.getMembers_num());
		map.put("list_arr", "new_item_notice_date");
		List<New_Item_Notice_Vo> new_item_notice_list = service.new_item_notice_list(map);
		List<Item_Editor_Vo> editor_list = new ArrayList<Item_Editor_Vo>();
		List<List<HashMap<String, Object>>> editor_item_list = new ArrayList<List<HashMap<String,Object>>>();
		for(New_Item_Notice_Vo vo : new_item_notice_list) {
			HashMap<String, Object> item_add = new HashMap<String, Object>();
			item_add.put("product_editor_num", vo.getEditor_num()); 
			item_add.put("list_arr", "product_issue_date");
			item_add.put("startRow", 1);
			item_add.put("endRow", 3);
			List<HashMap<String, Object>> item_list = item_service.sell_list(item_add);
			for(HashMap<String,Object> item_map : item_list) { 
				if(item_map.get("PRODUCT_PICTURE") !=null) {
					String picture = item_map.get("PRODUCT_PICTURE").toString().split(",")[0];
					item_map.put("PRODUCT_PICTURE", picture);
				}
				String issue_date = item_map.get("PRODUCT_ISSUE_DATE").toString();
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date to_date = null;
				try {
					to_date = transFormat.parse(issue_date);
				} catch (ParseException e) {
					e.printStackTrace();
				} 
				long calDate =   date.getTime() - to_date.getTime();	
				int calDateDays = (int)Math.abs(calDate / (24*60*60*1000));
				if(calDateDays < 14) {
					item_map.put("new_item", "new"); 
				}else {
					item_map.put("new_item", "old");  
				}
			} 
			editor_item_list.add(item_list);
			Item_Editor_Vo editor_vo = cate_service.editor_getinfo(vo.getEditor_num());
			editor_list.add(editor_vo);
		} 
		System.out.println(editor_item_list.toString());
		model.addAttribute("editor_list", editor_list);
		model.addAttribute("editor_item_list", editor_item_list);
		return ".member.mypage_book_notice"; 
	} 
	
	// �Ű� �˸� ����
	@RequestMapping(value = "/mypage_book_notice_delete", method = RequestMethod.GET)
	public String mypage_book_notice_delete(int editor_num, HttpServletRequest request, RedirectAttributes redirect) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession(); 
		Member_Vo member_vo = (Member_Vo)session.getAttribute("member");
		System.out.println(editor_num);
		map.put("members_num", member_vo.getMembers_num());
		map.put("editor_num", editor_num);
		service.new_item_notice_delete(map);
		return "redirect:/mypage_book_notice";
	}
	
	// ����������
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member_Vo member_vo = (Member_Vo)session.getAttribute("member");
		
		// �ֹ� ��� ��
		HashMap<String, Object> order_map = new HashMap<String, Object>();
		order_map.put("members_num", member_vo.getMembers_num());
		order_map.put("admin_date", "admin_date");
		int order_count = order_service.order_count(order_map);
		model.addAttribute("order_count", order_count); 
		
		// My ����Ʈ
		HashMap<String, Object> mile_map = new HashMap<String, Object>();
		mile_map.put("members_num", member_vo.getMembers_num());
		List<Mileage_Vo> mile_list = service.mileage_getinfo(mile_map); // ���ϸ��� ���� ���
		Mileage_Vo mileage_vo = null;
		if(mile_list.size()>0) {
			 mileage_vo = mile_list.get(0);
		}
		model.addAttribute("mileage_vo", mileage_vo); 
		
		//�Ű� �˸�
		int new_item_count= 0;
		Calendar cal = Calendar.getInstance();
		Date date = cal.getTime();
		HashMap<String, Object> new_map = new HashMap<String, Object>();
		new_map.put("members_num", member_vo.getMembers_num());
		List<New_Item_Notice_Vo> new_item_notice_list = service.new_item_notice_list(new_map);
		for(New_Item_Notice_Vo vo : new_item_notice_list) {
			HashMap<String, Object> item_add = new HashMap<String, Object>();
			item_add.put("product_editor_num", vo.getEditor_num()); 
			List<HashMap<String, Object>> item_list = item_service.sell_list(item_add);
			for(HashMap<String,Object> item_map : item_list) {
				String issue_date = item_map.get("PRODUCT_ISSUE_DATE").toString();
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date to_date = null;
				try {
					to_date = transFormat.parse(issue_date);
				} catch (ParseException e) {
					e.printStackTrace();
				} 
				long calDate =   date.getTime() - to_date.getTime();	
				int calDateDays = (int)Math.abs(calDate / (24*60*60*1000));
				if(calDateDays < 14) {
					new_item_count++;
				}
			}
		} 
		model.addAttribute("new_item_count", new_item_count);
		
		//�ֱ� �� å 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("members_num", member_vo.getMembers_num());
		map.put("list_arr", "today_view_date");
		map.put("startRow", 1);
		map.put("endRow", 5);
		List<Today_View_Vo> today_view_list = service.today_view_list(map);
		List<Item_Vo> item_list = new ArrayList<Item_Vo>();
		List<String> editor_list = new ArrayList<String>();
		for(Today_View_Vo vo : today_view_list) { // ������ ����Ʈ ä���ֱ�
			Item_Vo item_vo = item_service.item_getinfo(vo.getProduct_num());
			if(item_vo.getProduct_picture() != null) {
				item_vo.setProduct_picture(item_vo.getProduct_picture().split(",")[1]);
			}
			editor_list.add(cate_service.editor_getinfo(item_vo.getProduct_editor_num()).getEditor_name());
			item_list.add(item_vo);
		} 
		model.addAttribute("member_vo", member_vo);
		model.addAttribute("item_list", item_list);
		model.addAttribute("editor_list", editor_list);
		return ".member.mypage"; 
	}






	

}
