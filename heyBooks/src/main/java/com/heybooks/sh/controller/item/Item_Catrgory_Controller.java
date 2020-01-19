package com.heybooks.sh.controller.item;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.util.PageUtil;
import com.heybooks.sh.vo.item.Item_Editor_Vo;

@Controller
public class Item_Catrgory_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Item_Catrgory_Controller.class);

	@Resource
	private Item_Category_Service service;

	// 1. 작가 등록
	@RequestMapping(value = "/editor_add", method = RequestMethod.GET)
	public String admin_editor_add() {
		logger.info("get editor-add");
		return ".admin.admin_editor_add";
	}

	@RequestMapping(value = "/editor_add", method = RequestMethod.POST)
	public String admin_editor_add(Item_Editor_Vo vo) {
		logger.info("post editor-add");
		String introduce = vo.getEditor_introduce().replaceAll("<br>","\r\n"); // 작가 소개 줄바꿈 표시
		vo.setEditor_introduce(introduce);
		try { 
			service.editor_insert(vo);
			return "redirect:/editor_list";
		} catch (Exception e) {
			return ".registration.alert";
		}

	}

	// 2. 작가 리스트
	@RequestMapping(value = "/editor_list", method = RequestMethod.GET)
	public String editor_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "rowCount", defaultValue = "10") int rowCount,
			@RequestParam(value = "list_arr", defaultValue = "editor_date") String list_arr, Model model,
			HttpServletRequest request) {
		logger.info("get editor-list");
		int totalRowCount = service.editor_get_count();
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (!(list_arr.equals("editor_name"))) {
			list_arr = list_arr + " desc";
		}
		map.put("list_arr", list_arr);
		map.put("startRow", util.getStartRow());
		map.put("endRow", util.getEndRow());
		logger.info(list_arr);
		List<Item_Editor_Vo> editor_list = service.editor_list(map);
		model.addAttribute("list", editor_list); 
		model.addAttribute("util", util);
		return ".admin.admin_editor_list";
	}

	// 3. 작가 묶음 삭제
	@RequestMapping(value = "/editor_delete", method = RequestMethod.POST)
	public String editor_delete(String select_ck_num) {
		logger.info("post editor-delete");
		String[] select_arr = select_ck_num.split(",");
		for (String num : select_arr) {  
			service.item_editor_null(Integer.parseInt(num));
			service.editor_delete(Integer.parseInt(num));
		}
		return "redirect:/editor_list";
	}
	// 작가 선택 삭제 
	@RequestMapping(value = "/editor_delete", method = RequestMethod.GET)
	public String editor_delete(int editor_num) {
		logger.info("get editor-delete");
		service.item_editor_null(editor_num);
		service.editor_delete(editor_num);
		return "redirect:/editor_list"; 
		/*try { 
			service.item_editor_null(editor_num);
			service.editor_delete(editor_num);
			return "redirect:/editor_list";
		} catch (Exception e) {
			return ".registration.alert";
		}*/
	}

	// 4. 작가 정보
	@RequestMapping(value = "/editor_update", method = RequestMethod.GET)
	public String editor_getinfo(int editor_num, Model model) {
		logger.info("get editor-getinfo");
		Item_Editor_Vo vo = service.editor_getinfo(editor_num);
		if (vo.getEditor_school() != null) {
			String[] school = vo.getEditor_school().split(",");
			model.addAttribute("school", school);
		}
		if (vo.getEditor_award() != null) {
			String[] award = vo.getEditor_award().split(",");
			model.addAttribute("award", award);
		}
		model.addAttribute("vo", vo);

		return ".admin.admin_editor_update";
	}

	// 작가 정보 수정
	@RequestMapping(value = "/editor_update", method = RequestMethod.POST)
	public String editor_update(Item_Editor_Vo vo) {
		logger.info("post editor-update");

		String introduce = vo.getEditor_introduce().replaceAll("<br>", "\r\n"); // 작가 소개 줄바꿈 표시
		vo.setEditor_introduce(introduce);
		try {
			service.editor_update(vo);
			return "redirect:/editor_list";
		} catch (Exception e) {
			return ".registration.alert";
		}
	}

}

/*
 * -- 파라미터 받아와서 쉼표 제거하는 방법 -- 작가 insert String school = vo.getEditor_school();
 * // 작가 학력 - 쉼표 중복 없애주기 int school_length = school.length(); int del = 0; for
 * (int i = 1; i < school_length - 1; i++) { char ch1 = school.charAt(i); char
 * ch2 = school.charAt(i + 1); if (ch1 == ',' && ch2 == ',') { del = i; school =
 * school.substring(0, del); school_length = school.length(); break; } } if
 * (school.charAt(school_length - 1) == ',') { school = school.substring(0,
 * school_length - 1); } else { school = school.substring(0, del); }
 * vo.setEditor_school(school);
 * 
 * String award = vo.getEditor_award(); // 작가 수상 - 쉼표 중복 없애주기 int award_length =
 * award.length(); int del2 = 0; for (int j = 1; j < award_length - 1; j++) {
 * char ch1 = award.charAt(j); char ch2 = award.charAt(j + 1); if (ch1 == ',' &&
 * ch2 == ',') { del2 = j; award = award.substring(0, del2); award_length =
 * award.length(); break; } } if (award.charAt(award_length - 1) == ',') { award
 * = award.substring(0, award_length - 1); } else { award = award.substring(0,
 * del2); } vo.setEditor_award(award);
 */