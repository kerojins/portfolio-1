package com.heybooks.sh.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.heybooks.sh.service.board.Board_Service;
import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.util.SubjectUtil;
import com.heybooks.sh.vo.admin.Admin_Vo;
import com.heybooks.sh.vo.board.Event_Vo;
import com.heybooks.sh.vo.board.Notice_Vo;
import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.member.Member_Vo;


@Controller
public class HomeController {
	@Resource
	Item_Main_Service item_service;
	@Resource
	Item_Category_Service cate_service;
	@Resource
	Board_Service board_service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request, String scroll_top) {
		 
		//ī�װ�
		HashMap<String, Object> category_map = new HashMap<String, Object>(); 
		category_map.put("cate_code", "100");
		List<Item_Cate_Vo> domestic_vo = cate_service.cate_list(category_map);
		category_map.put("cate_code", "700");
		List<Item_Cate_Vo> oversea_vo = cate_service.cate_list(category_map);
		model.addAttribute("domestic_cate_list", domestic_vo);
		model.addAttribute("oversea_cate_list", oversea_vo);
		  
		//�Ű� ����
		HashMap<String, Object> new_item_map = new HashMap<String, Object>();
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		new_item_map.put("main_new_item", "main_new_item");
		new_item_map.put("list_arr", "cnt");
		new_item_map.put("book_list", "book_list");
		new_item_map.put("startRow","1");
		new_item_map.put("endRow","3"); 
		List<HashMap<String, Object>> new_item_list = item_service.sell_list(new_item_map); 
		if(new_item_list.size() > 0) {
			for(HashMap<String, Object> list_map: new_item_list) { //�۰� �̸� ����Ʈ 
				review_map.put("product_num", list_map.get("PRODUCT_NUM"));
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				int cate = Integer.parseInt((list_map.get("PRODUCT_CATE_NUM")).toString()); 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //�۰��̸� �߰�
				list_map.put("CATE_NAME", cate_service.cate_info(cate).getCate_name()); //ī�׸� �߰�
				list_map.put("REVIEW_CNT", board_service.review_count(review_map)); //���� ī��Ʈ �߰�
				}   
		} 
		model.addAttribute("new_item_list", new_item_list);
		
		//�̺�Ʈ
		HashMap<String, Object> event_map = new HashMap<String, Object>();
		event_map.put("list_arr","event_date desc"); 
		event_map.put("event_now","now"); 
		event_map.put("startRow","1"); 
		event_map.put("endRow","5"); 
		List<Event_Vo> event_list = board_service.event_list(event_map); 
		model.addAttribute("event_list", event_list);
		
		//�ְ� ����Ʈ����
		Calendar today = Calendar.getInstance();
		Date best_date = new Date();
		int today_date = today.get(Calendar.DATE);
		int date = 0;
		int dayOfWeek = 0;
		date = today.getActualMaximum(Calendar.DATE);
		today.set(Calendar.HOUR_OF_DAY, 0);
		today.set(Calendar.MINUTE, 0); 
		today.set(Calendar.SECOND, 0);
		today.set(Calendar.MILLISECOND, 0);
		int week_num = 1;
		for(int i= 1; i <= date; i++) {
				today.set(Calendar.DATE, i); 
				dayOfWeek = today.get(Calendar.DAY_OF_WEEK); 
			if( (i==1 && dayOfWeek == 1) || (i==1 && dayOfWeek == 6) || (i==1 && dayOfWeek == 7)) {
				week_num = 0;
			}  
			if(dayOfWeek==2) {  
				week_num++; 
				if(i==1) week_num--;
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
		HashMap<String, Object> item_map = new HashMap<String, Object>();
		item_map.put("list_arr", "cnt");  
		item_map.put("best_date", best_date);  
		item_map.put("book_list", "book_list"); 
		item_map.put("startRow", "1"); 
		item_map.put("endRow", "11"); 
		List<HashMap<String, Object>> weekly_item_list = item_service.sell_list(item_map);
		if(weekly_item_list.size() > 0) {
			for(HashMap<String,Object> list_map: weekly_item_list) { //����Ʈ�� �߰����� ��� 
				review_map.put("product_num", list_map.get("PRODUCT_NUM"));
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				int cate = Integer.parseInt((list_map.get("PRODUCT_CATE_NUM")).toString()); 
				String pic ="";
				if(list_map.get("PRODUCT_PICTURE") != null) {
					pic = list_map.get("PRODUCT_PICTURE").toString().split(",")[1];
					list_map.put("PRODUCT_PICTURE", pic);
				} 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //���� ī��Ʈ �߰�
				list_map.put("CATE_NAME", cate_service.cate_info(cate).getCate_name()); //���� ī��Ʈ �߰�
				list_map.put("REVIEW_CNT", board_service.review_count(review_map)); //���� ī��Ʈ �߰�
			}   
		}
		System.out.println(weekly_item_list.toString());
		model.addAttribute("weekly_item_list", weekly_item_list);
		
		// ���� ����Ʈ����
		Date best_month_date = today.getTime();
		item_map.remove("best_date");   
		item_map.put("best_month_date", best_month_date);
		List<HashMap<String, Object>> monthly_item_list = item_service.sell_list(item_map);
		if(monthly_item_list.size() > 0) {
			for(HashMap<String,Object> list_map: monthly_item_list) { //����Ʈ�� �߰����� ��� 
				review_map.put("product_num", list_map.get("PRODUCT_NUM"));
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				int cate = Integer.parseInt((list_map.get("PRODUCT_CATE_NUM")).toString()); 
				String pic ="";
				if(list_map.get("PRODUCT_PICTURE") != null) {
					pic = list_map.get("PRODUCT_PICTURE").toString().split(",")[1];
					list_map.put("PRODUCT_PICTURE", pic);
				} 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //���� ī��Ʈ �߰�
				list_map.put("CATE_NAME", cate_service.cate_info(cate).getCate_name()); //���� ī��Ʈ �߰�
				list_map.put("REVIEW_CNT", board_service.review_count(review_map)); //���� ī��Ʈ �߰�
			}   
		}
		model.addAttribute("monthly_item_list", monthly_item_list);
		
		
		// ���ɺ� ���� ������ å
		HttpSession session = request.getSession(); // ������ ��ȣ ���
		Member_Vo member_vo = (Member_Vo) session.getAttribute("member"); 
		int today_year = today.get(Calendar.YEAR);
		HashMap<String, Object> year_map = new HashMap<String, Object>();
		year_map.put("list_arr", "cnt");
		year_map.put("book_list", "book_list");
		year_map.put("startRow", 1);
		year_map.put("endRow", 9);
		
		if(member_vo != null) { //�α��� ���� ��� 
			int years = (today_year - Integer.parseInt("19"+ member_vo.getMembers_years().substring(0, 2)) + 9)/10*10;
			//2000�� ���� ��� ó�� 
			if(member_vo.getMembers_years().substring(0, 1).equals("1") || member_vo.getMembers_years().substring(0, 1).equals("0")) {
				years = (today_year - Integer.parseInt("20"+ member_vo.getMembers_years().substring(0, 2)) + 9)/10*10;
			}
			if(years==10) { //���̰� 10�캸�� ���� ��� 10��� ��ȯ
				years = 20;
			}
			year_map.put("members_years", years-1);  
			year_map.put("members_gender", member_vo.getMembers_gender());
			model.addAttribute("members_years", years-10);
			model.addAttribute("members_gender", member_vo.getMembers_gender().substring(0,1)+"��");
			
		}else { // �α��� �����ʾ������
			int years = (int)Math.floor(Math.random() * 5) + 2; // ������ ��ȯ
			int gen = (int)Math.floor(Math.random() * 2);
			year_map.put("members_years", years*10-1); 
			if(gen == 1) {
				year_map.put("members_gender", "����"); 
				model.addAttribute("members_gender", "����");
			}else {   
				year_map.put("members_gender", "����");
				model.addAttribute("members_gender", "����");
			}
			model.addAttribute("members_years", years*10-10);
		}
		
		List<HashMap<String, Object>> years_item_list = item_service.sell_list(year_map);
		if(years_item_list.size() > 0) {
			for(HashMap<String,Object> list_map: years_item_list) { //����Ʈ�� �߰����� ��� 
				review_map.put("product_num", list_map.get("PRODUCT_NUM"));
				int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
				int cate = Integer.parseInt((list_map.get("PRODUCT_CATE_NUM")).toString()); 
				String pic ="";
				if(list_map.get("PRODUCT_PICTURE") != null) {
					pic = list_map.get("PRODUCT_PICTURE").toString().split(",")[1];
					list_map.put("PRODUCT_PICTURE", pic);
				} 
				list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //���� ī��Ʈ �߰�
				list_map.put("CATE_NAME", cate_service.cate_info(cate).getCate_name()); //���� ī��Ʈ �߰�
				list_map.put("REVIEW_CNT", board_service.review_count(review_map)); //���� ī��Ʈ �߰�
			}   
		}
		model.addAttribute("years_item_list",years_item_list);
		
		// �����ִ� �о� ����Ʈ
		HashMap<String, Object> cate_map = new HashMap<String, Object>(); 
		cate_map.put("cate_code", "100");
		HashMap<String, Object> favorite_map = new HashMap<String, Object>(); 
		favorite_map.put("list_arr", "cnt"); // �Ǹż����� ����
		favorite_map.put("book_list", "book_list"); 
		List<Item_Cate_Vo> cate_list = new ArrayList<Item_Cate_Vo>();
		if(member_vo != null && member_vo.getMembers_favorite() != null) { //�α������� �� ���ɻ� ������ ���
			String [] members_favorite = member_vo.getMembers_favorite().split(",");
			for(String num : members_favorite) {
				cate_list.add(cate_service.cate_info(Integer.parseInt(num)));
			}
			int cate_arr[] = new int[cate_list.size()]; 
			for(int i = 0 ; i < cate_list.size() ; i++) {  //������ ������ ī�װ� ��ȣ �迭�� ���
				cate_arr[i] = Integer.parseInt(cate_list.get(i).getCate_ref1());
			} 
			//�� ī�װ����� 12���� �������� ����ִ� Util ȣ��
			SubjectUtil arr_cnt_add = new SubjectUtil(cate_arr, favorite_map, review_map, model, cate_service, item_service, board_service,"cate_code", "best"); // ī���ڵ� �� ����Ʈ ��� �޾ƿ��� �𵨿� ����
			if(arr_cnt_add != null) {
				model.addAttribute("member_vo", member_vo); 
			}
		}else { //�α��� ������ ��
			int cate_arr[] = new int[5]; 
			for(int i = 0 ; i < 5 ; i++) { //���� ī�װ��� ���� 5�� ��ȣ �迭�� ���
				cate_arr[i] = Integer.parseInt(domestic_vo.get(i).getCate_ref1());
				cate_list.add(cate_service.cate_info(domestic_vo.get(i).getCate_num()));
			}  
			//�� ī�װ����� 12���� �������� ����ִ� Util ȣ�� 
			SubjectUtil arr_cnt_add = new SubjectUtil(cate_arr, favorite_map, review_map, model, cate_service, item_service, board_service,"cate_code", "best"); // ī���ڵ� �� ����Ʈ ��� �޾ƿ��� �𵨿� ����
			if(arr_cnt_add !=null) {
				model.addAttribute("cate_basic", "basic");
			}
		}
		if(scroll_top != null && !(scroll_top.equals(""))) {
			model.addAttribute("scroll_top", scroll_top);
		}
		model.addAttribute("cate_list", cate_list);
		model.addAttribute("domestic_vo", domestic_vo);
		  
		//����
		HashMap<String, Object> notice_map = new HashMap<String, Object>();
		notice_map.put("list_arr", "notice_date");
		notice_map.put("startRow", "1");
		notice_map.put("endRow", "5");
		List<Notice_Vo> notice_list = board_service.notice_list(notice_map);
		model.addAttribute("notice_list", notice_list);
		
		return ".main";   
	}  
	
}
