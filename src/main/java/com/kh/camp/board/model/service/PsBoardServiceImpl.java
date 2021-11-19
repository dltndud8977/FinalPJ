package com.kh.camp.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.board.model.dao.PsBoardDao;
import com.kh.camp.board.model.vo.Attachment;
import com.kh.camp.board.model.vo.PsBoard;

@Service
public class PsBoardServiceImpl implements PsBoardService {
	
	@Autowired
	PsBoardDao psboardDAO; 
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return PsBoardDao.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBoard(PsBoard board, List<Attachment> attachList) {
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
	public PsBoard updateView(int nNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(PsBoard board, List<Attachment> attachList) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int nNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFile(int attNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
