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

import com.heybooks.sh.service.admin.Admin_Service;
import com.heybooks.sh.service.board.Board_Service;
import com.heybooks.sh.service.member.Member_Service;
import com.heybooks.sh.vo.admin.Admin_Vo;
import com.heybooks.sh.vo.board.Counsel_Reply_Vo;
import com.heybooks.sh.vo.board.Counsel_Vo;
import com.heybooks.sh.vo.board.Event_Vo;
import com.heybooks.sh.vo.board.Notice_Vo;
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
	
	
	// �Խ��� - ��Ϻ� ����Ʈ 
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
			map.put("num", vo.getNotice_num());  
			map.put("title", vo.getNotice_title());  
			map.put("content", vo.getNotice_content());  
			map.put("date", date_txt);  
			map.put("another", vo.getNotice_hit());  
			map.put("name", admin_id);   
		}
		else if(board_id.equals("event")) {
			logger.info("ajax/get event-detail");
			Event_Vo vo = service.event_detail(board_seq);
			String admin_id = admin_service.admin_detail(vo.getAdmin_num()).getAdmin_id();
			String date_txt = sdate.format(vo.getEvent_date());
			String end_date_txt = sdate2.format(vo.getEvent_period());
			map.put("num", vo.getEvent_num());  
			map.put("title", vo.getEvent_title());  
			map.put("content", vo.getEvent_content());   
			map.put("date", date_txt);  
			map.put("period", end_date_txt);  
			map.put("thumbnail", vo.getEvent_thumbnail());  
			map.put("another", vo.getEvent_hit());  
			map.put("name", admin_id);   
		}
		return map;       
	} 
	
	// 1:1�亯��� �߰�
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
		counsel_vo.setCounsel_answer("�亯�Ϸ�");
		service.counsel_update(counsel_vo);
		Counsel_Reply_Vo reply_vo = service.counsel_reply_detail(counsel_num);
		map.put("reply_vo", reply_vo);  
		return map;
	}    
	
	// ������ ���� ����
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
	 
	
	
	
	
	
	
	
	
}
