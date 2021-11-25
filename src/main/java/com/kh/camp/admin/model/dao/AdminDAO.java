package com.kh.camp.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.admin.model.vo.Visit;
import com.kh.camp.member.model.vo.Member;

@Repository
public class AdminDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1)* numPerPage, numPerPage);
		
		return sqlSession.selectList("adminSQL.memberList",null, rows);
	}
	public int selectTotalMemberNum() {
		
		return sqlSession.selectOne("adminSQL.memberNum");
	}
	public List<Map<String, String>> selectbsMemberList(int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage - 1)* numPerPage, numPerPage);
		
		return sqlSession.selectList("adminSQL.bsmemberList",null, rows);
	}
	public int selectTotalbsMemberNum() {
		
		return sqlSession.selectOne("adminSQL.bsmemberNum");
	}

	public Member selectOne(String bsNo) {
		
		return sqlSession.selectOne("adminSQL.selectOne",bsNo);
	}
	public int extendContract(Member m) {
		int result =0;
		if(m.getBsEndDate() == null) {
			// 첫 계약일 시
			result= sqlSession.update("adminSQL.extendContract",m.getBsNo());
		} else {
			// 연장할 시
			result = sqlSession.update("adminSQL.extendContract1",m.getBsNo());
		}
		
		return result;
	}
	public int expire(Member m) {
		
		return sqlSession.update("adminSQL.expire",m);
	}
	public List<Visit> visit() {
		
		return sqlSession.selectList("adminSQL.visit");
	}

}
