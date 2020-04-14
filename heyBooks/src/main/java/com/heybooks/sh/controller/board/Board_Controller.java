package com.heybooks.sh.controller.board;

import java.io.File;
import java.io.IOException;
import java.sql.Clob;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.heybooks.sh.controller.admin.Admin_controller;
import com.heybooks.sh.service.admin.Admin_Service;
import com.heybooks.sh.service.board.Board_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.service.member.Member_Service;
import com.heybooks.sh.util.PageUtil;
import com.heybooks.sh.vo.admin.Admin_Vo;
import com.heybooks.sh.vo.board.Counsel_Reply_Vo;
import com.heybooks.sh.vo.board.Counsel_Vo;
import com.heybooks.sh.vo.board.Event_Vo;
import com.heybooks.sh.vo.board.Notice_Vo;
import com.heybooks.sh.vo.board.Review_Reply_Vo;
import com.heybooks.sh.vo.board.Review_Vo;
import com.heybooks.sh.vo.member.Member_Vo;
import com.heybooks.sh.vo.member.Push_Vo;

@Controller
public class Board_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Board_Controller.class);
	@Resource
	private Board_Service service;
	@Resource
	private Member_Service member_service;
	@Resource
	private Admin_Service admin_service;
	@Resource
	private Item_Main_Service item_service;
	@Resource
	private Board_Service board_service;

	// 마이페이지 - 1:1문의 리스트
	@RequestMapping(value = "/mypage_qna", method = RequestMethod.GET)
	public String mypage_qna(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
							 @RequestParam(value = "rowCount", defaultValue = "8") int rowCount,
							 @RequestParam(value = "list_arr", defaultValue = "counsel_date desc") String list_arr, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Member_Vo member_vo = (Member_Vo) session.getAttribute("member"); // 멤버번호 얻어오기
		HashMap<String, Object> count_map = new HashMap<String, Object>();
		if (member_vo != null) {
			int members_num = member_vo.getMembers_num();
			count_map.put("members_num", members_num);
		} 
		if (pageNum < 1) pageNum = 1;
		int totalRowCount = service.counsel_count(count_map); // 전체 글 수 얻어오기
		PageUtil util = new PageUtil(pageNum, totalRowCount, rowCount, 5); // 페이징처리
		
		count_map.put("list_arr", list_arr);
		count_map.put("startRow", util.getStartRow());
		count_map.put("endRow", util.getEndRow());
  
		List<Counsel_Vo> list = service.counsel_list(count_map);
		model.addAttribute("list", list);
		model.addAttribute("rowCount", rowCount); // 보여질 아이템 갯수
		model.addAttribute("list_arr", list_arr); // 아이템 정렬 기준
		model.addAttribute("util", util);
		return ".member.mypage_qna";
	}

	// 마이페이지 - 1:1문의 상세내용
	@RequestMapping(value = "/counsel_detail", method = RequestMethod.GET)
	public String counsel_detail(int counsel_num, Model model) {
		Counsel_Vo vo = service.counsel_detail(counsel_num);
		Counsel_Reply_Vo reply_vo = service.counsel_reply_detail(counsel_num);
		String content = vo.getCounsel_content().replaceAll("\r\n", "<br>");
		if(reply_vo != null) {
			String reply_content = reply_vo.getCounsel_reply_content().replaceAll("\r\n", "<br>");
			reply_vo.setCounsel_reply_content(reply_content);
			model.addAttribute("reply_vo", reply_vo); 
		}
		vo.setCounsel_content(content);
		model.addAttribute("vo", vo); 
		
		return ".member.mypage_qna_detail";
	}

	// 마이페이지 - 1:1문의 추가
	@RequestMapping(value = "/mypage_qna_write", method = RequestMethod.GET)
	public String mypage_qna_write(String counsel_type, String counsel_title, Model model) {
		model.addAttribute("counsel_type", counsel_type);
		model.addAttribute("counsel_title", counsel_title);
		return ".member.mypage_qna_write";
	} 

	@RequestMapping(value = "/counsel_insert", method = RequestMethod.POST)
	public String counsel_insert(Counsel_Vo vo) {
		logger.info("post counsel-insert");
		vo.setCounsel_answer("답변대기");
		service.counsel_insert(vo);
		return "redirect:/mypage_qna";
	}

	// 마이페이지 - 1:1문의글 수정
	@RequestMapping(value = "/counsel_update", method = RequestMethod.GET)
	public String counsel_update(int counsel_num, Model model) {
		Counsel_Vo vo = service.counsel_detail(counsel_num);
		model.addAttribute("board_id", "counsel");
		model.addAttribute("vo", vo);
		return ".member.mypage_qna_update";
	}

	@RequestMapping(value = "/counsel_update", method = RequestMethod.POST)
	public String counsel_update(Counsel_Vo vo) {
		logger.info("post counsel-update");
		vo.setCounsel_answer("답변대기");
		logger.info(vo.toString());
		service.counsel_update(vo);
		return "redirect:/mypage_qna";
	}

	// 게시판 - 전체 목록별 리스트
	@RequestMapping(value = "/admin_board", method = RequestMethod.GET)
	public String admin_board(Model model) {
		// 1:1 상담 리스트
		HashMap<String, Object> counsel_map = new HashMap<String, Object>();
		counsel_map.put("list_arr", "counsel_date desc");
		List<Counsel_Vo> counsel_list = service.counsel_list(counsel_map);
		List<Member_Vo> member_list = new ArrayList<Member_Vo>();
		for (Counsel_Vo counsel_vo : counsel_list) {
			member_list.add(member_service.getInfo(counsel_vo.getMembers_num()));
		}
		model.addAttribute("counsel_list", counsel_list);
		model.addAttribute("member_list", member_list);

		// 공지사항
		HashMap<String, Object> notice_map = new HashMap<String, Object>();
		notice_map.put("list_arr", "notice_date desc");
		List<Notice_Vo> notice_list = service.notice_list(notice_map);
		List<Admin_Vo> notice_admin_list = new ArrayList<Admin_Vo>();
		for (Notice_Vo notice_vo : notice_list) {
			notice_admin_list.add(admin_service.admin_detail(notice_vo.getAdmin_num()));
		}

		model.addAttribute("notice_list", notice_list);
		model.addAttribute("notice_admin_list", notice_admin_list);

		// 이벤트
		HashMap<String, Object> event_map = new HashMap<String, Object>();
		event_map.put("list_arr", "event_date desc");
		List<Event_Vo> event_list = service.event_list(event_map);
		List<Admin_Vo> event_admin_list = new ArrayList<Admin_Vo>();
		for (Event_Vo event : event_list) {
			event_admin_list.add(admin_service.admin_detail(event.getAdmin_num()));
		}
		model.addAttribute("event_list", event_list);
		model.addAttribute("event_admin_list", event_admin_list);

		// 리뷰
		HashMap<String, Object> review_map = new HashMap<String, Object>();
		review_map.put("list_arr", "review_date desc");
		List<Review_Vo> review_list = service.review_list(review_map);
		List<Member_Vo> rmember_list = new ArrayList<Member_Vo>();
		for (Review_Vo review_vo : review_list) {
			rmember_list.add(member_service.getInfo(review_vo.getMembers_num()));
		}
		System.out.println(rmember_list.toString());
		model.addAttribute("review_list", review_list);
		model.addAttribute("rmember_list", rmember_list);

		return ".admin.admin_board";
	}

	// 게시판 - 목록 상세 리스트
	@RequestMapping(value = "/admin_board_list", method = RequestMethod.GET)
	public String admin_board_list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
			@RequestParam(value = "rowCount", defaultValue = "10") int rowCount, String list_arr, String keyword, String members_num,
			String board_id, String search_date, String search_end_date, String counsel_type, String counsel_answer,
			String review_grade, Model model) {
		PageUtil util = null;
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (pageNum < 1)
			pageNum = 1;
		if (search_date != null && !(search_date.equals(""))) {
			map.put("search_date", search_date.replaceAll("-", ""));
		}
		if (search_end_date != null && !(search_end_date.equals(""))) {
			map.put("search_end_date", search_end_date.replaceAll("-", ""));
		}
		if (keyword != null && !(keyword.equals(""))) { 
			map.put("keyword", keyword);
		}
		if (members_num != null && !(members_num.equals(""))) { 
			map.put("members_num", members_num);
		}
		// 1:1문의 목록 리스트
		if (board_id.equals("counsel")) {
			logger.info("get admin-counsel-list");
			if (counsel_type != null && !(counsel_type.equals(""))) {
				map.put("counsel_type", counsel_type);
			}
			if (counsel_answer != null && !(counsel_answer.equals(""))) {
				map.put("counsel_answer", counsel_answer);
			}
			int totalRowCount = service.counsel_count(map); // 전체 글 수 얻어오기
			if (pageNum < 1)
				pageNum = 1;
			util = new PageUtil(pageNum, totalRowCount, 10, 5); // 페이징처리
			if (list_arr != null && list_arr.equals("board_title")) {
				map.put("list_arr", "counsel_title");
			} else {
				map.put("list_arr", "counsel_date desc");
			}
			map.put("startRow", util.getStartRow());
			map.put("endRow", util.getEndRow());
			List<Counsel_Vo> counsel_list = service.counsel_list(map);
			List<Member_Vo> member_list = new ArrayList<Member_Vo>();
			for (Counsel_Vo counsel_vo : counsel_list) {
				member_list.add(member_service.getInfo(counsel_vo.getMembers_num()));
			}
			model.addAttribute("counsel_list", counsel_list);
			model.addAttribute("member_list", member_list);
			model.addAttribute("totalRowCount", totalRowCount);
			model.addAttribute("counsel_type", counsel_type);
			model.addAttribute("counsel_answer", counsel_answer);
		}
		// 공지사항 리스트
		else if (board_id.equals("notice")) {
			logger.info("get admin-notice-list");
			int totalRowCount = service.notice_count(map); // 전체 글 수 얻어오기
			if (pageNum < 1)
				pageNum = 1;
			util = new PageUtil(pageNum, totalRowCount, 10, 5); // 페이징처리
			if (list_arr != null && list_arr.equals("board_title")) {
				map.put("list_arr", "notice_title");
			} else {
				map.put("list_arr", "notice_date desc");
			}
			map.put("startRow", util.getStartRow());
			map.put("endRow", util.getEndRow());
			List<Notice_Vo> notice_list = service.notice_list(map);
			List<Admin_Vo> admin_list = new ArrayList<Admin_Vo>();
			for (Notice_Vo notice_vo : notice_list) {
				admin_list.add(admin_service.admin_detail(notice_vo.getAdmin_num()));
			}
			model.addAttribute("notice_list", notice_list);
			model.addAttribute("admin_list", admin_list);
			model.addAttribute("totalRowCount", totalRowCount);
		}
		// 이벤트 리스트
		else if (board_id.equals("event")) {
			logger.info("get admin-event-list");
			int totalRowCount = service.event_count(map); // 전체 글 수 얻어오기
			if (pageNum < 1)
				pageNum = 1;
			util = new PageUtil(pageNum, totalRowCount, 10, 5); // 페이징처리
			if (list_arr != null && list_arr.equals("board_title")) {
				map.put("list_arr", "event_title");
			} else {
				map.put("list_arr", "event_date desc");
			}
			map.put("startRow", util.getStartRow());
			map.put("endRow", util.getEndRow());
			List<Event_Vo> event_list = service.event_list(map);
			List<Admin_Vo> admin_list = new ArrayList<Admin_Vo>();
			for (Event_Vo event_vo : event_list) {
				admin_list.add(admin_service.admin_detail(event_vo.getAdmin_num()));
				String period = event_vo.getEvent_period();
				if(period != null) {
					period = period.replace("-", ".").replaceAll(",", " ~ ");
					event_vo.setEvent_period(period);
				} 
			}
			model.addAttribute("event_list", event_list);
			model.addAttribute("admin_list", admin_list);
			model.addAttribute("totalRowCount", totalRowCount);
		}
		// 리뷰
		else if (board_id.equals("review")) {
			logger.info("get admin-review-list");
			if (review_grade != null && !(review_grade.equals(""))) {
				map.put("review_grade", Integer.parseInt(review_grade));
			}
			int totalRowCount = service.review_count(map); // 전체 글 수 얻어오기
			if (pageNum < 1)
				pageNum = 1;
			util = new PageUtil(pageNum, totalRowCount, 10, 5); // 페이징처리
			if (list_arr != null && list_arr.equals("board_title")) {
				map.put("list_arr", "review_content");
			} else {
				map.put("list_arr", "review_date desc");
			}
			map.put("startRow", util.getStartRow());
			map.put("endRow", util.getEndRow());
			List<Review_Vo> review_list = service.review_list(map);
			List<Member_Vo> member_list = new ArrayList<Member_Vo>();
			for (Review_Vo review_vo : review_list) {
				member_list.add(member_service.getInfo(review_vo.getMembers_num()));
			}
			model.addAttribute("review_list", review_list);
			model.addAttribute("member_list", member_list);
			model.addAttribute("totalRowCount", totalRowCount);
		}

		model.addAttribute("search_date", search_date);
		model.addAttribute("search_end_date", search_end_date);
		model.addAttribute("keyword", keyword);

		model.addAttribute("board_id", board_id); // 게시판 유형
		model.addAttribute("list_arr", list_arr); // 아이템 정렬 기준
		model.addAttribute("util", util); // 페이징 정보
		return ".admin.admin_board_list";
	}

	// 게시판 글 추가
	@RequestMapping(value = "/board_insert", method = RequestMethod.POST)
	public String board_insert(RedirectAttributes redirect, String board_id, MultipartHttpServletRequest request, String board_push, Model model) {
		logger.info("post board-insert");
		HttpSession session = request.getSession(); // 관리자 번호 얻기
		Admin_Vo admin_vo = (Admin_Vo) session.getAttribute("admin"); 
		int admin_num = admin_vo.getAdmin_num();

		String title = request.getParameter(board_id + "_title"); // 파라미터 받기
		String content = request.getParameter(board_id + "_content");
		
		// 공지사항 추가
		if (board_id.equals("notice")) {
			String offi = request.getParameter(board_id + "_official");
			String offi_detail = request.getParameter(board_id + "_official_detail");
			String[] offi_date = request.getParameterValues(board_id + "_official_date");
			int official = 0;
			int official_detail = 0;
			String official_date = "";
			if(offi != null) {
				official = Integer.parseInt(offi);
			}
			if(offi_detail != null) {
				official_detail = Integer.parseInt(offi_detail);
			} 
			if(offi_date !=null) {
				official_date = offi_date[0]+","+offi_date[1];
			}
			logger.info("post notice-insert");
			service.notice_insert(new Notice_Vo(0, admin_num, title, content, official, official_detail, official_date, 0, null));
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", 1);
			map.put("endRow", 2);
			map.put("list_arr", "notice_date desc");
			int push_ref = service.notice_list(map).get(0).getNotice_num();
			if(board_push != null) {
				member_service.push_insert(new Push_Vo(0, push_ref, admin_num , "공지", title, null));
			} 
		}   
		// 이벤트 추가
		else if (board_id.equals("event")) {
			logger.info("post event-insert");
			String[] p_date = request.getParameterValues(board_id + "_period"); // 이벤트기간 date 변환
			String to_date = p_date[0]+","+p_date[1];
			MultipartFile file = request.getFile("event_file"); // 이벤트 썸네일 생성
			String sav_file_name = "";
			if (file != null) {
				String ROOT_PATH = request.getSession().getServletContext().getRealPath("/resources/upload/editor/");
				String org_file_name = file.getOriginalFilename();
				long file_size = file.getSize();
				sav_file_name = "tumbNail_" + System.currentTimeMillis() + org_file_name;
				String sav_file = ROOT_PATH + sav_file_name;
				System.out.println(sav_file_name);
				try {
					file.transferTo(new File(sav_file)); // 파일 생성
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			service.event_insert(new Event_Vo(0, admin_num, title, content, to_date, sav_file_name, 0, null));
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", 1);
			map.put("endRow", 2);
			map.put("list_arr", "event_date desc");
			int push_ref = service.event_list(map).get(0).getEvent_num();
			if(board_push !=null) {
				member_service.push_insert(new Push_Vo(0, push_ref,admin_num, "이벤트", title, null));
			} 
		}     
		redirect.addAttribute("board_id", board_id);
		return "redirect:/admin_board_list";
	}

	// 게시판 글 수정
	@RequestMapping(value = "/board_update", method = RequestMethod.POST)
	public String board_update(MultipartHttpServletRequest request, RedirectAttributes redirect, String board_id, String admin_board, String board_push,
			Model model) {
		logger.info("post board-update");
		int num = Integer.parseInt(request.getParameter(board_id + "_num"));
		String title = request.getParameter(board_id + "_title");
		String content = request.getParameter(board_id + "_content");
		HttpSession session = request.getSession();
		Admin_Vo admin_vo = (Admin_Vo) session.getAttribute("admin");
		int admin_num = admin_vo.getAdmin_num();
		if (board_id.equals("notice")) {
			logger.info("post notice-update"); 
			String offi = request.getParameter(board_id + "_official");
			String offi_detail = request.getParameter(board_id + "_official_detail");
			String[] offi_date = request.getParameterValues(board_id + "_official_date");
			int official = 0;
			int official_detail = 0;
			String official_date = "";
			if(offi != null) {
				official = Integer.parseInt(offi);
			}
			if(offi_detail != null) {
				official_detail = Integer.parseInt(offi_detail);
			} 
			if(offi_date !=null) {
				official_date = offi_date[0]+","+offi_date[1];
			}
			int hit = service.notice_detail(num).getNotice_hit();
			service.notice_update(new Notice_Vo(num, admin_num, title, content, official, official_detail, official_date, hit, null));
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", 1);
			map.put("endRow", 2);
			map.put("list_arr", "notice_date desc");
			int push_ref = service.notice_list(map).get(0).getNotice_num();
			if(board_push != null) {
				member_service.push_insert(new Push_Vo(0, push_ref, admin_num , "공지", title, null));
			} 
		} else if (board_id.equals("event")) {
			logger.info("post event-update");
			String thumb_name = request.getParameter("thumb_name");
			String[] p_date = request.getParameterValues(board_id + "_period"); // 이벤트기간 date 변환
			String to_date = p_date[0]+","+p_date[1];
			MultipartFile file = request.getFile("event_file"); // 이벤트 썸네일 생성
			long file_size = file.getSize();
			String sav_file_name = "";
			if (file_size > 0) {
				String ROOT_PATH = request.getSession().getServletContext().getRealPath("/resources/upload/editor/");
				String org_file_name = file.getOriginalFilename();

				sav_file_name = "tumbNail_" + System.currentTimeMillis() + org_file_name;
				String sav_file = ROOT_PATH + sav_file_name;
				if (service.event_detail(num).getEvent_thumbnail() != null) { // 기존 이벤트 썸네일 존재할 경우 삭제
					File del_file = new File(ROOT_PATH + service.event_detail(num).getEvent_thumbnail());
					del_file.delete();
				}
				try {
					file.transferTo(new File(sav_file)); // 파일 생성
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else if (file_size == 0 && thumb_name != null) {
				sav_file_name = thumb_name;
			}
			int hit = service.event_detail(num).getEvent_hit(); 
			System.out.println(sav_file_name);
			service.event_update(new Event_Vo(num, admin_num, title, content, to_date, sav_file_name, hit, null));
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("startRow", 1);
			map.put("endRow", 2);
			map.put("list_arr", "event_date desc");
			int push_ref = service.event_list(map).get(0).getEvent_num();
			if(board_push !=null) {
				member_service.push_insert(new Push_Vo(0, push_ref,admin_num, "이벤트", title, null));
			} 
		}
		if(admin_board != null) {
			if(admin_board.equals("admin_main")) {
				return "redirect:/admin_main";
			}else if(admin_board.equals("board_main")) {
				return "redirect:/admin_board";
			}
		}
		redirect.addAttribute("board_id", board_id);
		return "redirect:/admin_board_list";
		
	}

	// 게시글 삭제
	@RequestMapping(value = "/board_delete", method = RequestMethod.GET)
	public String counsel_delete(String[] select_ck_num, String board_seq, String board_id, String board,
			RedirectAttributes redirect, HttpServletRequest request) {
		
		if (board_id.equals("counsel")) {
			logger.info("get counsel-delete");
			if (select_ck_num != null) {
				for (String sel_num : select_ck_num) {
					service.counsel_reply_delete(Integer.parseInt(sel_num));
					service.counsel_delete(Integer.parseInt(sel_num));
				}
			}
			if (board_seq != null) {
				int boards_seq = Integer.parseInt(board_seq);
				service.counsel_reply_delete(boards_seq);
				service.counsel_delete(boards_seq);
			}
		} else if (board_id.equals("notice")) {
			logger.info("get notice-delete");
			HashMap<String, Object> push_map = new HashMap<String, Object>();
			if (select_ck_num != null) {
				for (String sel_num : select_ck_num) {
					push_map.put("push_ref", Integer.parseInt(sel_num));
					service.notice_delete(Integer.parseInt(sel_num));
					member_service.push_delete(push_map);
				}
			} 
			if (board_seq != null) {
				int boards_seq = Integer.parseInt(board_seq);
				push_map.put("push_ref", boards_seq); 
				service.notice_delete(boards_seq);
				member_service.push_delete(push_map);
			}
		} else if (board_id.equals("event")) {
			logger.info("get event-delete");
			String ROOT_PATH = request.getSession().getServletContext().getRealPath("/resources/upload/editor/");
			HashMap<String, Object> push_map = new HashMap<String, Object>();
			if (select_ck_num != null) {
				for (String sel_num : select_ck_num) {
					if (service.event_detail(Integer.parseInt(sel_num)).getEvent_thumbnail() != null) { // 기존 이벤트 썸네일
						File del_file = new File(
								ROOT_PATH + service.event_detail(Integer.parseInt(sel_num)).getEvent_thumbnail());
						del_file.delete();
					}
					service.event_delete(Integer.parseInt(sel_num));
					push_map.put("push_ref", Integer.parseInt(sel_num));
					member_service.push_delete(push_map);
				}
			}
			if (board_seq != null) {
				int boards_seq = Integer.parseInt(board_seq);
				push_map.put("push_ref", boards_seq);
				if (service.event_detail(boards_seq).getEvent_thumbnail() != null) { // 기존 이벤트 썸네일 존재할 경우 삭제
					File del_file = new File(ROOT_PATH + service.event_detail(boards_seq).getEvent_thumbnail());
					del_file.delete();
				} 
				service.event_delete(boards_seq);
				member_service.push_delete(push_map);
			} 
		} else if (board_id.equals("review")) {
			logger.info("get review-delete");
			HashMap<String, Object> map = new HashMap<String, Object>();
			if (select_ck_num != null) {
				for (String sel_num : select_ck_num) {
					Review_Vo vo = service.review_detail(Integer.parseInt(sel_num));
					HashMap<String, Object> update_map = new HashMap<String, Object>();
					map.put("product_num", vo.getProduct_num());
					map.put("review_num", Integer.parseInt(sel_num));
					service.review_reply_delete(map);
					service.review_delete(Integer.parseInt(sel_num));
					item_service.item_grade_update(update_map); 
				}
			}
			if(board_seq != null) {
				Review_Vo vo = service.review_detail(Integer.parseInt(board_seq));
				HashMap<String, Object> update_map = new HashMap<String, Object>();
				map.put("product_num", vo.getProduct_num());
				int boards_seq = Integer.parseInt(board_seq);
				map.put("review_num", boards_seq);
				service.review_reply_delete(map);
				service.review_delete(boards_seq);
				item_service.item_grade_update(update_map); 
			}
			if (board.equals("admin_board") && board != null) {
				return "redirect:/admin_board";
			}
		}
		redirect.addAttribute("board_id", board_id);
		return "redirect:/admin_board_list";
	}

	// 리뷰 추가
	@RequestMapping(value = "/review_insert", method = RequestMethod.POST)
	public String review_insert(Review_Vo vo, Model model, RedirectAttributes redirect) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("product_num", vo.getProduct_num());
		if (vo.getReview_spoiler() == null) { 
			vo.setReview_spoiler("없음");
		}
		service.review_insert(vo);
		item_service.item_grade_update(map); 
		System.out.println("ok");
		redirect.addAttribute("product_num", vo.getProduct_num());
		return "redirect:/book_detail";
	} 

	// 리뷰 삭제
	@RequestMapping(value = "/review_delete", method = RequestMethod.GET)
	public String review_delete(int product_num, int review_num, String update_from, Model model, RedirectAttributes redirect) {
		HashMap<String, Object> reply_map = new HashMap<String, Object>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("product_num", product_num);
		reply_map.put("review_num", review_num);
		service.review_reply_delete(reply_map);
		service.review_delete(review_num);
		item_service.item_grade_update(map); 
		redirect.addAttribute("product_num", product_num);
		if(update_from != null) {
			return "redirect:/mypage_review";
		} 
		return "redirect:/book_detail";
	}

	// 리뷰 수정
	@RequestMapping(value = "/review_update", method = RequestMethod.POST)
	public String review_update(Review_Vo vo, String update_from, Model model, RedirectAttributes redirect) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("product_num", vo.getProduct_num());
		if (vo.getReview_spoiler() == null) {
			vo.setReview_spoiler("없음");
		} 
		System.out.println(vo.toString());
		service.review_update(vo);
		item_service.item_grade_update(map); 
		redirect.addAttribute("product_num", vo.getProduct_num());
		if(update_from != null) {
			return "redirect:/mypage_review";
		} 
		return "redirect:/book_detail";
	}

	// 진행중 이벤트
	@RequestMapping(value = "/event_proceed", method = RequestMethod.GET)
	public String event_proceed(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
								@RequestParam(value = "rowCount", defaultValue = "10") int rowCount, String list_arr, Model model) {
		logger.info("get event-proceed");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = service.event_count(map); // 전체 글 수 얻어오기
		if (pageNum < 1)
			pageNum = 1;
		PageUtil util = new PageUtil(pageNum, totalRowCount, 10, 5); // 페이징처리
		if (list_arr != null && list_arr.equals("board_title")) {
			map.put("list_arr", "event_title");
		} else {
			map.put("list_arr", "event_date desc");
		}
		map.put("event_now","now"); 
		map.put("startRow", util.getStartRow());
		map.put("endRow", util.getEndRow());
		List<Event_Vo> event_list = service.event_list(map);  
		for(Event_Vo vo : event_list) {
			String period = vo.getEvent_period();
			if(period != null) {
				period = period.replace("-", ".").replaceAll(",", " ~ ");
				vo.setEvent_period(period);
			}
		}
		model.addAttribute("event_list", event_list);
		model.addAttribute("util", util);
		return ".event_news.event_proceed";
	}

	// 지난 이벤트
	@RequestMapping(value = "/event_ended", method = RequestMethod.GET)
	public String event_ended(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
							  @RequestParam(value = "rowCount", defaultValue = "10") int rowCount, String list_arr, Model model) {
		logger.info("get event-ended");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = service.event_count(map); // 전체 글 수 얻어오기
		if (pageNum < 1)
			pageNum = 1;
		PageUtil util = new PageUtil(pageNum, totalRowCount, 10, 5); // 페이징처리
		if (list_arr != null && list_arr.equals("board_title")) {
			map.put("list_arr", "event_title");
		} else {
			map.put("list_arr", "event_date desc");
		} 
		map.put("event_end","end");  
		map.put("startRow", util.getStartRow());
		map.put("endRow", util.getEndRow()); 
		List<Event_Vo> event_list = service.event_list(map);  
		for(Event_Vo vo : event_list) {
			String period = vo.getEvent_period();
			if(period != null) {
				period = period.replace("-", ".").replaceAll(",", " ~ ");
				vo.setEvent_period(period);
			} 
		}
		model.addAttribute("event_list", event_list);
		model.addAttribute("util", util);
		return ".event_news.event_ended";
	}
	// 이벤트 상세페이지
	@RequestMapping(value = "/event_detail", method = RequestMethod.GET)
	public String event_detail(int event_num, Model model) {
		Event_Vo vo = board_service.event_detail(event_num);
		model.addAttribute("vo",vo);
		return ".event_news.event_detail";
	}
	
	// 공지사항
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String notice(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
						@RequestParam(value = "rowCount", defaultValue = "10") int rowCount, 
						@RequestParam(value = "list_arr", defaultValue = "notice_date desc")String list_arr, String board_keyword, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list_arr", list_arr);
		map.put("official", "official");
		List<Notice_Vo> official_list = service.notice_list(map);
		map.remove("official");
		map.put("content", "content");
		if (board_keyword != null && !(board_keyword.equals(""))) { 
			map.put("board_keyword", board_keyword);  
		}
		System.out.println(map.toString()); 
		int totalRowCount = service.notice_count(map);
		if (pageNum < 1)
			pageNum = 1; 
		PageUtil util = new PageUtil(pageNum, totalRowCount, 10, 5); // 페이징처리
		map.put("startRow", util.getStartRow()); 
		map.put("endRow", util.getEndRow());
		List<Notice_Vo> content_list = service.notice_list(map);
		System.out.println(content_list.toString());
		model.addAttribute("official_list", official_list);
		model.addAttribute("content_list", content_list); 
		model.addAttribute("util", util); 
		model.addAttribute("notice_keyword", board_keyword );  
		return ".event_news.notice";
	} 
	// 공지사항 상세페이지
	@RequestMapping(value = "/notice_detail", method = RequestMethod.GET)
	public String notice_detail(int notice_num, String official, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content", "content"); 
		map.put("notice_num", notice_num); 
		List<HashMap<String, Object>> page_list = service.notice_page(map);
		if(page_list.size()>0 && official == null) {
			Object pre_num = page_list.get(0).get("PRE_NUM");
			Object next_num = page_list.get(0).get("NEXT_NUM");
			int prev = 0;
			int next= 0;
			if(pre_num != null) { 
				prev = Integer.parseInt(pre_num.toString());
				model.addAttribute("prev",prev); 
			}
			if(next_num != null) {
				next = Integer.parseInt(next_num.toString()); 
				model.addAttribute("next", next); 
			}
		}
		Notice_Vo vo = board_service.notice_detail(notice_num);
		model.addAttribute("vo",vo); 
		return ".event_news.notice_detail";
	} 
	
	//메인페이지에서 관심 분야 변경시
	@RequestMapping(value = "/favorite_update", method = RequestMethod.POST)
	public String favorite_update(HttpServletRequest request, RedirectAttributes redirect, String members_favorite, String scroll_top, Model model) {
		HttpSession session = request.getSession(); // 관리자 번호 얻기
		Member_Vo member_vo = (Member_Vo) session.getAttribute("member"); 
		member_vo.setMembers_favorite(members_favorite);
		member_service.update(member_vo);
		redirect.addAttribute("scroll_top", scroll_top);
		return "redirect:/"; 
	}
	
	
}
