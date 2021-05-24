package com.icia.member.controller;

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
	
	@RequestMapping(value="/loginpage")
	public String memberlogin() {
		return "memberlogin";
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
	
	
}
