package com.heybooks.sh;

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
public class Member_controller {

	// �α���
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return ".registration.login";
	}

	// ȸ������
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return ".registration.join";
	}

	// ȸ������
	@RequestMapping(value = "/modification", method = RequestMethod.GET)
	public String modification() {
		return ".registration.modification";
	}

	// ����������
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		return ".member.mypage";
	}

	// ���������� - �ֱ� �� ��ǰ
	@RequestMapping(value = "/mypage_recent", method = RequestMethod.GET)
	public String mypage_recent() {
		return ".member.mypage_recent";
	}

	// ���������� - ���ø���Ʈ
	@RequestMapping(value = "/mypage_wishlist", method = RequestMethod.GET)
	public String mypage_wishlist() {
		return ".member.mypage_wishlist";
	}

	// ���������� - �˸�
	@RequestMapping(value = "/mypage_notice", method = RequestMethod.GET)
	public String mypage_notice() {
		return ".member.mypage_notice";
	}

	// ���������� - �Ű��˸�
	@RequestMapping(value = "/mypage_book_notice", method = RequestMethod.GET)
	public String mypage_book_notice() {
		return ".member.mypage_book_notice";
	}

	// ���������� - �ֹ� ���
	@RequestMapping(value = "/mypage_order", method = RequestMethod.GET)
	public String mypage_order() {
		return ".member.mypage_order";
	}

	// ���������� - �ֹ� ��� ��
	@RequestMapping(value = "/mypage_order_detail", method = RequestMethod.GET)
	public String mypage_order_detail(Model md) {
		md.addAttribute("aside", "no");
		return ".member.mypage_order_detail";
	}

	// ���������� - ���ϸ���
	@RequestMapping(value = "/mypage_mileage", method = RequestMethod.GET)
	public String mypage_mileage() {
		return ".member.mypage_mileage";
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

}
