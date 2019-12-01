package com.heybooks.sh.controller.admin;

import java.io.Console;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
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
import com.heybooks.sh.vo.admin.Admin_Vo;

@Controller
public class Admin_controller {
	private static final Logger logger = LoggerFactory.getLogger(Admin_controller.class);
	@Resource
	private Admin_Service service;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	// 관리자 홈
	@RequestMapping(value = "/admin_main", method = RequestMethod.GET)
	public String item_contoller(HttpServletRequest request) {
		HttpSession session = request.getSession(); // 세션얻어오기
		if ((session.getAttribute("admin") == null)) {
			return "redirect:/admin";
		}
		return ".admin.admin_main";
	}

	// 1. 관리자 - 로그인 검사
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin_login() {
		logger.info("get admin-login");
		return ".admin.admin_login";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String admin_login(Admin_Vo vo, Model model, HttpServletRequest request)
			throws Exception {
		logger.info("post admin-login");
		Admin_Vo login = service.login(vo);
		HttpSession session = request.getSession();
		if (login != null) { 
			session.setAttribute("admin", vo);
			return "redirect:/admin_main";
		}else{
			session.setAttribute("admin", null);
			model.addAttribute("msg", "아이디나 비밀번호가 올바르지 않습니다.");
			return ".admin.admin_login";
		}
	}

	// 관리자 - 로그아웃
	@RequestMapping(value = "/admin_logout", method = RequestMethod.GET)
	public String admin_logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/admin";
	}

	// 상품 - 리스트
	@RequestMapping(value = "/admin_item_list", method = RequestMethod.GET)
	public String admin_item_list() {
		return ".admin.admin_item_list";
	}

	// 상품 - 등록
	@RequestMapping(value = "/admin_item_add", method = RequestMethod.GET)
	public String admin_item_add() {
		return ".admin.admin_item_add";
	}

	// 회원 관리목록
	@RequestMapping(value = "/admin_user_list", method = RequestMethod.GET)
	public String admin_user_list() {
		return ".admin.admin_user_list";
	}

	// 주문 - 리스트
	@RequestMapping(value = "/admin_order_list", method = RequestMethod.GET)
	public String admin_order_list() {
		return ".admin.admin_order_list";
	}

	


}
