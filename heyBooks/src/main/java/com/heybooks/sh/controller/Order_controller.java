package com.heybooks.sh.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Order_controller {

	// 쇼핑카트
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart() {
		return ".order.cart";
	}

	// 주문페이지
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String order() {
		return ".order.order";
	}

}
