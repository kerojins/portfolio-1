package com.heybooks.sh.interceptor.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberLoginInterceptor extends HandlerInterceptorAdapter {

	// ��Ʈ�ѷ����� ���� �����
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		// loginó���� ����ϴ� ����� ������ ��� �ִ� ��ü�� �����´�
		Object obj = session.getAttribute("member");

		if (obj == null) {
			response.sendRedirect("member_login"); // �α��� ������ ����������
			return false; // ���̻� ��Ʈ�ѷ� ��û�� ���� �ʵ��� false�� ��ȯ
		}
		return true; // true���ϸ� ��Ʈ�ѷ� uri�� ���Եȴ�.
	}

	// ��Ʈ�ѷ��� ����ǰ� ȭ���� �������� ������ ����Ǵ� �޼���
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
