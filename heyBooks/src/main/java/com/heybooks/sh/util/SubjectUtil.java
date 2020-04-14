package com.heybooks.sh.util;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.heybooks.sh.service.board.Board_Service;
import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.service.item.Item_Main_Service;

@Component
public class SubjectUtil { 
	private Item_Category_Service cate_service;
	private Item_Main_Service service;
	private Board_Service board_service;
	private Model model; 
	private int topic_count; 
	private PageUtil topic_util;  
	private HashMap<String, Object> map;
	private HashMap<String, Object> review_map; 
	List<HashMap<String, Object>> topic_item_list;
	int[] cate_code_arr;
	 
	public SubjectUtil() {}
	public SubjectUtil(int[] cate_code_arr, HashMap<String, Object> map, HashMap<String, Object> review_map, Model model, Item_Category_Service cate_service, Item_Main_Service service, Board_Service board_service, String cate , String arr) {
		this.cate_code_arr = cate_code_arr;  
		this.map = map;
		this.review_map = review_map;
		this.model = model;  
		this.cate_service =cate_service;
		this.service = service;
		this.board_service = board_service;
		for(int i = 0; i<cate_code_arr.length; i++) {
			map.put(cate, cate_code_arr[i]); 
			map.put("startRow", 1);    
			map.put("endRow", 15);   
			topic_item_list = service.sell_list(map);  
			if( topic_item_list.size() > 0) {
				for(HashMap<String,Object> list_map: topic_item_list ) { //리스트에 추가정보 담기 
					review_map.put("product_num", list_map.get("PRODUCT_NUM"));
					int editor_num = Integer.parseInt((list_map.get("PRODUCT_EDITOR_NUM")).toString()); 
					list_map.put("EDITOR_NAME", cate_service.editor_getinfo(editor_num).getEditor_name()); //작가 이름 추가
					list_map.put("REVIEW_CNT", board_service.review_count(review_map)); //리뷰 카운트 추가
				}       
			} 
			if(arr.equals("new")) {
				model.addAttribute("new_item_list"+(i+1), topic_item_list);
			}else if(arr.equals("best")) {
				model.addAttribute("best_item_list"+(i+1), topic_item_list);
			}
		}
	} 
	public Item_Category_Service getCate_service() {
		return cate_service;
	}
	public void setCate_service(Item_Category_Service cate_service) {
		this.cate_service = cate_service;
	}
	public Item_Main_Service getService() {
		return service;
	}
	public void setService(Item_Main_Service service) {
		this.service = service;
	}
	public Board_Service getBoard_service() {
		return board_service;
	}
	public void setBoard_service(Board_Service board_service) {
		this.board_service = board_service;
	}
	public Model getModel() {
		return model;
	}
	public void setModel(Model model) {
		this.model = model;
	}
	public int getTopic_count() {
		return topic_count;
	}
	public void setTopic_count(int topic_count) {
		this.topic_count = topic_count;
	}
	public PageUtil getTopic_util() {
		return topic_util;
	}
	public void setTopic_util(PageUtil topic_util) {
		this.topic_util = topic_util;
	}
	public HashMap<String, Object> getMap() {
		return map;
	}
	public void setMap(HashMap<String, Object> map) {
		this.map = map;
	}
	public HashMap<String, Object> getReview_map() {
		return review_map;
	}
	public void setReview_map(HashMap<String, Object> review_map) {
		this.review_map = review_map;
	}
	public List<HashMap<String, Object>> getTopic_item_list() {
		return topic_item_list;
	}
	public void setTopic_item_list(List<HashMap<String, Object>> topic_item_list) {
		this.topic_item_list = topic_item_list;
	}
	public int[] getCate_code_arr() {
		return cate_code_arr;
	}
	public void setCate_code_arr(int[] cate_code_arr) {
		this.cate_code_arr = cate_code_arr;
	}
}
