package com.icia.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.member.dto.memberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	
	public int insert(memberDTO dto) {
		// mapper의 namespace를 mb로 지정
		return sql.insert("mb.insertDB" , dto);
		
	}


	public List<memberDTO> memberlist() {		
		return sql.selectList("mb.memberlist");
		
	}

	
	public memberDTO memberview(String mid) {		
		return sql.selectOne("mb.memberview" , mid);
	}


	public String memberLogin(memberDTO member) {		
		return sql.selectOne("mb.memberlogin" , member );
	}


	public memberDTO update(String loginId) {		
		return sql.selectOne("mb.memberupdate" , loginId);
	}


	public int updateProcess(memberDTO member) {		
		return sql.update("mb.updateprocess", member);
	}


	public void memberDelete(String mid) {
		sql.delete("mb.memberdelete" , mid);
		
	}


	public String idCheck(String mid) {		
		return sql.selectOne("mb.idcheck" , mid);
	}

}
