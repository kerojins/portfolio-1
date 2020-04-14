package com.heybooks.sh.controller.item;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.service.item.Item_Order_Service;
import com.heybooks.sh.service.member.Member_Service;
import com.heybooks.sh.vo.item.Cart_Vo;
import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Editor_Vo;
import com.heybooks.sh.vo.item.Item_Vo;
import com.heybooks.sh.vo.item.Order_Item_Vo;
import com.heybooks.sh.vo.item.Order_Vo;
import com.heybooks.sh.vo.member.Member_Vo;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class Item_Ajax_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Item_Ajax_Controller.class);
	
	@Resource
	private Member_Service member_service;
	@Resource
	private Item_Category_Service cate_service;
	@Resource
	private Item_Main_Service service;
	@Resource
	private Item_Order_Service order_service;

	// 상품 카테고리 리스트
	@RequestMapping("/jackson/item_cate")
	@ResponseBody
	public List<Item_Cate_Vo> cate_list(String cate_code) {
		logger.info("json/get Item-cate-list");
		HashMap<String, Object> cate_map = new HashMap<String, Object>(); 
		cate_map.put("cate_code", cate_code);
		List<Item_Cate_Vo> clist = cate_service.cate_list(cate_map);
		logger.info(String.valueOf(clist.size()));
		return clist;
	}
 
	// 상품 이미지 업로드
	@RequestMapping("/file_upload")
	@ResponseBody
	public int file_upload(MultipartHttpServletRequest request) {
		logger.info("json/post Item-file-upload");
		String ROOT_PATH = request.getSession().getServletContext().getRealPath("/resources/upload/");
		List<MultipartFile> pv_list = new ArrayList<MultipartFile>();
		Map<String, MultipartFile> file_map = request.getFileMap(); // 프리뷰 이미지
		MultipartFile file = file_map.get("item_file"); // 단일이미지
		String pdt_num = request.getParameter("product_num");

		int pv_length = Integer.parseInt(request.getParameter("pv_length")); // 프리뷰 파일 갯수
		String pic_bool = request.getParameter("pic_bool"); // 상품 사진이 온로드 됐을 때 'true'
		String pv_bool = request.getParameter("pv_bool"); // 상품 사진이 온로드 됐을 때 'true'
		ArrayList<String> img_del_list = new ArrayList<String>();
		Item_Vo vo = new Item_Vo();
		if (pdt_num != null) {
			int product_num = Integer.parseInt(pdt_num); // 프리뷰 파일 갯수
			vo = service.item_getinfo(product_num);
			logger.info(vo.toString());
		}
		// 단일 파일 업로드
		String org_file_name = file.getOriginalFilename();
		long file_size = file.getSize();
		String sav_file_name = System.currentTimeMillis() + org_file_name;
		String sav_file = ROOT_PATH + sav_file_name;
		logger.info(sav_file);
		try {
			if (file_size > 0 && pic_bool.equals("true")) {
				file.transferTo(new File(sav_file));
				// 썸네일(작은 이미지) 생성
				File image = new File(sav_file);
				if (image.exists()) {
					String img_name = image.getName();
					int idx = img_name.lastIndexOf(".");
					String rimg_name = img_name.substring(0, idx);
					String thumbnail_file_name = rimg_name + "-small";
					File tumbnail = new File(ROOT_PATH + thumbnail_file_name);
					tumbnail.getParentFile().mkdir();
					Thumbnails.of(image).size(203, 305).outputFormat("jpg").toFile(tumbnail);
					String item_pic = sav_file_name + "," + thumbnail_file_name + ".jpg";
					logger.info(item_pic);

					if (pdt_num != null && vo.getProduct_picture() != null) {
						// 존재하는 파일 삭제목록에 추가
						img_del_list.add(vo.getProduct_picture().split(",")[0]);
						img_del_list.add(vo.getProduct_picture().split(",")[1]);

						// 존재하는 파일 지우기
						for (String file_name : img_del_list) {
							new File(ROOT_PATH + file_name).delete();
							logger.info(ROOT_PATH + file_name);
						}
					}
					vo.setProduct_picture(item_pic);
				}
			}

			// 다중 파일 업로드
			if (file_map != null && pv_bool.equals("true")) {
				for (int i = 0; i < pv_length; i++) {
					pv_list.add(file_map.get("pv_arr" + i));
				}
				String item_preview = "";
				for (MultipartFile mf : pv_list) {
					String pv_org_file_name = mf.getOriginalFilename();
					long pv_file_size = mf.getSize();
					String pv_sav_file_name = System.currentTimeMillis() + pv_org_file_name;
					String pv_sav_file = ROOT_PATH + pv_sav_file_name;
					mf.transferTo(new File(pv_sav_file));
					item_preview += pv_sav_file_name + ",";
				}
				if (pdt_num != null && vo.getProduct_preview() != null) {
					// 존재하는 파일 삭제목록에 추가
					String[] pr_img = vo.getProduct_preview().split(",");
					for (String pr_img_name : pr_img) {
						img_del_list.add(pr_img_name);
					}
					// 존재하는 파일 지우기
					for (String file_name : img_del_list) {
						new File(ROOT_PATH + file_name).delete();
						logger.info(ROOT_PATH + file_name);
					}
				}
				item_preview = item_preview.substring(0, item_preview.length() - 1); // 마지막 쉼표 제거
				logger.info(item_preview);
				vo.setProduct_preview(item_preview);
			}
			int set_num = (int) (Math.random() * 1000000000) + 1;
			if (pdt_num != null) {
				service.item_img_update(vo);
				return 1;
			} else {
				vo.setProduct_num(set_num);
				service.item_img_insert(vo);
				return set_num;
			}

		} catch (IllegalStateException e) {
			e.printStackTrace();
			return 0;
		} catch (IOException e) {
			e.printStackTrace();
			return 0;
		}

	}

	// 장바구니 한개만 추가
	@RequestMapping("/cart_insert")
	@ResponseBody
	public String cart_insert(int product_num, int count, HttpServletRequest request) {
		logger.info("get cart-insert");
		HttpSession session = request.getSession();
		Member_Vo member_vo = (Member_Vo) session.getAttribute("member");
		if (member_vo == null) {
			return "not login";
		} else {
			Cart_Vo vo = new Cart_Vo(0, member_vo.getMembers_num(), product_num, count, null);
			List<Cart_Vo> cart_list = order_service.cart_list(member_vo.getMembers_num());
			 for(Cart_Vo cart_vo : cart_list) {
				 if(cart_vo.getProduct_num() == product_num) {
					 return "overlap";
				 }
			 }
			order_service.cart_insert(vo);
		}
		return "ok";
	}

	// 장바구니 여러개 추가
	@RequestMapping(value = "/cart_multiple_insert", method = RequestMethod.POST ,produces ="application/text; charset=utf8")
	@ResponseBody
	public String cart_multiple_insert(HttpServletRequest request) {
		logger.info("get cart-multiple-insert"); 
		String[] item_checking = request.getParameterValues("item_checking");
		String[] item_count_num = request.getParameterValues("item_count_num");
		String item_name = "";
		boolean item_remove = false;
		boolean item_return = false;
		if(item_checking != null && item_count_num != null) {
			HttpSession session = request.getSession();
			List<String> item_check = new ArrayList<String>(Arrays.asList(item_checking)); 
			logger.info(item_check.toString());
			List<String> item_count = new ArrayList<String>(Arrays.asList(item_count_num)); 
			Member_Vo member_vo = (Member_Vo) session.getAttribute("member");
			if (member_vo == null) { 
				return "not login"; 
			} else {  
				List<Cart_Vo> cart_list = order_service.cart_list(member_vo.getMembers_num());
				logger.info(cart_list.toString());
				for(int i =  item_check.size()-1; i >= 0; i--) { //장바구니 추가 전 아이템 확인하기
					item_remove = false;
					 for(Cart_Vo vo : cart_list) {
						 if(vo.getProduct_num() == Integer.parseInt(item_check.get(i))) {
							 item_remove = true;
							 item_return = true;
							 Item_Vo item_vo = service.item_getinfo(vo.getProduct_num());
							 item_name += item_vo.getProduct_name()+", "; 
						 } 
					 }  
					 if(item_remove) {
						 item_check.remove(i);
						 item_count.remove(i);  
					 }else{
						 order_service.cart_insert
						 (new Cart_Vo(0, member_vo.getMembers_num(),Integer.parseInt(item_check.get(i)), Integer.parseInt(item_count.get(i)),
								 null));
					 }
				 }
			} 
		}
		 if(item_return) {
		     item_name = item_name.substring(0, item_name.length()-2);
			 return item_name; // 기존상품 존재 시 상품이름 반환
		 }else{   
			 return "cart_add_ok"; 
		 }   
		}
	// 주문 상세 정보
	@RequestMapping("/ajax/order_detail")
	@ResponseBody
	public HashMap<String, Object> order_detail(int order_num){
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<Order_Item_Vo> list = order_service.order_item_list(order_num);
		List<Item_Vo> item_list = new ArrayList<Item_Vo>();
		List<Item_Editor_Vo> editor_list = new ArrayList<Item_Editor_Vo>();
		for(Order_Item_Vo vo: list) {
			Item_Vo item_vo = service.item_getinfo(vo.getProduct_num());
			if(item_vo.getProduct_picture() != null) {
				item_vo.setProduct_picture(item_vo.getProduct_picture().split(",")[0]);
			} 
			item_list.add(item_vo); 
			editor_list.add(cate_service.editor_getinfo(item_vo.getProduct_editor_num()));
		}  
		Order_Vo vo = order_service.order_detail(order_num);
		Member_Vo member_vo = member_service.getInfo(vo.getMembers_num());
		map.put("list", list); 
		map.put("item_list", item_list); 
		map.put("editor_list", editor_list); 
		map.put("member_vo", member_vo); 
		map.put("vo", vo); 
		return map; 
	}
	
	// 주문 상태 업데이트 
	@RequestMapping("/order_status_update")
	@ResponseBody
	public String order_status_update(String[] select_ck_num, String order_status, Model model) {
		logger.info("post order-status-update");
		if(select_ck_num != null){
			for(String list_order_num : select_ck_num) { 
				Order_Vo vo = new Order_Vo(); 
				vo.setOrder_num(Integer.parseInt(list_order_num));  
				vo.setOrder_status(order_status);
				order_service.order_status_update(vo);
			}  
		}
		return "ok";   
	}
	
	// 주문 상태 업데이트 
	@RequestMapping("/best_get_week")
	@ResponseBody
	public String best_get_week(String year, String month, Model model) {
		logger.info("post order-status-update");
		Calendar cal = Calendar.getInstance();
		Calendar now = Calendar.getInstance();
		cal.set(Calendar.YEAR, Integer.parseInt(year));
		cal.set(Calendar.MONTH, Integer.parseInt(month)-1);
		int date = cal.getActualMaximum(Calendar.DATE);
		int week = 1;
		System.out.println("마지막 날 "+ date);   
		for(int i= 1; i <= date; i++) {
			cal.set(Calendar.DATE, i); 
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
			if( (i==1 && dayOfWeek == 1) || (i==1 && dayOfWeek == 6) || (i==1 && dayOfWeek == 7)) {
				week = 0; 
			}
			if(dayOfWeek==2) {
				if(i==1) week--;
				week++;   
			}  
			if(now.get(Calendar.YEAR) == Integer.parseInt(year) && now.get(Calendar.MONTH) == Integer.parseInt(month) -1 && now.get(Calendar.DATE) == i ) {
			   return String.valueOf(week);
			}
		} 
		return String.valueOf(week);
	} 
	
	//검색 바로보기
	@RequestMapping("/search_preview")
	@ResponseBody
	public HashMap<String,List<HashMap<String, Object>>> search_preview(String keyword){
		HashMap<String,List<HashMap<String, Object>>> search_map = new HashMap<String, List<HashMap<String,Object>>>();
		//키워드 작가명 - 작가리스트 프리뷰 
		HashMap<String,Object> editor_map = new HashMap<String, Object>();
		List<HashMap<String,Object>> search_editor_list = new ArrayList<HashMap<String,Object>>();
		editor_map.put("keyword", keyword);
		List<Item_Editor_Vo> editor_list = cate_service.editor_list(editor_map);
		if(editor_list.size()>0) {
			editor_map.remove("keyword");
			editor_map.put("list_arr", "cnt"); //판매순으로
			editor_map.put("startRow", 1); 
			editor_map.put("endRow", 10); 
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
			search_map.put("editor_list", search_editor_list);
		}else {
			search_map.put("editor_list", null);
		}
		
	   //키워드가 상품명 or 작가명 or 출판사명 - 아이템 프리뷰
		List<HashMap<String,Object>> search_item_list = new ArrayList<HashMap<String,Object>>();
		HashMap<String,Object> item_map = new HashMap<String, Object>();
		item_map.put("startRow", 1);
		item_map.put("endRow", 3);
		item_map.put("list_arr", "cnt"); 
		item_map.put("product_name", keyword);
		List<HashMap<String,Object>> item_list = service.sell_list(item_map); // 키워드 상품명으로 검색해 리스트 넣기
		for(HashMap<String,Object> item_add_map : item_list) {
			if(item_add_map.get("PRODUCT_PICTURE") != null) {
				item_add_map.put("PRODUCT_PICTURE", item_add_map.get("PRODUCT_PICTURE").toString().split(",")[0]);
			}
			item_add_map.put("editor_name", cate_service.editor_getinfo(Integer.parseInt(item_add_map.get("PRODUCT_EDITOR_NUM").toString())).getEditor_name()); //작가이름 추가
			search_item_list.add(item_add_map); 
		}
		item_map.remove("product_name");
		if(editor_list.size()>0) {
			for(Item_Editor_Vo editor_vo : editor_list) {
				item_map.put("product_editor_num", editor_vo.getEditor_num()); // 키워드 작가명으로 검색해 리스트 넣기
				item_list = service.sell_list(item_map);
				for(HashMap<String,Object> item_add_map : item_list) {
					if(item_add_map.get("PRODUCT_PICTURE") != null) {
						item_add_map.put("PRODUCT_PICTURE", item_add_map.get("PRODUCT_PICTURE").toString().split(",")[0]);
					}
					item_add_map.put("editor_name", cate_service.editor_getinfo(editor_vo.getEditor_num()).getEditor_name()); //작가이름 추가
					search_item_list.add(item_add_map);
				}
			} 
		}
		item_map.remove("product_editor_num"); 
		item_map.put("product_publish", keyword);
		item_list = service.sell_list(item_map);
		for(HashMap<String,Object> item_add_map : item_list) { // 키워드 출판사명으로 검색해 리스트 넣기
			if(item_add_map.get("PRODUCT_PICTURE") != null) {
				item_add_map.put("PRODUCT_PICTURE", item_add_map.get("PRODUCT_PICTURE").toString().split(",")[0]);
			}
			item_add_map.put("editor_name", cate_service.editor_getinfo(Integer.parseInt(item_add_map.get("PRODUCT_EDITOR_NUM").toString())).getEditor_name()); //작가이름 추가
			search_item_list.add(item_add_map);
		}
		if(search_item_list.size()>0) { 
			//넣어준 리스트 중복제거하기
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
			Collections.reverse(search_item_list); // 순서 판매순으로 다시 뒤집기
			search_map.put("item_list", search_item_list);
			
		}else { 
			search_map.put("item_list", null);
		}
		
		return search_map;
	}
	

}
