package com.kh.camp.admin.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.admin.model.dao.AdminDAO;
import com.kh.camp.member.model.vo.Member;

@Service
public class AdminService {

	@Autowired
	AdminDAO admindao;
	
	public List<Map<String, String>> selectMemberList(int cPage, int numPerPage) {

		return admindao.selectMemberList(cPage, numPerPage);
	}

	public int selectTotalMemberNum() {
		
		return admindao.selectTotalMemberNum();
		
	}

	public List<Map<String, String>> selectbsMemberList(int cPage, int numPerPage) {
		
		return admindao.selectbsMemberList(cPage, numPerPage);
	}

	public int selectTotalbsMemberNum() {
	
		return admindao.selectTotalbsMemberNum();
	}



	public Member selectOne(String bsNo) {
		
		return admindao.selectOne(bsNo);
	}

	public int extendContract(Member m) {
		
		return admindao.extendContract(m);
	}

	public int expire(Member m) {
		
		return admindao.expire(m);
	}

	

}
