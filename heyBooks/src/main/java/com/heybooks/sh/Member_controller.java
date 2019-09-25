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

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return ".registration.login";
	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return ".registration.join";
	}

	// 회원수정
	@RequestMapping(value = "/modification", method = RequestMethod.GET)
	public String modification() {
		return ".registration.modification";
	}

	// 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		return ".member.mypage";
	}

	// 마이페이지 - 최근 본 상품
	@RequestMapping(value = "/mypage_recent", method = RequestMethod.GET)
	public String mypage_recent() {
		return ".member.mypage_recent";
	}

	// 마이페이지 - 위시리스트
	@RequestMapping(value = "/mypage_wishlist", method = RequestMethod.GET)
	public String mypage_wishlist() {
		return ".member.mypage_wishlist";
	}

	// 마이페이지 - 알림
	@RequestMapping(value = "/mypage_notice", method = RequestMethod.GET)
	public String mypage_notice() {
		return ".member.mypage_notice";
	}

	// 마이페이지 - 신간알림
	@RequestMapping(value = "/mypage_book_notice", method = RequestMethod.GET)
	public String mypage_book_notice() {
		return ".member.mypage_book_notice";
	}

	// 마이페이지 - 주문 목록
	@RequestMapping(value = "/mypage_order", method = RequestMethod.GET)
	public String mypage_order() {
		return ".member.mypage_order";
	}

	// 마이페이지 - 주문 목록 상세
	@RequestMapping(value = "/mypage_order_detail", method = RequestMethod.GET)
	public String mypage_order_detail(Model md) {
		md.addAttribute("aside", "no");
		return ".member.mypage_order_detail";
	}

	// 마이페이지 - 마일리지
	@RequestMapping(value = "/mypage_mileage", method = RequestMethod.GET)
	public String mypage_mileage() {
		return ".member.mypage_mileage";
	}

	// 마이페이지 - 1:1문의
	@RequestMapping(value = "/mypage_qna", method = RequestMethod.GET)
	public String mypage_qna() {
		return ".member.mypage_qna";
	}

	// 마이페이지 - 1:1문의 작성
	@RequestMapping(value = "/mypage_qna_write", method = RequestMethod.GET)
	public String mypage_qna_write() {
		return ".member.mypage_qna_write";
	}

}
