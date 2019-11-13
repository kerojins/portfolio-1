package com.heybooks.sh.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.heybooks.sh.service.Admin_Login_Service;
import com.heybooks.sh.vo.Admin_Login_Vo;

@Controller
public class Admin_contoller {
	private static final Logger logger = LoggerFactory.getLogger(Member_controller.class);
	@Resource
	private Admin_Login_Service service;

	// ������ Ȩ
	@RequestMapping(value = "/admin_main", method = RequestMethod.GET)
	public String item_contoller(HttpServletRequest request) {
		HttpSession session = request.getSession(); // ���Ǿ�����
		if ((session.getAttribute("admin_id") == null)) {
			return "redirect:/admin";
		}
		return ".admin.admin_main";
	}

	// ������ - �α���/�α׾ƿ�
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin_login() {
		logger.info("get admin-login");
		return ".admin.admin_login";
	}
	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String admin_login(String admin_id, String admin_password, Model model, HttpServletRequest request)
			throws Exception {
		logger.info("post admin-login");
		if(service.getinfo(admin_id) != null) {
			if (service.getinfo(admin_id).equals(admin_password)) {
				HttpSession session = request.getSession();
				session.setAttribute("admin_id", admin_id);
				return "redirect:/admin_main";
			} else {
				model.addAttribute("msg", "���̵� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�.");
				return ".admin.admin_login";
			}
		}else {
			model.addAttribute("msg", "���̵� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�.");
			return ".admin.admin_login";
		}
	}
	@RequestMapping(value = "/admin_logout", method = RequestMethod.GET)
	public String admin_logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/admin";
	}

	// ��ǰ - ����Ʈ
	@RequestMapping(value = "/admin_item_list", method = RequestMethod.GET)
	public String admin_item_list() {
		return ".admin.admin_item_list";
	}

	// ��ǰ - ���
	@RequestMapping(value = "/admin_item_add", method = RequestMethod.GET)
	public String admin_item_add() {
		return ".admin.admin_item_add";
	}

	// ȸ�� �������
	@RequestMapping(value = "/admin_user_list", method = RequestMethod.GET)
	public String admin_user_list() {
		return ".admin.admin_user_list";
	}

	// �ֹ� - ����Ʈ
	@RequestMapping(value = "/admin_order_list", method = RequestMethod.GET)
	public String admin_order_list() {
		return ".admin.admin_order_list";
	}

	// �Խ��� - ��Ϻ� ����Ʈ
	@RequestMapping(value = "/admin_board", method = RequestMethod.GET)
	public String admin_board() {
		return ".admin.admin_board";
	}

	// �Խ��� - ��� �� ����Ʈ
	@RequestMapping(value = "/admin_board_list", method = RequestMethod.GET)
	public String admin_board_list(String board, Model model) {
		model.addAttribute("board", board);
		return ".admin.admin_board_list";
	}

	// �۰� - ����Ʈ
	@RequestMapping(value = "/admin_editor_list", method = RequestMethod.GET)
	public String admin_editor_list() {
		return ".admin.admin_editor_list";
	}

	// �۰� - ���
	@RequestMapping(value = "/admin_editor_add", method = RequestMethod.GET)
	public String admin_editor_add() {
		return ".admin.admin_editor_add";
	}

}
