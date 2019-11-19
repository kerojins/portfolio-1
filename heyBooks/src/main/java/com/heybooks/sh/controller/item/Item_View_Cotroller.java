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

	// ���� ����Ʈ ����
	@RequestMapping(value = "/monthly_best_seller", method = RequestMethod.GET)
	public String monthly_best_seller() {
		return ".item.monthly_best_seller";
	}

	// �ְ� ����Ʈ ����
	@RequestMapping(value = "/weekly_best_seller", method = RequestMethod.GET)
	public String weekly_best_seller() {
		return ".item.weekly_best_seller";
	}

	// �Ű� ����
	@RequestMapping(value = "/new_book", method = RequestMethod.GET)
	public String new_book() {
		return ".item.new_book";
	}

	// ���� ����
	@RequestMapping(value = "/domestic_book", method = RequestMethod.GET)
	public String domestic_book() {
		return ".item.domestic_book";
	}

	// �ܱ� ����
	@RequestMapping(value = "/oversea_book", method = RequestMethod.GET)
	public String oversea_book() {
		return ".item.oversea_book";
	}

	// �ߺз� ����
	@RequestMapping(value = "/medium_category_book", method = RequestMethod.GET)
	public String medium_category_book() {
		return ".item.medium_category_book";
	}

	// �Һз�����
	@RequestMapping(value = "/small_category_book", method = RequestMethod.GET)
	public String small_category_book() {
		return ".item.small_category_book";
	}

	// ���� �������� 
	@RequestMapping(value = "/book_detail", method = RequestMethod.GET)
	public String book_detail() {
		return ".item.book_detail";   
	}
 
}
