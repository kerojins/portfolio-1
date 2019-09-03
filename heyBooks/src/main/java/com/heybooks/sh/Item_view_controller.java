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
public class Item_view_controller {
	
	//���� ����Ʈ ����
	@RequestMapping(value = "/monthly_best_seller", method = RequestMethod.GET)
	public String monthly_best_seller() {
		return "monthly_best_seller";
	}
	
	//�ְ� ����Ʈ ����
	@RequestMapping(value = "/weekly_best_seller", method = RequestMethod.GET)
	public String weekly_best_seller() {
		return "weekly_best_seller";
	}
	
	//�Ű� ����
	@RequestMapping(value = "/new_book", method = RequestMethod.GET)
	public String new_book() {
		return "new_book";
	}
	//���� ����
	@RequestMapping(value = "/domestic_book", method = RequestMethod.GET)
	public String domestic_book() {
		return "domestic_book";
	}
	//�ܱ� ����
		@RequestMapping(value = "/oversea_book", method = RequestMethod.GET)
		public String oversea_book() {
			return "oversea_book";
		}
	
	
	
}
