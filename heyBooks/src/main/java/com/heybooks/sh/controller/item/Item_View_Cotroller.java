package com.heybooks.sh.controller.item;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.heybooks.sh.service.board.Board_Service;
import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.service.member.Member_Service;
import com.heybooks.sh.util.PageUtil;
import com.heybooks.sh.util.SubjectUtil;
import com.heybooks.sh.vo.board.Review_Vo;
import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;
import com.heybooks.sh.vo.item.Item_Vo;
import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Today_View_Vo;

@Controller
public class Item_View_Cotroller {
	private static final Logger logger = LoggerFactory.getLogger(Item_View_Cotroller.class);
	
	@Resource
	private Item_Category_Service cate_service;
	@Resource
	private Item_Main_Service service;
	@Resource
	private Board_Service board_service;
	@Resource
	private Member_Service member_service;
	

	// �ְ� ����Ʈ ����
	@RequestMapping(value = "/weekly_best_seller", method = RequestMethod.GET)
	public String weekly_best_seller(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
									 @RequestParam(value = "rowCount", defaultValue = "20") int rowCount,
									 @RequestParam(value = "list_arr", defaultValue = "cnt") String list_arr, String cate_num, String cate_ref1, String year, String month, String week, Model model){
		logger.info("get weekly-best-seller");
		Calendar cal = Calendar.getInstance();
		Calendar today = Calendar.getInstance();
		Date best_date = new Date();
		int today_date = today.get(Calendar.DATE);
		int date = 0;
		int dayOfWeek = 0;
		if(year != null && !(year.equals(""))) {
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			cal.set(Calendar.MONTH, Integer.parseInt(month)-1);
			date = cal.getActualMaximum(Calendar.DATE);
			cal.set(Calendar.HOUR_OF_DAY, 0);
			cal.set(Calendar.MINUTE, 0); 
			cal.set(Calendar.SECOND, 0);
			cal.set(Calendar.MILLISECOND, 0);
		}
		else { 
			date = today.getActualMaximum(Calendar.DATE);
			today.set(Calendar.HOUR_OF_DAY, 0);
			today.set(Calendar.MINUTE, 0); 
			today.set(Calendar.SECOND, 0);
			today.set(Calendar.MILLISECOND, 0);
		}
		  
		int week_num = 1; 
		for(int i= 1; i <= date; i++) {
			if(week != null && !(week.equals(""))) {
				cal.set(Calendar.DATE, i); 
				dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); 
			}else {
				today.set(Calendar.DATE, i); 
				dayOfWeek = today.get(Calendar.DAY_OF_WEEK); 
			}
			if( (i==1 && dayOfWeek == 1) || (i==1 && dayOfWeek == 6) || (i==1 && dayOfWeek == 7)) { //1���� �������� ��� 1�ַ� �������� �ʴ´�
				week_num = 0;
			}  
			if(dayOfWeek==2) { //�������϶����� ���� ����
				week_num++; 
				if(i==1) week_num--;
				if(week != null && !(week.equals(""))) {
					int best_week = Integer.parseInt(week);
					if(best_week==week_num) { // �Ķ���ͷ� ������ ������ ���� ������ ������ ��¥�� ����
						best_date = cal.getTime();
						break;
					}
				}else{ 
					if(today_date < i + 7) {
							today.set(Calendar.DATE, i); 
							best_date = today.getTime(); 
							break;
					}else if(today_date == i) {
						today.set(Calendar.DATE, i); 
						best_date = today.getTime(); 
						break;
					} 
				}
			}
		} 
		if(week_num == 0) {
			week_num = 1; 
			today.set(Calendar.MONTH, today.get(Calendar.MONTH)-1);
			date = today.getActualMaximum(Calendar.DATE);
			System.out.println(best_date.toString()); 
			for(int i= 1; i <= date; i++) {
					today.set(Calendar.DATE, i); 
					dayOfWeek = today.get(Calendar.DAY_OF_WEEK); 
				if( (i==1 && dayOfWeek == 1) || (i==1 && dayOfWeek == 6) || (i==1 && dayOfWeek == 7)) {
					week_num = 0;
				} 
				if(dayOfWeek==2) {  
					week_num++;  
					if(today_date < i + 7) {
							today.set(Calendar.DATE, i);  
							best_date = today.getTime(); 
							break;
					}else if(today_date == i) {
						today.set(Calendar.DATE, i); 
						best_date = today.getTime(); 
						break;
					}  
				}
			} 
		}
		System.out.println(best_date.toString()); 
		HashMap<String, Object> cate_map = new HashMap<String, Object>(); 
		cate_map.put("cate_code", "100");
		List<Item_Cate_Vo> domestic_vo = cate_service.cate_list(cate_map);
		cate_map.put("cate_code", "700");
		List<Item_Cate_Vo> oversea_vo = cate_service.cate_list(cate_map);
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		if(cate_ref1 != null && !(cate_ref1.equals(""))) {
			map.put("cate_code", cate_ref1); 
		}    
		map.put("list_arr", list_arr);  
		
		map.put("best_date", best_date);  
		map.put("book_list", "book_list");  
		int totalRowCount = service.get_count(map);//������ ó��
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5);
		map.put("startRow", util.getStartRow());   
		map.put("endRow", util.getEndRow());  
		List<HashMap<String, Object>> item_list = service.sell_list(map);
		if(item_list.size() > 0) {
			for(HashMap<String,Object> list_map:item_list) { //����Ʈ�� �߰����� ��� 
				review_map.put("product_num", list_map.get("PRODUCT_NUM"));
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				int cate = Integer.parseInt((list_map.get("PRODUCT_CATE_NUM")).toString()); 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //���� ī��Ʈ �߰�
				list_map.put("CATE_NAME", cate_service.cate_info(cate).getCate_name()); //���� ī��Ʈ �߰�
				list_map.put("REVIEW_CNT", board_service.review_count(review_map)); //���� ī��Ʈ �߰�
			}   
		}  
		
		model.addAttribute("item_list", item_list); 
		model.addAttribute("domestic_vo", domestic_vo);   
		model.addAttribute("oversea_vo", oversea_vo);
		model.addAttribute("cate_num", cate_num);
		model.addAttribute("cate_ref1", cate_ref1);
		model.addAttribute("year", year); 
		model.addAttribute("month", month);   
		model.addAttribute("week", week); 
		model.addAttribute("util", util);  
		return ".item.weekly_best_seller";  
	}

	// ���� ����Ʈ ����
	@RequestMapping(value = "/monthly_best_seller", method = RequestMethod.GET)
	public String monthly_best_seller(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			 					      @RequestParam(value = "rowCount", defaultValue = "20") int rowCount,
			 					      @RequestParam(value = "list_arr", defaultValue = "cnt") String list_arr, String cate_num, String cate_ref1, String year, String month, Model model) {
		logger.info("get monthly-best-seller");
		Calendar cal = Calendar.getInstance();
		if(year != null && !(year.equals(""))) {
			cal.set(Calendar.YEAR, Integer.parseInt(year));
		}
		if(month !=null && !(month.equals(""))) {
			cal.set(Calendar.MONTH, Integer.parseInt(month)-1);
		}
		cal.set(Calendar.DATE, 1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);   
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0); 
		Date best_month_date = cal.getTime();
		System.out.println(best_month_date.toString());
		HashMap<String, Object> cate_map = new HashMap<String, Object>(); 
		cate_map.put("cate_code", "100");
		List<Item_Cate_Vo> domestic_vo = cate_service.cate_list(cate_map);
		cate_map.put("cate_code", "700");
		List<Item_Cate_Vo> oversea_vo = cate_service.cate_list(cate_map);
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		if(cate_ref1 != null && !(cate_ref1.equals(""))) {
			map.put("cate_code", cate_ref1); 
		}    
		map.put("list_arr", list_arr);  
		map.put("best_month_date", best_month_date);  
		map.put("book_list", "book_list");  
		int totalRowCount = service.get_count(map);//������ ó��
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5);
		map.put("startRow", util.getStartRow());   
		map.put("endRow", util.getEndRow());  
		List<HashMap<String, Object>> item_list = service.sell_list(map);
		if(item_list.size() > 0) {
			for(HashMap<String,Object> list_map:item_list) { //����Ʈ�� �߰����� ��� 
				review_map.put("product_num", list_map.get("PRODUCT_NUM"));
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				int cate = Integer.parseInt((list_map.get("PRODUCT_CATE_NUM")).toString()); 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //���� ī��Ʈ �߰�
				list_map.put("CATE_NAME", cate_service.cate_info(cate).getCate_name()); //���� ī��Ʈ �߰�
				list_map.put("REVIEW_CNT", board_service.review_count(review_map)); //���� ī��Ʈ �߰�
			}   
		}
		
		model.addAttribute("item_list", item_list); 
		model.addAttribute("domestic_vo", domestic_vo);   
		model.addAttribute("oversea_vo", oversea_vo);
		model.addAttribute("cate_num", cate_num);
		model.addAttribute("cate_ref1", cate_ref1);
		model.addAttribute("year", year); 
		model.addAttribute("month", month);   
		model.addAttribute("util", util);  
		return ".item.monthly_best_seller"; 
	}
 
	// �Ű� ����
	@RequestMapping(value = "/new_book", method = RequestMethod.GET)
	public String new_book(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
						   @RequestParam(value = "rowCount", defaultValue = "20") int rowCount,
						   @RequestParam(value = "list_arr", defaultValue = "product_issue_date") String list_arr, String cate_num, String cate_ref1, String year, String month, String week,  Model model) {
		logger.info("get new-book");
		Calendar cal = Calendar.getInstance();
		Calendar today = Calendar.getInstance();
		Date issue_date = new Date();
		int today_date = today.get(Calendar.DATE);
		int date = 0;
		int dayOfWeek = 0;
		if(year != null && !(year.equals(""))) {
			cal.set(Calendar.YEAR, Integer.parseInt(year));
			cal.set(Calendar.MONTH, Integer.parseInt(month)-1);
			date = cal.getActualMaximum(Calendar.DATE);
			cal.set(Calendar.HOUR_OF_DAY, 0);
			cal.set(Calendar.MINUTE, 0); 
			cal.set(Calendar.SECOND, 0);
			cal.set(Calendar.MILLISECOND, 0);
		}
		else { 
			date = today.getActualMaximum(Calendar.DATE);
			today.set(Calendar.HOUR_OF_DAY, 0);
			today.set(Calendar.MINUTE, 0); 
			today.set(Calendar.SECOND, 0);
			today.set(Calendar.MILLISECOND, 0);
		}
		  
		int week_num = 1;
		for(int i= 1; i <= date; i++) {
			if(week != null && !(week.equals(""))) {
				cal.set(Calendar.DATE, i); 
				dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); 
			}else {
				today.set(Calendar.DATE, i); 
				dayOfWeek = today.get(Calendar.DAY_OF_WEEK); 
			}
			if( (i==1 && dayOfWeek == 1) || (i==1 && dayOfWeek == 6) || (i==1 && dayOfWeek == 7)) {
				week_num = 0;
			}  
			if(dayOfWeek==2) {  
				week_num++; 
				if(i==1) week_num--;
				if(week != null && !(week.equals(""))) {
					int best_week = Integer.parseInt(week);
					if(best_week==week_num) {
						issue_date = cal.getTime();
						break;
					}
				}else{ 
					if(today_date < i + 7) {
							today.set(Calendar.DATE, i); 
							issue_date = today.getTime(); 
							break;
					}else if(today_date == i) {
						today.set(Calendar.DATE, i); 
						issue_date = today.getTime(); 
						break;
					} 
				}
			}
		} 
		if(week_num == 0) {
			week_num = 1; 
			today.set(Calendar.MONTH, today.get(Calendar.MONTH)-1);
			date = today.getActualMaximum(Calendar.DATE);
			for(int i= 1; i <= date; i++) {
					today.set(Calendar.DATE, i); 
					dayOfWeek = today.get(Calendar.DAY_OF_WEEK); 
				if( (i==1 && dayOfWeek == 1) || (i==1 && dayOfWeek == 6) || (i==1 && dayOfWeek == 7)) {
					week_num = 0;
				} 
				if(dayOfWeek==2) {  
					week_num++;  
					if(today_date < i + 7) {
							today.set(Calendar.DATE, i);  
							issue_date = today.getTime(); 
							break;
					}else if(today_date == i) {
						today.set(Calendar.DATE, i); 
						issue_date = today.getTime(); 
						break;
					}  
				}
			} 
		}
		HashMap<String, Object> cate_map = new HashMap<String, Object>(); 
		cate_map.put("cate_code", "100");
		List<Item_Cate_Vo> domestic_vo = cate_service.cate_list(cate_map);
		cate_map.put("cate_code", "700");
		List<Item_Cate_Vo> oversea_vo = cate_service.cate_list(cate_map);
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		if(cate_ref1 != null && !(cate_ref1.equals(""))) {
			map.put("cate_code", cate_ref1); 
		}    
		map.put("list_arr", list_arr);  
		map.put("book_list", "book_list");    
		map.put("issue_date", issue_date);   
		if(pageNum<1) pageNum = 1; 
		int totalRowCount = service.get_count(map);//������ ó��
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5);
		map.put("startRow", util.getStartRow());   
		map.put("endRow", util.getEndRow());  
		List<HashMap<String, Object>> item_list = service.sell_list(map);
		if(item_list.size() > 0) {
			for(HashMap<String,Object> list_map:item_list) { //����Ʈ�� �߰����� ��� 
				review_map.put("product_num", list_map.get("PRODUCT_NUM"));
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				int cate = Integer.parseInt((list_map.get("PRODUCT_CATE_NUM")).toString()); 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //���� ī��Ʈ �߰�
				list_map.put("CATE_NAME", cate_service.cate_info(cate).getCate_name()); //���� ī��Ʈ �߰�
				list_map.put("REVIEW_CNT", board_service.review_count(review_map)); //���� ī��Ʈ �߰�
			}   
		}
		model.addAttribute("item_list", item_list); 
		model.addAttribute("domestic_vo", domestic_vo);
		model.addAttribute("oversea_vo", oversea_vo);
		
		model.addAttribute("cate_num", cate_num);
		model.addAttribute("cate_ref1", cate_ref1);
		model.addAttribute("year", year); 
		model.addAttribute("month", month);   
		model.addAttribute("week", week);   
		model.addAttribute("util", util);  
		return ".item.new_book"; 
	}
 
	// ���� ����
	@RequestMapping(value = "/domestic_book", method = RequestMethod.GET)
	public String domestic_book(Model model) {
		logger.info("get domestic-book");
		HashMap<String, Object> cate_map = new HashMap<String, Object>(); 
		cate_map.put("cate_code", "100");
		List<Item_Cate_Vo> domestic_vo = cate_service.cate_list(cate_map);
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("book_list", "book_list");    
		
		//�Ű����� ���
		map.put("cate_code", 100);  
		int totalRowCount = service.get_count(map);//������ ó��
		PageUtil util = new PageUtil(1, totalRowCount, 6, 5);
		map.put("list_arr", "product_issue_date");   
		map.put("startRow", util.getStartRow());   
		map.put("endRow", util.getEndRow());  
		List<HashMap<String, Object>> new_item_list = service.sell_list(map);
		if(new_item_list.size() > 0) {
			for(HashMap<String,Object> list_map:new_item_list) { //����Ʈ�� �߰����� ��� 
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //���� ī��Ʈ �߰�
			}   
		}
		//����Ʈ���� ���  
		map.put("list_arr", "cnt");  
		List<HashMap<String, Object>> best_item_list = service.sell_list(map);
		if(best_item_list.size() > 0) {
			for(HashMap<String,Object> list_map:best_item_list) { //����Ʈ�� �߰����� ��� 
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //���� ī��Ʈ �߰�
			}   
		} 
		
		//�оߺ� top5���
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		int[] cate_code_arr = new int[5];
		for(int i=0; i<5; i++) { 
			cate_code_arr[i] = Integer.parseInt(domestic_vo.get(i).getCate_ref1());
			System.out.println(cate_code_arr[i]);
		}  
		map.put("list_arr", "cnt"); // ����Ʈ��ǰ��
		SubjectUtil arr_cnt_add = new SubjectUtil(cate_code_arr, map, review_map, model, cate_service, service, board_service,"cate_code", "best"); // ī���ڵ� �� ����Ʈ ��� �޾ƿ��� �𵨿� ����
		 
		model.addAttribute("new_item_list", new_item_list);
		model.addAttribute("best_item_list", best_item_list); 
		model.addAttribute("domestic_vo", domestic_vo);
		 
		return ".item.domestic_book";
	}

	// �ܱ� ����
	@RequestMapping(value = "/oversea_book", method = RequestMethod.GET)
	public String oversea_book(Model model) {
		logger.info("get new-book");
		HashMap<String, Object> cate_map = new HashMap<String, Object>(); 
		cate_map.put("cate_code", "700");
		List<Item_Cate_Vo> oversea_vo = cate_service.cate_list(cate_map);
		model.addAttribute("oversea_vo", oversea_vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("book_list", "book_list");    
		
		//�Ű����� ���
		map.put("cate_code", 700);  
		int totalRowCount = service.get_count(map);//������ ó��
		PageUtil util = new PageUtil(1, totalRowCount, 6, 5);
		map.put("list_arr", "product_issue_date");   
		map.put("startRow", util.getStartRow());    
		map.put("endRow", util.getEndRow());  
		List<HashMap<String, Object>> new_item_list = service.sell_list(map);
		if(new_item_list.size() > 0) {
			for(HashMap<String,Object> list_map:new_item_list) { //����Ʈ�� �߰����� ��� 
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //���� ī��Ʈ �߰�
			}   
		} 
		
		//����Ʈ���� ��� 
		map.put("list_arr", "cnt");  
		List<HashMap<String, Object>> best_item_list = service.sell_list(map);
		if(best_item_list.size() > 0) {
			for(HashMap<String,Object> list_map:best_item_list) { //����Ʈ�� �߰����� ��� 
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //���� ī��Ʈ �߰�
			}   
		}
		
		//�оߺ� top5���
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		int[] cate_code_arr = new int[5];
		for(int i=0; i<5; i++) { 
			cate_code_arr[i] = Integer.parseInt(oversea_vo.get(i).getCate_ref1());
			System.out.println(cate_code_arr[i]);
		}  
		map.put("list_arr", "cnt"); // ����Ʈ��ǰ��
		SubjectUtil arr_cnt_add = new SubjectUtil(cate_code_arr, map, review_map, model, cate_service, service, board_service,"cate_code", "best"); // ī���ڵ� �� ����Ʈ ��� �޾ƿ��� �𵨿� ����
		 
		model.addAttribute("new_item_list", new_item_list);
		model.addAttribute("best_item_list", best_item_list); 
		model.addAttribute("oversea_vo", oversea_vo);
		 
		return ".item.oversea_book";
	}  

	// �ߺз� ����
	@RequestMapping(value = "/medium_category_book", method = RequestMethod.GET)
	public String medium_category_book(Model model, String cate_ref1, String cate_name, String cate_num) {
		logger.info("get medium-category-book");
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		HashMap<String, Object> review_map = new HashMap<String, Object>(); 
		HashMap<String, Object> cate_map = new HashMap<String, Object>(); 
		cate_map.put("cate_code", cate_ref1);
		List<Item_Cate_Vo> medium_cate_vo = cate_service.cate_list(cate_map);
		int[] cate_code_arr = new int[5];
		for(int i=0; i<5; i++) { 
			cate_code_arr[i] = medium_cate_vo.get(i).getCate_num();
		} 
		map.put("book_list", "book_list");    
		map.put("list_arr", "product_issue_date"); // �Ű������� 
		SubjectUtil arr_date_add = new SubjectUtil(cate_code_arr, map, review_map, model, cate_service, service, board_service,"cate_num","new"); // ī���ڵ� �� ����Ʈ ��� �޾ƿ��� �𵨿� ����
		map.put("list_arr", "cnt"); // ����Ʈ��ǰ��
		SubjectUtil arr_cnt_add = new SubjectUtil(cate_code_arr, map, review_map, model, cate_service, service, board_service,"cate_num", "best"); // ī���ڵ� �� ����Ʈ ��� �޾ƿ��� �𵨿� ����
		 
		model.addAttribute("medium_cate_vo", medium_cate_vo);
		model.addAttribute("cate_name", cate_name);
		return ".item.medium_category_book";   
	} 

	// �Һз�����
	@RequestMapping(value = "/small_category_book", method = RequestMethod.GET)
	public String small_category_book(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
									  @RequestParam(value = "rowCount", defaultValue = "10") int rowCount,
									  @RequestParam(value = "list_arr", defaultValue = "cnt") String list_arr, String cate_num, String cate_name, Model model,
			HttpServletRequest request) {
		logger.info("get small-category-book");
		HashMap<String, Integer> cate_map = new HashMap<String,  Integer>();
		cate_map.put("cate_num", Integer.parseInt(cate_num));
		List<Item_Cate_Vo> cate_info_list = cate_service.get_category(cate_map);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		map.put("book_list", "book_list"); 
		map.put("list_arr", list_arr);  
		if(list_arr.equals("product_review")) {
			map.put("list_arr", "product_issue_date");  
		} 
		map.put("cate_num", Integer.parseInt(cate_num));
		if(pageNum<1) pageNum = 1; 
		int totalRowCount = service.get_count(map);//������ ó��
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5);
		map.put("startRow", util.getStartRow());  
		map.put("endRow", util.getEndRow()); 
		List<HashMap<String, Object>> item_list = service.sell_list(map);
		if(item_list.size() > 0) {
			for(HashMap<String, Object> list_map: item_list) { //�۰� �̸� ����Ʈ 
				review_map.put("product_num", list_map.get("PRODUCT_NUM"));
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				int cate = Integer.parseInt((list_map.get("PRODUCT_CATE_NUM")).toString()); 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //�۰��̸� �߰�
				list_map.put("CATE_NAME", cate_service.cate_info(cate).getCate_name()); //ī�׸� �߰�
				list_map.put("REVIEW_CNT", board_service.review_count(review_map)); //���� ī��Ʈ �߰�
				logger.info(list_map.toString()); 
				}   
		} 
		//��������� �����ϱ�
		if(list_arr.equals("product_review")) {
			Collections.sort(item_list, new Comparator<HashMap<String,Object>>() {
				@Override
				public int compare(HashMap<String, Object> o1, HashMap<String, Object> o2) {
					Integer cnt1 = (Integer)o1.get("REVIEW_CNT");
					Integer cnt2 = (Integer)o2.get("REVIEW_CNT");
					return cnt2.compareTo(cnt1);
				}
			});	 
		}  
		
		model.addAttribute("rowCount", rowCount); // ������ ������ ����
		model.addAttribute("list_arr", list_arr); // ������ ���� ����
		model.addAttribute("cate_name", cate_name); // ������ ī�װ� �̸�
		model.addAttribute("cate_num", cate_num); // ������ ī�װ� ��ȣ
		model.addAttribute("item_list", item_list); 
		model.addAttribute("cate_info_list", cate_info_list); 
		model.addAttribute("util", util);
		return ".item.small_category_book"; 
	}    

	// ���� ��������
	@RequestMapping(value = "/book_detail", method = RequestMethod.GET)
	public String book_detail(int product_num,  HttpServletRequest request, Model model) {
		//���� �޾ƿ���
		HttpSession session = request.getSession();
		Member_Vo member_vo = (Member_Vo)session.getAttribute("member");
		Today_View_Vo today_vo = new Today_View_Vo();
		if(member_vo != null) {
			today_vo.setMembers_num(member_vo.getMembers_num());
			today_vo.setProduct_num(product_num);
			member_service.today_view_insert(today_vo);
		}
		
		//���� ����
		Item_Vo item_vo = service.item_getinfo(product_num);
		String item_index = "";
		List<String> preview_list = new ArrayList<String>();
		if(item_vo.getProduct_index() != null) {
			item_index = item_vo.getProduct_index().replaceAll(",", "<br>");
		}
		if(item_vo.getProduct_preview() != null){
			String[] preview_arr =item_vo.getProduct_preview().split(","); 
			for(String arr_txt: preview_arr) {
				preview_list.add(arr_txt);
			}
			model.addAttribute("preview_list", preview_list); // ��ǰ ������
		}
	 
		// ī�װ� ���� �޾ƿ���
		HashMap<String, Integer> map = new HashMap<String,  Integer>();
		map.put("cate_num", item_vo.getProduct_cate_num());
		List<Item_Cate_Vo> cate_info_list = cate_service.get_category(map);
		HashMap<String, Object> cate_item_map = new HashMap<String,  Object>();
		cate_item_map.put("cate_num", item_vo.getProduct_cate_num());
		cate_item_map.put("list_arr", "cnt");
		cate_item_map.put("startRow", 1);
		cate_item_map.put("endRow", 10);
		List<HashMap <String,Object>> cate_item_list = service.sell_list(cate_item_map); 
		
		//���丮��Ʈ
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		review_map.put("list_arr", "review_date desc");
		review_map.put("product_num", product_num);
		review_map.put("startRow", 1);
		review_map.put("endRow", 10);//10�� �޾ƿ���
		int review_cnt = board_service.review_count(review_map);
		List<Review_Vo> review_list = board_service.review_list(review_map);
		List<Member_Vo> member_list = new ArrayList<Member_Vo>(); //���� ��� �������
		for(Review_Vo vo : review_list) {
			member_list.add(member_service.getInfo(vo.getMembers_num()));
		} 
		if(member_vo!=null) { 
			for(Review_Vo vo : review_list) {//�ش��ǰ�� ���並 �̹� �޾��� ��� 
				if(vo.getProduct_num() == product_num && vo.getMembers_num() == member_vo.getMembers_num()) { 
					vo.setReview_content(vo.getReview_content().replaceAll("\r\n","<br>")); 
					model.addAttribute("review_vo", vo); 
				}
			}
		}
		
		// �۰����� �޾ƿ���
		Item_Editor_Vo editor_vo =  cate_service.editor_getinfo(item_vo.getProduct_editor_num());
		String[] editor_birth_arr = new String[3];
		if(editor_vo.getEditor_birth() != null) {
			editor_birth_arr = editor_vo.getEditor_birth().split("-");
		}
		String editor_school = "";
		if(editor_vo.getEditor_school() != null) {
			editor_school = editor_vo.getEditor_school().replaceAll(",", "<br>");
		}
		String editor_award = "";
		if(editor_vo.getEditor_award() != null) {
			editor_award = editor_vo.getEditor_award().replaceAll(",", "<br>");
		}
		
		// �۰� ��ǥ����Ʈ 
		HashMap<String, Object> editor_map = new HashMap<String, Object>();
		editor_map.put("list_arr", "cnt");
		editor_map.put("book_list", "book_list");
		editor_map.put("product_editor_num", item_vo.getProduct_editor_num());
		editor_map.put("startRow",1); 
		editor_map.put("endRow", 5);
		List<HashMap<String, Object>> editor_item_list = service.sell_list(editor_map);
		for(HashMap<String, Object> list_map: editor_item_list) { //�۰� �̸� ����Ʈ 
			review_map.put("product_num", list_map.get("PRODUCT_NUM"));
			list_map.put("REVIEW_CNT", board_service.review_count(review_map)); //���� ī��Ʈ �߰�
		}   
		  
		
		model.addAttribute("member_vo", member_vo); // ȸ�� ������
		model.addAttribute("cate_info_list", cate_info_list); //ī�װ� ���� ����Ʈ
		model.addAttribute("cate_item_list", cate_item_list); //ī�װ� ���� ����Ʈ

		model.addAttribute("item_vo", item_vo); // ��ǰ ������
		model.addAttribute("item_index", item_index); // ��ǰ ������
	
		 
		model.addAttribute("review_list", review_list); //���� ����Ʈ
		model.addAttribute("review_cnt", review_cnt); //���� ����
		model.addAttribute("member_list", member_list); //������ ����Ʈ
		
		
		model.addAttribute("editor_vo", editor_vo); // �۰� ������ 
		model.addAttribute("editor_item_list", editor_item_list); // �۰� ������ 
		model.addAttribute("editor_birth_arr", editor_birth_arr); //�۰� ������� �迭
		model.addAttribute("editor_school", editor_school); //�۰� �з�
		model.addAttribute("editor_award", editor_award); //�۰� ������
		return ".item.book_detail";   
	} 
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String search(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
						 @RequestParam(value = "rowCount", defaultValue = "10") int rowCount,
						 @RequestParam(value = "list_arr", defaultValue = "cnt") String list_arr, String keyword, String cate_code, Model model) {
		System.out.println(keyword); 
		final String list_arr_val = list_arr; 
		//Ű���� �۰��� - �۰�����Ʈ ������ 
		HashMap<String,Object> editor_map = new HashMap<String, Object>();
		List<HashMap<String,Object>> search_editor_list = new ArrayList<HashMap<String,Object>>();
		editor_map.put("keyword", keyword);
		List<Item_Editor_Vo> editor_list = cate_service.editor_list(editor_map);
		if(editor_list.size()>0) {
			editor_map.remove("keyword");
			editor_map.put("list_arr", "cnt"); //�Ǹŷ� ��
			editor_map.put("book_list", "book_list");    
			for(Item_Editor_Vo editor_vo : editor_list) {
				HashMap<String,Object> editor_add_map = new HashMap<String, Object>();
				editor_map.put("product_editor_num", editor_vo.getEditor_num());
				editor_add_map.put("editor_num", editor_vo.getEditor_num());
				editor_add_map.put("editor_name", editor_vo.getEditor_name());  
				editor_add_map.put("editor_item_count", cate_service.editor_item_count(editor_vo.getEditor_num()));
				List<HashMap<String, Object>> item_list = service.sell_list(editor_map);
				String item_name = "";
				if(item_list.size()>0) {
					item_name = item_list.get(0).get("PRODUCT_NAME").toString();
				}
				editor_add_map.put("editor_item_name", item_name);
				search_editor_list.add(editor_add_map);
				if(editor_list.indexOf(editor_vo) == 2) {
					break;
				} 
			}
		}
		if(search_editor_list.size()>0) {
			model.addAttribute("editor_list", search_editor_list);
		}
		
	   //Ű���尡 ��ǰ�� or �۰��� or ���ǻ�� - ������ ������
		List<HashMap<String,Object>> search_item_list = new ArrayList<HashMap<String,Object>>();
		List<HashMap<String,Object>> origin_item_list = new ArrayList<HashMap<String,Object>>();
		HashMap<String,Object> item_map = new HashMap<String, Object>();
		item_map.put("list_arr", "cnt"); 
		item_map.put("book_list", "book_list");    
		item_map.put("product_name", keyword); 
		
		// Ű���� ��ǰ������ �˻��� ����Ʈ �ֱ�
		List<HashMap<String,Object>> item_list = service.sell_list(item_map); 
		for(HashMap<String,Object> item_add_map : item_list) {
			search_item_list.add(item_add_map); 
		}
	
		// Ű���� �۰������� �˻��� ����Ʈ �ֱ�
		item_map.remove("product_name");
		if(editor_list.size()>0) {
			for(Item_Editor_Vo editor_vo : editor_list) {
				item_map.put("product_editor_num", editor_vo.getEditor_num()); 
				item_list = service.sell_list(item_map);
				for(HashMap<String,Object> item_add_map : item_list) {
					search_item_list.add(item_add_map);
				}
			} 
		}
		
		 // Ű���� ���ǻ������ �˻��� ����Ʈ �ֱ�
		item_map.remove("product_editor_num"); 
		item_map.put("product_publish", keyword);
		item_list = service.sell_list(item_map);
		for(HashMap<String,Object> item_add_map : item_list) {
			search_item_list.add(item_add_map);
		}
		
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		if(search_item_list.size()>0) { 
			for(HashMap<String, Object> list_map : search_item_list) {
				review_map.put("product_num", list_map.get("PRODUCT_NUM"));
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				int cate = Integer.parseInt((list_map.get("PRODUCT_CATE_NUM")).toString()); 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //�۰��̸� �߰�
				list_map.put("CATE_NAME", cate_service.cate_info(cate).getCate_name()); //ī�׸� �߰�
				list_map.put("REVIEW_CNT", board_service.review_count(review_map)); //���� ī��Ʈ �߰�
				if(list_map.get("PRODUCT_PICTURE") != null) {
					list_map.put("PRODUCT_PICTURE", list_map.get("PRODUCT_PICTURE").toString().split(",")[1]); //�����̸� �־��ֱ�
				} 
				
			}
			//�־��� ����Ʈ �ߺ������ϱ�
			String pn1 = "";
			String pn2 = "";
			for(int i = 0; i < search_item_list.size(); i++) {
				pn1 = search_item_list.get(i).get("PRODUCT_NAME").toString();
				for(int j = search_item_list.size()-1; j>i; j--) {
					pn2 = search_item_list.get(j).get("PRODUCT_NAME").toString();
					if(pn1.equals(pn2)) {
						search_item_list.remove(j);
					}
				}
			}
			// ����¡ ó��
			List<HashMap<String,Object>> search_item = new ArrayList<HashMap<String,Object>>();
			int totalRowCount = search_item_list.size();
			PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5);
			for(int i = util.getStartRow()-1 ; i < util.getEndRow()-1; i++) {
				search_item.add(search_item_list.get(i));
				if(i==totalRowCount-1) break;
			}	   
			model.addAttribute("total_count", totalRowCount); // ��ü �˻��� �� ���
			
			// �����ϱ�
		    if(list_arr.equals("REVIEW_CNT")) {
				Collections.sort(search_item, new Comparator<HashMap<String,Object>>() {
					@Override
					public int compare(HashMap<String, Object> o1, HashMap<String, Object> o2) {
						Integer cnt1 = (Integer)o1.get(list_arr_val);
						System.out.println(cnt1);
						Integer cnt2 = (Integer)o2.get(list_arr_val);
						return cnt2.compareTo(cnt1);
					}
				});	
			}else if(list_arr.equals("PRODUCT_NAME") || list_arr.equals("PRODUCT_ISSUE_DATE")) {
				Collections.sort(search_item, new Comparator<HashMap<String,Object>>() {
					@Override
					public int compare(HashMap<String, Object> o1, HashMap<String, Object> o2) {
						String cnt1 = (String)o1.get(list_arr_val);
						String cnt2 = (String)o2.get(list_arr_val);
						return cnt2.compareTo(cnt1); 
					}
				});	
			}else if(list_arr.equals("PRODUCT_GRADE")){
				Collections.sort(search_item, new Comparator<HashMap<String,Object>>() {
					@Override
					public int compare(HashMap<String, Object> o1, HashMap<String, Object> o2) {
						Integer cnt1 = Integer.parseInt(o1.get(list_arr_val).toString()) ;
						Integer cnt2 =  Integer.parseInt(o2.get(list_arr_val).toString()) ;
						return cnt2.compareTo(cnt1); 
					} 
				}); 
			}
		    if(list_arr.equals("cnt") || list_arr.equals("PRODUCT_NAME")) {
				Collections.reverse(search_item);
		    }
		
			//ī�װ��� ī��Ʈ
			List<HashMap<String,Object>> cate_count_list = new ArrayList<HashMap<String,Object>>();
			HashMap<String, Object> cate_map = new HashMap<String, Object>(); 
			cate_map.put("cate_code", "100");
			List<Item_Cate_Vo> domestic_vo = cate_service.cate_list(cate_map);
			int cate_cnt = 0;
			for(Item_Cate_Vo vo : domestic_vo) {
				HashMap<String, Object> cate_add = new HashMap<String, Object>(); 
				cate_cnt = 0;
				for(HashMap<String,Object> map : search_item) {
					String cate_num = cate_service.cate_info(Integer.parseInt(map.get("PRODUCT_CATE_NUM").toString())).getCate_ref3() ;
					if(vo.getCate_ref1().equals(cate_num)) {
						cate_cnt++;
					} 
				} 
				if(cate_cnt>0) {
					cate_add.put("cate_code", vo.getCate_ref1());
					cate_add.put("cate_name", vo.getCate_name());
					cate_add.put("cate_count", cate_cnt);
					cate_count_list.add(cate_add);
				}
			} 
			cate_map.put("cate_code", "700"); 
			List<Item_Cate_Vo> oversea_vo = cate_service.cate_list(cate_map);
			for(Item_Cate_Vo vo : oversea_vo) {
				HashMap<String, Object> cate_add = new HashMap<String, Object>(); 
				cate_cnt = 0;
				for(HashMap<String,Object> map : search_item) {
					String cate_num = cate_service.cate_info(Integer.parseInt(map.get("PRODUCT_CATE_NUM").toString())).getCate_ref3() ;
					if(vo.getCate_ref1().equals(cate_num)) {
						cate_cnt++;
					}
				} 
				if(cate_cnt>0) {
					cate_add.put("cate_code", vo.getCate_ref1());
					cate_add.put("cate_name", vo.getCate_name());
					cate_add.put("cate_count", cate_cnt);
					cate_count_list.add(cate_add);
				}
				
			} 
			if(cate_count_list.size()>0) { // ī�װ� �˻��� ����� ����
				Collections.sort(cate_count_list, new Comparator<HashMap<String,Object>>() {
					@Override
					public int compare(HashMap<String, Object> o1, HashMap<String, Object> o2) {
						Integer cnt1 = (Integer)o1.get("cate_count");
						Integer cnt2 = (Integer)o2.get("cate_count") ;
						return cnt2.compareTo(cnt1); 
					}  
				}); 
			model.addAttribute("cate_count_list", cate_count_list); 
			
			// ī�װ� �󼼰˻� ���� �ִ°��
			List<HashMap<String,Object>> cate_item_list = new ArrayList<HashMap<String,Object>>();
			if(cate_code != null && !(cate_code.equals(""))) {
				for(HashMap<String,Object> map: search_item) {
					String cate_num = cate_service.cate_info(Integer.parseInt(map.get("PRODUCT_CATE_NUM").toString())).getCate_ref3();
					if(cate_code.equals(cate_num)) {
						cate_item_list.add(map);
					}
				}
				model.addAttribute("item_list",cate_item_list);
			}else {
				model.addAttribute("item_list",search_item);
			}
			 
			model.addAttribute("util", util); 
			}
		}  
		model.addAttribute("cate_code", cate_code); 
		model.addAttribute("list_arr", list_arr); 
		model.addAttribute("keyword", keyword); 
		return ".registration.search";
	}
	@RequestMapping(value="/editor_detail", method = RequestMethod.GET)
	public String editor_detail(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
						 @RequestParam(value = "rowCount", defaultValue = "10") int rowCount,
						 @RequestParam(value = "list_arr", defaultValue = "cnt") String list_arr, int editor_num, String msg, Model model) {
		// �۰����� �޾ƿ���
		Item_Editor_Vo editor_vo =  cate_service.editor_getinfo(editor_num);
		String[] editor_birth_arr = new String[3];
		if(editor_vo.getEditor_birth() != null) {
			editor_birth_arr = editor_vo.getEditor_birth().split("-");
		}
		String editor_school = "";
		if(editor_vo.getEditor_school() != null) {
			editor_school = editor_vo.getEditor_school().replaceAll(",", "<br>");
		}
		String editor_award = "";
		if(editor_vo.getEditor_award() != null) {
			editor_award = editor_vo.getEditor_award().replaceAll(",", "<br>");
		}
		// �۰� ��ǥ����Ʈ 
		HashMap<String, Object> editor_map = new HashMap<String, Object>();
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		editor_map.put("list_arr", list_arr);
		editor_map.put("book_list", "book_list");
		editor_map.put("product_editor_num", editor_num);
		if(pageNum<1) pageNum = 1;   
		int totalRowCount = service.get_count(editor_map);//������ ó��
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5);
		editor_map.put("startRow", util.getStartRow()); 
		editor_map.put("endRow", util.getEndRow());
		List<HashMap<String, Object>> editor_item_list = service.sell_list(editor_map);
		for(HashMap<String, Object> list_map: editor_item_list) { //�۰� �����ǰ ����Ʈ 
			review_map.put("product_num", list_map.get("PRODUCT_NUM"));
			list_map.put("REVIEW_CNT", board_service.review_count(review_map)); //���� ī��Ʈ �߰�
			int editor_nums = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
			list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_nums).getEditor_name()); //�۰��̸� �߰�
			int cate = Integer.parseInt((list_map.get("PRODUCT_CATE_NUM")).toString()); 
			list_map.put("CATE_NAME", cate_service.cate_info(cate).getCate_name()); //ī�׸� �߰�
		}    
		if(msg != null) { 
			model.addAttribute("msg", msg); 
		}
		model.addAttribute("util", util); 
		model.addAttribute("list_arr", list_arr); 
		model.addAttribute("editor_vo", editor_vo); // �۰� ������ 
		model.addAttribute("editor_item_list", editor_item_list); // �۰� �����ǰ
		model.addAttribute("editor_birth_arr", editor_birth_arr); //�۰� ������� �迭
		model.addAttribute("editor_school", editor_school); //�۰� �з�
		model.addAttribute("editor_award", editor_award); //�۰� ������
		return ".registration.editor_detail";
	}
  
}
 