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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.util.PageUtil;
import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;
import com.heybooks.sh.vo.item.Item_Vo;

@Controller
public class Item_Main_Controller {

	private static final Logger logger = LoggerFactory.getLogger(Item_Main_Controller.class);

	@Resource
	Item_Category_Service cate_service;
	@Resource
	Item_Main_Service service;

	// 1. 상품 - 추가
	@RequestMapping(value = "/admin_item_add", method = RequestMethod.GET)
	public String admin_item_add(Model model) {
		logger.info("get item-add");
		// 작가 리스트 연결
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list_arr", "editor_name");
		map.put("startRow", 0);
		map.put("endRow", 99999);
		List<Item_Editor_Vo> editor_list = cate_service.editor_list(map);
		model.addAttribute("editor_list", editor_list);

		// 출판사 리스트 연결
		List<String> publishing_list = cate_service.publishing_list();
		model.addAttribute("publishing_list", publishing_list);
		return ".admin.admin_item_add";
	}

	@RequestMapping(value = "/admin_item_add", method = RequestMethod.POST)
	public String admin_item_add(Item_Vo vo, Model model) {
		logger.info("post item-add");
		System.out.println(vo.getProduct_num()); 
		String discription = vo.getProduct_discription().replaceAll("<br>","\r\n"); // 작가 소개 줄바꿈 표시
		vo.setProduct_discription(discription);
		try { 
			service.item_insert(vo); 
			return "redirect:/admin_item_list";
		} catch (Exception e) {
			return ".registration.alert";
		}

	}

	// 2. 상품 - 리스트
	@RequestMapping(value = "/admin_item_list", method = RequestMethod.GET)
	public String admin_item_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "rowCount", defaultValue = "10") int rowCount,
			@RequestParam(value = "list_arr", defaultValue = "product_date") String list_arr, Model model,
			HttpServletRequest request) {
		logger.info("get item-list");
		int totalRowCount = service.get_count();
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (!(list_arr.equals("product_name"))) {
			list_arr = list_arr + " desc";
		}
		map.put("list_arr", list_arr);
		map.put("startRow", util.getStartRow());
		map.put("endRow", util.getEndRow());
		logger.info("list_arr: "+ list_arr);
		List<Item_Vo> item_list = service.item_list(map);
		model.addAttribute("rowCount", rowCount); // 보여질 아이템 갯수
		model.addAttribute("list_arr", list_arr); // 아이템 정렬 기준
		model.addAttribute("item_list", item_list);
		model.addAttribute("util", util);
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
			Item_Vo vo = service.item_getinfo(Integer.parseInt(num));
			if (vo.getProduct_preview() != null || vo.getProduct_picture() != null) {
				String[] pr_img = vo.getProduct_preview().split(",");
				for (String pr_img_name : pr_img) {
					img_list.add(pr_img_name);
				}
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
		String editor_info = editor_vo.getEditor_name() + " / " + editor_vo.getEditor_birth();
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
