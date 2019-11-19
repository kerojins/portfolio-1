package com.heybooks.sh.controller.item;

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
public class Item_View_Cotroller {

	// 월간 베스트 셀러
	@RequestMapping(value = "/monthly_best_seller", method = RequestMethod.GET)
	public String monthly_best_seller() {
		return ".item.monthly_best_seller";
	}

	// 주간 베스트 셀러
	@RequestMapping(value = "/weekly_best_seller", method = RequestMethod.GET)
	public String weekly_best_seller() {
		return ".item.weekly_best_seller";
	}

	// 신간 도서
	@RequestMapping(value = "/new_book", method = RequestMethod.GET)
	public String new_book() {
		return ".item.new_book";
	}

	// 국내 도서
	@RequestMapping(value = "/domestic_book", method = RequestMethod.GET)
	public String domestic_book() {
		return ".item.domestic_book";
	}

	// 외국 도서
	@RequestMapping(value = "/oversea_book", method = RequestMethod.GET)
	public String oversea_book() {
		return ".item.oversea_book";
	}

	// 중분류 도서
	@RequestMapping(value = "/medium_category_book", method = RequestMethod.GET)
	public String medium_category_book() {
		return ".item.medium_category_book";
	}

	// 소분류도서
	@RequestMapping(value = "/small_category_book", method = RequestMethod.GET)
	public String small_category_book() {
		return ".item.small_category_book";
	}

	// 도서 상세페이지 
	@RequestMapping(value = "/book_detail", method = RequestMethod.GET)
	public String book_detail() {
		return ".item.book_detail";   
	}
 
}
