package com.heybooks.sh.controller.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.heybooks.sh.service.admin.Admin_Service;
import com.heybooks.sh.service.board.Board_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.service.member.Member_Service;
import com.heybooks.sh.vo.admin.Admin_Vo;
import com.heybooks.sh.vo.board.Counsel_Reply_Vo;
import com.heybooks.sh.vo.board.Counsel_Vo;
import com.heybooks.sh.vo.board.Event_Vo;
import com.heybooks.sh.vo.board.Notice_Vo;
import com.heybooks.sh.vo.board.Review_Reply_Vo;
import com.heybooks.sh.vo.board.Review_Vo;
import com.heybooks.sh.vo.item.Item_Vo;
import com.heybooks.sh.vo.member.Member_Vo;

@Controller
public class Board_Ajax_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Board_Ajax_Controller.class);
	@Resource
	private Board_Service service;
	@Resource
	private	Member_Service member_service; 
	@Resource
	private	Admin_Service admin_service; 
	@Resource
	private Item_Main_Service item_service;
	
	
	// 게시판 - 목록별 리스트 
	@RequestMapping("/ajax/board_detail")  
	@ResponseBody   
	public HashMap<String,Object> counsel_getinfo(int board_seq, String board_id, Model model) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		SimpleDateFormat sdate2 = new SimpleDateFormat("yyyy-MM-dd");
		if(board_id.equals("counsel")) {
			logger.info("ajax/get counsel-detail");
			Counsel_Vo vo = service.counsel_detail(board_seq); 
			Counsel_Reply_Vo reply_vo = service.counsel_reply_detail(board_seq);
			String member_id = member_service.getInfo(vo.getMembers_num()).getMembers_id();
			String date_txt = sdate.format(vo.getCounsel_date());
			map.put("num", vo.getCounsel_num());  
			map.put("title", vo.getCounsel_title());  
			map.put("content", vo.getCounsel_content());  
			map.put("date", date_txt );  
			map.put("another", vo.getCounsel_answer());  
			map.put("reply_vo", reply_vo);   
			map.put("name", member_id);
		} 
		else if(board_id.equals("notice")) {
			logger.info("ajax/get notice-detail");
			Notice_Vo vo= service.notice_detail(board_seq);
			String admin_id = admin_service.admin_detail(vo.getAdmin_num()).getAdmin_id();
			String date_txt = sdate.format(vo.getNotice_date());
			String[] period_txt = {};
			if(vo.getNotice_official_date() != null) {
				period_txt = vo.getNotice_official_date().split(",");
			} 
			int official = vo.getNotice_official();
			int official_d = vo.getNotice_official_detail();
			map.put("num", vo.getNotice_num());  
			map.put("title", vo.getNotice_title());  
			map.put("content", vo.getNotice_content().replaceAll("\r\n","<br>"));  
			map.put("date", date_txt);  
			map.put("another", vo.getNotice_hit());   
			map.put("name", admin_id);   
			map.put("official", official);   
			map.put("official_d", official_d);   
			map.put("period", period_txt);   
		} 
		else if(board_id.equals("event")) {
			logger.info("ajax/get event-detail");
			Event_Vo vo = service.event_detail(board_seq);
			String admin_id = admin_service.admin_detail(vo.getAdmin_num()).getAdmin_id();
			String date_txt = sdate.format(vo.getEvent_date());
			String[] period_txt = {};
			if(vo.getEvent_period() != null) {
				period_txt = vo.getEvent_period().split(",");
			} 
			map.put("num", vo.getEvent_num());  
			map.put("title", vo.getEvent_title());  
			map.put("content", vo.getEvent_content());   
			map.put("date", date_txt);  
			map.put("period", period_txt);  
			map.put("thumbnail", vo.getEvent_thumbnail());  
			map.put("another", vo.getEvent_hit());  
			map.put("name", admin_id);   
		}
		else if(board_id.equals("review")) {
			logger.info("ajax/get review-detail");
			Review_Vo vo = service.review_detail(board_seq);
			String member_id = member_service.getInfo(vo.getMembers_num()).getMembers_id();
			String item_name = item_service.item_getinfo(vo.getProduct_num()).getProduct_name();
			String date_txt = sdate.format(vo.getReview_date());
			map.put("item_name", item_name);
			map.put("num", vo.getReview_num());  
			map.put("content", vo.getReview_content());   
			map.put("grade", vo.getReview_grade());  
			map.put("date", date_txt);  
			map.put("another", vo.getReview_report());  
			map.put("name", member_id);   
		}
		return map;       
	}  
	
	// 1:1답변등록 추가
	@RequestMapping("/counsel_reply_insert")   
	@ResponseBody 
	public HashMap<String,Object> counsel_reply_insert(int counsel_num, String counsel_reply_content, HttpServletRequest request ) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		HttpSession session = request.getSession();
		Admin_Vo admin_vo = (Admin_Vo)session.getAttribute("admin");
		counsel_reply_content.replaceAll("<br>","\r\n");
		System.out.println(new Counsel_Reply_Vo(0, counsel_num, admin_vo.getAdmin_num(), counsel_reply_content, null).toString());
		service.counsel_reply_insert(new Counsel_Reply_Vo(0, counsel_num, admin_vo.getAdmin_num(), counsel_reply_content, null));
		Counsel_Vo counsel_vo = service.counsel_detail(counsel_num);
		counsel_vo.setCounsel_answer("답변완료");
		service.counsel_update(counsel_vo);
		Counsel_Reply_Vo reply_vo = service.counsel_reply_detail(counsel_num);
		map.put("reply_vo", reply_vo);  
		return map;
	}    
	
	// 에디터 파일 전송
	@RequestMapping("/editor_img_insert")
	@ResponseBody
	public String editor_img_insert(MultipartFile file, HttpServletRequest request) {
		logger.info("ajax/post editor-image");
		String ROOT_PATH = request.getSession().getServletContext().getRealPath("/resources/upload/editor/");
		String org_file_name = file.getOriginalFilename();
		long file_size = file.getSize();
		String sav_file_name = System.currentTimeMillis() + org_file_name;
		String sav_file = ROOT_PATH + sav_file_name;
		logger.info(sav_file);
		try {
			file.transferTo(new File(sav_file));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return "/resources/upload/editor/" + sav_file_name;
	}  
	
	
	// 리뷰 댓글 리스트 불러오기
	@RequestMapping("/review_reply_list")
	@ResponseBody
	public HashMap<String, Object> review_reply_list(int review_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("review_num", review_num);
		map.put("list_arr", "review_reply_date desc");
		List<Review_Reply_Vo> review_reply_list = service.review_reply_list(map);
		SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
		ArrayList<String> id_arr= new ArrayList<String>();
		ArrayList<String> date_txt = new ArrayList<String>();
		for(Review_Reply_Vo vo : review_reply_list) {
			id_arr.add(member_service.getInfo(vo.getMembers_num()).getMembers_id());
			date_txt.add(sdate.format(vo.getReview_reply_date()));
		}
		System.out.println(review_reply_list.toString());
		map.put("list", review_reply_list);
		map.put("id_arr", id_arr);
		map.put("date_txt", date_txt);
		return map;
	}  
		 
	// 리뷰 추가
	@RequestMapping(value ="/review_reply_insert")
	@ResponseBody 
	public HashMap<String, Object> review_reply_insert(Review_Reply_Vo vo, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member_Vo member_vo = (Member_Vo)session.getAttribute("member");
		logger.info(vo.toString());
		vo.setMembers_num(member_vo.getMembers_num());
		vo.setReview_reply_content(vo.getReview_reply_content().replaceAll("<br>","\r\n")); // 줄바꿈 처리
		logger.info(vo.toString());
		service.review_reply_insert(vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
		map.put("review_num", vo.getReview_num());
		map.put("list_arr", "review_reply_date asc");
		List<Review_Reply_Vo> review_reply_list = service.review_reply_list(map);
		ArrayList<String> id_arr= new ArrayList<String>();
		ArrayList<String> date_txt = new ArrayList<String>();
		 
		for(Review_Reply_Vo rp_vo : review_reply_list) {
			id_arr.add(member_service.getInfo(rp_vo.getMembers_num()).getMembers_id());
			date_txt.add(sdate.format(rp_vo.getReview_reply_date()));
		}  
		System.out.println(review_reply_list.toString());
		map.put("list", review_reply_list);
		map.put("id_arr", id_arr);
		map.put("date_txt", date_txt);
		return map;
		
	}  
	
	// 리뷰 삭제
	@RequestMapping(value ="/review_reply_delete")
	@ResponseBody 
	public HashMap<String, Object> review_reply_delete(int reply_num, int review_num, Model model, HttpServletRequest request) {
		HashMap<String, Object> del_map = new HashMap<String, Object>();
		del_map.put("review_reply_num", reply_num); 
		service.review_reply_delete(del_map);
		HashMap<String, Object> map = new HashMap<String, Object>();
		SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
		map.put("review_num", review_num);
		map.put("list_arr", "review_reply_date asc"); 
		List<Review_Reply_Vo> review_reply_list = service.review_reply_list(map);
		ArrayList<String> id_arr= new ArrayList<String>();
		ArrayList<String> date_txt = new ArrayList<String>();
		 
		for(Review_Reply_Vo rp_vo : review_reply_list) {
			id_arr.add(member_service.getInfo(rp_vo.getMembers_num()).getMembers_id());
			date_txt.add(sdate.format(rp_vo.getReview_reply_date()));
		}  
		System.out.println(review_reply_list.toString());
		map.put("list", review_reply_list);
		map.put("id_arr", id_arr);
		map.put("date_txt", date_txt);
			return map;
			
	}  
  
	// 리뷰리스트
	@RequestMapping("/ajax/review_list")  
	@ResponseBody    
	public HashMap<String,Object> review_list(int cnt, int product_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		SimpleDateFormat sdate = new SimpleDateFormat("yyyy-MM-dd");
		ArrayList<String> date_txt = new ArrayList<String>();
		review_map.put("list_arr", "review_date desc");
		review_map.put("product_num", product_num);
		review_map.put("startRow", cnt+1);
		review_map.put("endRow", cnt+10); 
		List<Review_Vo> review_list = service.review_list(review_map);
		System.out.println(review_list.toString());
		List<Member_Vo> member_list = new ArrayList<Member_Vo>();
		for(Review_Vo vo : review_list) {
			member_list.add(member_service.getInfo(vo.getMembers_num()));
			date_txt.add(sdate.format(vo.getReview_date()));
		} 
		map.put("date_txt", date_txt);
		map.put("review_list", review_list);
		map.put("member_list", member_list);
		
		return map;
	}

	
	
	
	
	
	
}
