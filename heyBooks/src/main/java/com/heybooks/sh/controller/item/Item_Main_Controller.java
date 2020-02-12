package com.heybooks.sh.controller.item;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.heybooks.sh.service.admin.Admin_Service;
import com.heybooks.sh.service.board.Board_Service;
import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.service.item.Item_Order_Service;
import com.heybooks.sh.util.PageUtil;
import com.heybooks.sh.vo.admin.Admin_Alert_Vo;
import com.heybooks.sh.vo.admin.Admin_Vo;
import com.heybooks.sh.vo.board.Review_Vo;
import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;
import com.heybooks.sh.vo.item.Item_Vo;

@Controller
public class Item_Main_Controller {

	private static final Logger logger = LoggerFactory.getLogger(Item_Main_Controller.class);

	@Resource
	private Item_Category_Service cate_service;
	@Resource
	private Item_Main_Service service;
	@Resource
	private Item_Order_Service order_service;
	@Resource
	private Board_Service board_service;
	@Resource
	private Admin_Service admin_service;

	// 1. 상품 - 추가
	@RequestMapping(value = "/admin_item_add", method = RequestMethod.GET)
	public String admin_item_add(Model model) {
		logger.info("get item-add");
		// 작가 리스트 연결
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list_arr", "editor_name");
		List<Item_Editor_Vo> editor_list = cate_service.editor_list(map);
		model.addAttribute("editor_list", editor_list);

		// 출판사 리스트 연결
		List<String> publishing_list = cate_service.publishing_list();
		model.addAttribute("publishing_list", publishing_list);
		return ".admin.admin_item_add";
	}

	@RequestMapping(value = "/admin_item_add", method = RequestMethod.POST)
	public String admin_item_add(Item_Vo vo, Model model, HttpServletRequest request) {
		logger.info("post item-add");
		HttpSession session = request.getSession();
		Admin_Vo admin = (Admin_Vo)session.getAttribute("admin");
		int admin_num = admin.getAdmin_num();
		String discription = vo.getProduct_discription().replaceAll("<br>","\r\n"); // 작가 소개 줄바꿈 표시
		vo.setProduct_discription(discription); 
		 
		service.item_insert(vo); 
		admin_service.admin_alert_insert(new Admin_Alert_Vo(0, admin_num, 1, "새로운 상품을 등록했습니다.", null));
		return "redirect:/admin_item_list";  
	 

	}

	// 2. 상품 - 리스트
	@RequestMapping(value = "/admin_item_list", method = RequestMethod.GET)
	public String admin_item_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
								  @RequestParam(value = "rowCount", defaultValue = "10") int rowCount,
								  @RequestParam(value = "list_arr", defaultValue = "product_date") String list_arr, Model model, HttpServletRequest request,
								  String keyword, String search_date, String search_end_date, String product_publish, String product_editor_num , String category1, String category2,  String category3, 
								  String start_price, String end_price, String start_stock, String end_stock, String product_status, String product_view) {
		logger.info("get item-list"); 
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(keyword != null && !(keyword.equals(""))) { 
			map.put("keyword", keyword);
		}
		if(search_date != null && !(search_date.equals(""))) {
			map.put("search_date", search_date);
		}
		if(search_end_date != null && !(search_end_date.equals(""))) {
			map.put("search_end_date", search_end_date);
		} 
		if(product_publish != null && !(product_publish.equals(""))) {
			map.put("product_publish",product_publish);
		}
		if(product_editor_num != null  && !(product_editor_num.equals(""))) {
			map.put("product_editor_num", product_editor_num);
		}
		if(category1 != null && !(category1.equals(""))) { 
			map.put("category1", category1);
		}
		if(category2 != null && !(category2.equals(""))) {
			map.put("category2", category2);
		} 
		if(category3 != null && !(category3.equals(""))) { 
			map.put("category3", category3);
		}
		if(start_price != null && !(start_price.equals(""))) { 
			map.put("start_price", start_price);
		} 
		if(end_price != null && !(end_price.equals(""))) { 
			map.put("end_price", end_price);
		}
		if(start_stock != null && !(start_stock.equals(""))) { 
			map.put("start_stock", start_stock);
		}
		if(end_stock != null && !(end_stock.equals(""))) { 
			map.put("end_stock", end_stock);
		}
		if(product_status != null && !(product_status.equals(""))) { 
			String[] st_arr = product_status.split(",");
			String status = ""; 
			for(String st : st_arr) {
				status +=  "'"+st+"',";
			}   
			status = status.substring(0,status.length()-1);
			map.put("product_status", status); 
		} 
		if(product_view != null && !(product_view.equals(""))) { 
			map.put("product_view", product_view);
		} 
		int totalRowCount = service.get_count(map); // 전체 글 수 얻기
		System.out.println(totalRowCount);
		if(pageNum<1) pageNum = 1; 
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5); // 페이징처리
		String list_arr_val = list_arr; 
		
		if (list_arr.equals("product_discount_price")) { // 리스트 순서정하기
			list_arr_val = "round(replace(product_discount_price, ',', ''))";
		} 
	
		map.put("list_arr", list_arr_val);  
		map.put("startRow", util.getStartRow()); 
		map.put("endRow", util.getEndRow());
		HashMap<String, Object> editor_map = new HashMap<String, Object>();
		editor_map.put("list_arr", "editor_name"); 
		
		List<HashMap<String, Object>> sell_list = service.sell_list(map);
		List<String> publishing_list = cate_service.publishing_list();
		List<Item_Editor_Vo> editor_list = cate_service.editor_list(editor_map);
		 
		model.addAttribute("keyword", keyword);
		model.addAttribute("search_date", search_date);
		model.addAttribute("product_publish",product_publish);
		model.addAttribute("category1", category1);
		model.addAttribute("category2", category2); 
		model.addAttribute("category3", category3);
		model.addAttribute("start_price", start_price);
		model.addAttribute("end_price", end_price); 
		model.addAttribute("start_stock", start_stock);
		model.addAttribute("end_stock", end_stock);
		model.addAttribute("product_status", product_status);
		model.addAttribute("product_view", product_view);
		 
		model.addAttribute("rowCount", rowCount); // 보여질 아이템 갯수
		model.addAttribute("totalRowCount", totalRowCount); // 보여질 아이템 갯수
		model.addAttribute("list_arr", list_arr); // 아이템 정렬 기준
		model.addAttribute("publishing_list", publishing_list);
		model.addAttribute("editor_list", editor_list);
		model.addAttribute("util", util);
		model.addAttribute("sell_list", sell_list);  
		
		 
		return ".admin.admin_item_list"; 
	}

	// 3. 상품 묶음 삭제
	@RequestMapping(value = "/item_select_del", method = RequestMethod.POST)
	public String item_select_del(String select_ck_num, HttpServletRequest request) {
		logger.info("post item-delete");
		String ROOT_PATH = request.getSession().getServletContext().getRealPath("/resources/upload/");
		String[] select_arr = select_ck_num.split(",");
		ArrayList<String> img_list = new ArrayList<String>();
		for (String num : select_arr) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("product_num", Integer.parseInt(num));
			order_service.order_item_null(Integer.parseInt(num)); // 주문 아이템 null 입력
			order_service.cart_delete(map); 
			List<Review_Vo> review_list = board_service.review_list(map);
			for(Review_Vo re_vo : review_list) { // 상품 리뷰 삭제 
				map.put("review_num", re_vo.getReview_num()); 
				board_service.review_reply_delete(map);
				board_service.review_delete(re_vo.getReview_num());
			} 
			Item_Vo vo = service.item_getinfo(Integer.parseInt(num));
			if (vo.getProduct_preview() != null ) {
				String[] pr_img = vo.getProduct_preview().split(",");
				for (String pr_img_name : pr_img) {
					img_list.add(pr_img_name);
				}
			}
			if(vo.getProduct_picture() != null) {
				img_list.add(vo.getProduct_picture().split(",")[0]);
				img_list.add(vo.getProduct_picture().split(",")[1]);
			}
			for (String file_name : img_list) {
				File file = new File(ROOT_PATH + file_name);
				file.delete();
			}
			service.item_delete(Integer.parseInt(num));
		}
		return "redirect:/admin_item_list";
	}


	
	// 상품 선택(한개) 삭제
	@RequestMapping(value = "/item_select_del", method = RequestMethod.GET)
	public String item_select_del(int product_num, HttpServletRequest request) {
		logger.info("get item-delete");
		String ROOT_PATH = request.getSession().getServletContext().getRealPath("/resources/upload/");
		ArrayList<String> img_list = new ArrayList<String>();
		Item_Vo vo = service.item_getinfo(product_num);
		if (vo.getProduct_preview() != null || vo.getProduct_picture() != null) {
			String[] pr_img = vo.getProduct_preview().split(",");
			for (String pr_img_name : pr_img) {
				img_list.add(pr_img_name);
			}
			img_list.add(vo.getProduct_picture().split(",")[0]);
			img_list.add(vo.getProduct_picture().split(",")[1]);
		}
		for (String file_name : img_list) {
			new File(ROOT_PATH + file_name).delete();
			logger.info(ROOT_PATH + file_name);
		}
		service.item_delete(product_num);
		return "redirect:/admin_item_list";

	}
 
	// 4. 상품 상세 정보
	@RequestMapping(value = "/item_getinfo", method = RequestMethod.GET)
	public String item_getinfo(int product_num, Model model, HttpServletRequest request) {
		String ROOT_PATH = request.getSession().getServletContext().getRealPath("/resources/upload/");
		Item_Vo vo = service.item_getinfo(product_num);
		String cate_name = "";
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("cate_num1", vo.getProduct_cate_num());
		map.put("cate_num2", vo.getProduct_cate_num());
		map.put("cate_num3", vo.getProduct_cate_num());
		List<Item_Cate_Vo> list = cate_service.get_category(map);
		Item_Editor_Vo editor_vo = cate_service.editor_getinfo(vo.getProduct_editor_num());
		// 카테고리 표시 서식
		for (Item_Cate_Vo cate_vo : list) {
			cate_name += cate_vo.getCate_name() + " > ";
		}
		cate_name = cate_name.substring(0, cate_name.length() - 3);
		// 작가 정보 서식
		String editor_info = "";
		if(editor_vo != null) {
			 editor_info = editor_vo.getEditor_name() + " / " + editor_vo.getEditor_birth();
		}
		String[] product_index = vo.getProduct_index().split(",");

		// 상품 프리뷰 배열
		if (vo.getProduct_picture() != null) {
			String[] picture = vo.getProduct_picture().split(",");
			model.addAttribute("picture", picture);
		}
		if (vo.getProduct_preview() != null) {
			String[] preview_list = vo.getProduct_preview().split(",");
			String preview_full = vo.getProduct_preview();
			File[] preview_file = new File[preview_list.length];
			for (int i = 0; i < preview_list.length; i++) {
				logger.info(ROOT_PATH + preview_list[i]);
				preview_file[i] = new File(ROOT_PATH + preview_list[i]);
			}
			model.addAttribute("preview_list", preview_list);
			model.addAttribute("preview_full", preview_full);
			model.addAttribute("preview_file", preview_file);
		}
		model.addAttribute("vo", vo);
		model.addAttribute("cate_name", cate_name);
		model.addAttribute("editor_info", editor_info);
		model.addAttribute("product_index", product_index);
		return ".admin.admin_item_update";
	}
	


}
