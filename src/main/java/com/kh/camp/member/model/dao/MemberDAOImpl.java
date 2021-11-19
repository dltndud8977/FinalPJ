package com.kh.camp.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member member) {
		
		return sqlSession.insert("memberSQL.insertMember", member);
	}

	@Override
	public Member selectOneMember(String userId) {

		return sqlSession.selectOne("memberSQL.selectOne", userId);
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkIdDuplicate(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
