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
	
	//월간 베스트 셀러
	@RequestMapping(value = "/monthly_best_seller", method = RequestMethod.GET)
	public String monthly_best_seller() {
		return "monthly_best_seller";
	}
	
	//주간 베스트 셀러
	@RequestMapping(value = "/weekly_best_seller", method = RequestMethod.GET)
	public String weekly_best_seller() {
		return "weekly_best_seller";
	}
	
	//신간 도서
	@RequestMapping(value = "/new_book", method = RequestMethod.GET)
	public String new_book() {
		return "new_book";
	}
	//국내 도서
	@RequestMapping(value = "/domestic_book", method = RequestMethod.GET)
	public String domestic_book() {
		return "domestic_book";
	}
	//외국 도서
		@RequestMapping(value = "/oversea_book", method = RequestMethod.GET)
		public String oversea_book() {
			return "oversea_book";
		}
	
	
	
}
