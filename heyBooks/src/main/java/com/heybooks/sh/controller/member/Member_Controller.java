package com.heybooks.sh.controller.member;

import java.lang.reflect.Member;
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
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.heybooks.sh.service.member.Member_Service;
import com.heybooks.sh.util.PageUtil;
import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Mileage_Vo;

@Controller
public class Member_Controller {

	private static final Logger logger = LoggerFactory.getLogger(Member_Controller.class);

	@Resource
	private Member_Service service;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	// 1. ȸ�� ����
	@RequestMapping(value = "/member_join", method = RequestMethod.GET)
	public String join() {
		logger.info("get member-join");
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
			for(Member_Vo vo : member_list) { 
				mile_list.add(service.mileage_getinfo(vo.getMembers_num()).get(0));
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
	public String admin_item_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "rowCount", defaultValue = "10") int rowCount,  Model model, HttpServletRequest request,
							 	  @RequestParam(value = "list_arr", defaultValue = "members_regdate") String list_arr, String keyword, String birth_date, String birth_end_date, String join_date, String join_end_date ,String mile_start, String mile_end, String order_start, 
							 	  String order_end, String review_start, String review_end, String members_gender, String members_status) {
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("list_arr", list_arr);
		if(keyword != null && !(keyword.equals(""))) {
			map.put("keyword", keyword); 
		}
		if(members_status != null && !(members_status.equals(""))) {
			map.put("members_status", members_status);  
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
		for(Member_Vo vo : member_list) { 
			if(service.mileage_getinfo(vo.getMembers_num()).size() > 0){
				mile_list.add(service.mileage_getinfo(vo.getMembers_num()).get(0).getMileage_total());
			}else {   
				mile_list.add(0); 
			} 
		}
		
		System.out.println(mile_list.toString()); 
	
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
	
	
	// ����������
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		return ".member.mypage";
	}

	// ���������� - �ֱ� �� ��ǰ
	@RequestMapping(value = "/mypage_recent", method = RequestMethod.GET)
	public String mypage_recent() {
		return ".member.mypage_recent";
	}

	// ���������� - ���ø���Ʈ
	@RequestMapping(value = "/mypage_wishlist", method = RequestMethod.GET)
	public String mypage_wishlist() {
		return ".member.mypage_wishlist";
	}

	// ���������� - �˸�
	@RequestMapping(value = "/mypage_notice", method = RequestMethod.GET)
	public String mypage_notice() {
		return ".member.mypage_notice";
	}

	// ���������� - �Ű��˸�
	@RequestMapping(value = "/mypage_book_notice", method = RequestMethod.GET)
	public String mypage_book_notice() {
		return ".member.mypage_book_notice";
	}

	// ���������� - �ֹ� ���
	@RequestMapping(value = "/mypage_order", method = RequestMethod.GET)
	public String mypage_order() {
		return ".member.mypage_order";
	}

	// ���������� - �ֹ� ��� ��
	@RequestMapping(value = "/mypage_order_detail", method = RequestMethod.GET)
	public String mypage_order_detail(Model md) {
		md.addAttribute("aside", "no");
		return ".member.mypage_order_detail";
	}

	// ���������� - ���ϸ���
	@RequestMapping(value = "/mypage_mileage", method = RequestMethod.GET)
	public String mypage_mileage() {
		return ".member.mypage_mileage";
	}

	

}
