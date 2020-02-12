package com.heybooks.sh.controller.item;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import com.heybooks.sh.vo.board.Review_Vo;
import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;
import com.heybooks.sh.vo.item.Item_Vo;
import com.heybooks.sh.vo.member.Member_Vo;

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
	public String weekly_best_seller(Model model, String cate_num, String cate_ref2){
		logger.info("get weekly-best-seller");
		List<Item_Cate_Vo> domestic_vo = cate_service.cate_list("100");
		List<Item_Cate_Vo> oversea_vo = cate_service.cate_list("700");
		model.addAttribute("domestic_vo", domestic_vo);
		model.addAttribute("oversea_vo", oversea_vo);
		model.addAttribute("cate_num", cate_num);
		model.addAttribute("cate_ref2", cate_ref2);
		return ".item.weekly_best_seller";
	}

	// ���� ����Ʈ ����
	@RequestMapping(value = "/monthly_best_seller", method = RequestMethod.GET)
	public String monthly_best_seller(Model model, String cate_num, String cate_ref2) {
		logger.info("get monthly-best-seller");
		List<Item_Cate_Vo> domestic_vo = cate_service.cate_list("100");
		List<Item_Cate_Vo> oversea_vo = cate_service.cate_list("700");
		model.addAttribute("domestic_vo", domestic_vo);
		model.addAttribute("oversea_vo", oversea_vo); 
		model.addAttribute("cate_num", cate_num);
		model.addAttribute("cate_ref2", cate_ref2);
		return ".item.monthly_best_seller";
	}
 
	// �Ű� ����
	@RequestMapping(value = "/new_book", method = RequestMethod.GET)
	public String new_book(Model model, String cate_num, String cate_ref2) {
		logger.info("get new-book");
		List<Item_Cate_Vo> domestic_vo = cate_service.cate_list("100");
		List<Item_Cate_Vo> oversea_vo = cate_service.cate_list("700");
		model.addAttribute("domestic_vo", domestic_vo);
		model.addAttribute("oversea_vo", oversea_vo);
		model.addAttribute("cate_num", cate_num);
		model.addAttribute("cate_ref2", cate_ref2);
		return ".item.new_book"; 
	}

	// ���� ����
	@RequestMapping(value = "/domestic_book", method = RequestMethod.GET)
	public String domestic_book(Model model) {
		logger.info("get domestic-book");
		List<Item_Cate_Vo> domestic_vo = cate_service.cate_list("100");
		model.addAttribute("domestic_vo", domestic_vo);
		return ".item.domestic_book";
	}

	// �ܱ� ����
	@RequestMapping(value = "/oversea_book", method = RequestMethod.GET)
	public String oversea_book(Model model) {
		logger.info("get new-book");
		List<Item_Cate_Vo> oversea_vo = cate_service.cate_list("700");
		model.addAttribute("oversea_vo", oversea_vo);
		return ".item.oversea_book";
	} 

	// �ߺз� ����
	@RequestMapping(value = "/medium_category_book", method = RequestMethod.GET)
	public String medium_category_book(Model model, String cate_ref1, String cate_name) {
		logger.info("get medium-category-book");
		List<Item_Cate_Vo> medium_cate_vo = cate_service.cate_list(cate_ref1);
		model.addAttribute("medium_cate_vo", medium_cate_vo);
		model.addAttribute("cate_name", cate_name);
		return ".item.medium_category_book";  
	} 

	// �Һз�����
	@RequestMapping(value = "/small_category_book", method = RequestMethod.GET)
	public String small_category_book(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "rowCount", defaultValue = "10") int rowCount,
			@RequestParam(value = "list_arr", defaultValue = "product_date") String list_arr, String cate_num, String cate_name, Model model,
			HttpServletRequest request) {
		logger.info("get small-category-book");
		HashMap<String, Object> count_map = new HashMap<String, Object>();
		count_map.put("cate_num", cate_num);
		int totalRowCount = service.get_count(count_map);//������ ó��
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5);
		HashMap<String, Object> map = new HashMap<String, Object>();
		String list_arr_val = list_arr;
		if (list_arr.equals("product_discount_price")) { // ����Ʈ �������ϱ�
			list_arr_val = "round(replace(product_discount_price, ',', ''))";
			System.out.println(list_arr_val);
		}  
		map.put("list_arr", list_arr_val);  
		map.put("cate_num", cate_num);
		map.put("startRow", util.getStartRow());  
		map.put("endRow", util.getEndRow());
		logger.info("list_arr: "+ list_arr);
		List<Item_Vo> item_list = service.item_list(map);
		logger.info(item_list.toString()); 
		System.out.println(item_list.size());
		List<String> editor_name = new ArrayList<String>();
		if(editor_name.size() > 0) {
		for(Item_Vo vo : item_list) { //�۰� �̸� ����Ʈ 
			 editor_name.add(cate_service.editor_getinfo(vo.getProduct_editor_num()).getEditor_name()); 
			} 
		} 
		model.addAttribute("rowCount", rowCount); // ������ ������ ����
		model.addAttribute("list_arr", list_arr); // ������ ���� ����
		model.addAttribute("cate_name", cate_name); // ������ ī�װ� �̸�
		model.addAttribute("cate_num", cate_num); // ������ ī�װ� ��ȣ
		model.addAttribute("editor_name", editor_name); // ������ �۰� �̸� ���
		model.addAttribute("item_list", item_list); 
		model.addAttribute("util", util);
		return ".item.small_category_book"; 
	}    

	// ���� ��������
	@RequestMapping(value = "/book_detail", method = RequestMethod.GET)
	public String book_detail(int product_num, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Item_Vo item_vo = service.item_getinfo(product_num);
		Item_Editor_Vo editor_vo =  cate_service.editor_getinfo(item_vo.getProduct_editor_num());
		Member_Vo member_vo = (Member_Vo)session.getAttribute("member");
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		review_map.put("list_arr", "review_date desc");
		List<Review_Vo> review_list = board_service.review_list(review_map);
		List<Member_Vo> member_list = new ArrayList<Member_Vo>();
		for(Review_Vo vo : review_list) {
			member_list.add(member_service.getInfo(vo.getMembers_num()));
		} 
		if(member_vo!=null) {
			for(Review_Vo vo : review_list) {
				if(vo.getProduct_num() == product_num && vo.getMembers_num() == member_vo.getMembers_num()) {
					vo.setReview_content(vo.getReview_content().replaceAll("\r\n","<br>"));
					model.addAttribute("review_vo", vo); 
				}
			}
		}
		model.addAttribute("item_vo", item_vo); // ��ǰ ������
		model.addAttribute("editor_vo", editor_vo); // �۰� ������ 
		model.addAttribute("member_vo", member_vo); // ȸ�� ������
		model.addAttribute("review_list", review_list); //���� ����Ʈ
		model.addAttribute("member_list", member_list); //������ ����Ʈ
		return ".item.book_detail";  
	} 

}
