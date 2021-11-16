package com.kh.camp.board.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.board.model.vo.Attachment;
import com.kh.camp.board.model.vo.PsBoard;

@Repository
public class PsBoardDaoImpl implements PsBoardDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return PsBoardDao.selectBoardList(cPage,numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBoard(PsBoard psboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAttachment(Attachment a) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public PsBoard selectOneBoard(int nNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Attachment> selectAttachmentList(int nNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateReadCount(int nNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(PsBoard psboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAttachment(Attachment a) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int nNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAttachment(int nNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFile(int attNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
