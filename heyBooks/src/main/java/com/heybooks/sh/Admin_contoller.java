package com.heybooks.sh;

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
