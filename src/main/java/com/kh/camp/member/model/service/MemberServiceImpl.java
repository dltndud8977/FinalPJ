package com.kh.camp.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.member.model.dao.MemberDAO;
import com.kh.camp.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int insertMember(Member member) {
		
		return memberDAO.insertMember(member);
	}

	@Override
	public Member selectOneMember(String userId) {
		
		memberDAO.visitCount();
		
		return memberDAO.selectOneMember(userId);
	}

	@Override
	public int updateMember(Member member) {
		
		return memberDAO.updateMember(member);
	}

	@Override
	public int deleteMember(String userId) {
		
		return memberDAO.deleteMember(userId);
	}

	@Override
	public int checkIdDuplicate(String userId) {
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("uesrId", userId);
		
		return memberDAO.checkIdDuplicate(hmap);
	}
	
	@Override
	public int pwUpdateMember(Member member) {
		
		return memberDAO.pwUpdateMember(member);
	}
	
	

}
