package com.icia.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.member.dao.MemberDAO;

import com.icia.member.dto.memberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO mdao;
	
	private ModelAndView mav;
	
	public void insert(memberDTO dto) {		
		mav = new ModelAndView();
		// insert 호출 결과를 받아서 insert 성공 여부에 따라 처리		
		int insertResult = mdao.insert(dto);
		if(insertResult > 0) {
			// insertResult가 0보다 크다는 것은 insert를 성공했다는 의미기 때문에 회원가입이 완료된것으로 판단.
			mav.setViewName("memberlogin");
		}else {
			// insertResult 가 0이라는 의미는 insert가 실패했다는 의미
			mav.setViewName("joinfail");
		}
	}

	public ModelAndView memberlist() {
		mav = new ModelAndView();
		List<memberDTO> dbList = mdao.memberlist();
		
		// dbList에 DB 조회 결과를 담아서 memberlist.jsp로 이동
		mav.addObject("dbList" , dbList);
		mav.setViewName("memberlist");
		return mav;
	}

	

	public ModelAndView memberview(String mid) {
		mav = new ModelAndView();
		
		// 한명 회원에 대한 정보만 필요하기 때문에 DTO 타입 사용하면된다.
		memberDTO member = mdao.memberview(mid);
		
		// DB 조회 결과를 member에 받았고 
		// member를 담아서 memberservice.jsp로 가야함.
		mav.addObject("result", member);
		mav.setViewName("memberview");
		
		
		return mav;
	}

	
	
	
	
	
}
