package com.heybooks.sh.controller.board;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Board_Controller {

	// �Խ��� - ��Ϻ� ����Ʈ
	@RequestMapping(value = "/admin_board", method = RequestMethod.GET)
	public String admin_board() {
		return ".admin.admin_board";
	}

	// �Խ��� - ��� �� ����Ʈ
	@RequestMapping(value = "/admin_board_list", method = RequestMethod.GET)
	public String admin_board_list(String board, Model model) {
		model.addAttribute("board", board);
		return ".admin.admin_board_list";
	}
	
	// ������ �̺�Ʈ
	@RequestMapping(value = "/event_proceed", method = RequestMethod.GET)
	public String event_proceed() {
		return ".event_news.event_proceed";
	}

	// ���� �̺�Ʈ
	@RequestMapping(value = "/event_ended", method = RequestMethod.GET)
	public String event_ended() {
		return ".event_news.event_ended";
	}

	// ���������� - 1:1����
	@RequestMapping(value = "/mypage_qna", method = RequestMethod.GET)
	public String mypage_qna() {
		return ".member.mypage_qna";
	}

	// ���������� - 1:1���� �ۼ�
	@RequestMapping(value = "/mypage_qna_write", method = RequestMethod.GET)
	public String mypage_qna_write() {
		return ".member.mypage_qna_write";
	}

	// ���������� - 1:1���� �󼼳���
	@RequestMapping(value = "/mypage_qna_detail", method = RequestMethod.GET)
	public String mypage_qna_detail() {
		return ".member.mypage_qna_detail";
	}

	// ���������� - �������
	@RequestMapping(value = "/mypage_review", method = RequestMethod.GET)
	public String mypage_review() {
		return ".member.mypage_review";
	}

}
