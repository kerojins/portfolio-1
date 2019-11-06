package com.heybooks.sh.controller;

import java.io.Console;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Admin_contoller {
	// 관리자 홈
	@RequestMapping(value = "/admin_main", method = RequestMethod.GET)
	public String item_contoller() {
		return ".admin.admin_main";
	}
	
	// 관리자 - 로그인
	@RequestMapping(value = "/admin_login", method = RequestMethod.GET)
	public String admin_login() {
		return ".admin.admin_login";
	}
	
/*	@RequestMapping(value = "/admin_login", method = RequestMethod.POST)
	public String admin_login(Model model) {
		return ".admin.admin_login";
	}*/
	

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

	// 게시판 - 목록별 리스트
	@RequestMapping(value = "/admin_board", method = RequestMethod.GET)
	public String admin_board() {
		return ".admin.admin_board";
	}

	// 게시판 - 목록 상세 리스트
	@RequestMapping(value = "/admin_board_list", method = RequestMethod.GET)
	public String admin_board_list(String board, Model model) {
		model.addAttribute("board", board);
		return ".admin.admin_board_list";
	}

	// 작가 - 리스트
	@RequestMapping(value = "/admin_editor_list", method = RequestMethod.GET)
	public String admin_editor_list() {
		return ".admin.admin_editor_list";
	}

	// 작가 - 등록
	@RequestMapping(value = "/admin_editor_add", method = RequestMethod.GET)
	public String admin_editor_add() {
		return ".admin.admin_editor_add";
	}


}
