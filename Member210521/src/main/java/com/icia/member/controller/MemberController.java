package com.icia.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.member.dto.memberDTO;
import com.icia.member.dto.memberDTO;
import com.icia.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;
	
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/joinpage")
	public String joinpage() {
		return "memberjoin";
	}
			
	@RequestMapping(value="/memberjoin")
	public String memberjoin(@ModelAttribute memberDTO dto) {
		System.out.println(dto.toString());
		ms.insert(dto);
		return "memberlogin";
	}
	
	// 로그인 화면 출력 메소드
	@RequestMapping(value="/loginpage")
	public String memberlogin() {
		return "memberlogin";
	}
	
	// 로그인 처리 메소드
	@RequestMapping(value="/login")
	public ModelAndView memberLogin(@ModelAttribute memberDTO member) {
		// member 객체는 memberlogin.jsp 에서 입력한 mid , mpassword 값만 담겨있음.
		System.out.println("login 메소드" + member.toString());
		mav = ms.memberLogin(member);
		return mav;
	}
	
	
	@RequestMapping(value="/memberlist")
	public ModelAndView memberlist() {
		mav = ms.memberlist();
		return mav ;
	}
	
	@RequestMapping(value="/memberview")
	public ModelAndView memberview (@RequestParam("mid") String mid) {
		mav = ms.memberview(mid);
		return mav ; 
	}
	
	// 로그아웃 처리 메소드
	@RequestMapping(value="/logout")
	public String logout() {
		// 로그아웃은 세션에 저장된 내용을 지운다는 개념
		session.invalidate();
		return "home";
	}
	
	// 회원정보 수정 요청 메소드
	@RequestMapping(value="/memberupdate")
	public ModelAndView update() {
		mav = ms.update();
		
		return mav;
	}
	
	// 회원정보 수정 처리 메소드
	@RequestMapping(value="/updateprocess")
	public ModelAndView updateProcess(@ModelAttribute memberDTO member) {
		mav = ms.updateProcess(member);
		return mav;
	}
	
	// 회원삭제 처리 메소드
	@RequestMapping(value="/memberdelete")
	public ModelAndView memberDelete(@RequestParam("mid")String mid) {
		mav = ms.memberDelete(mid);
		return mav;
	}
	
	
	
	
	
}
