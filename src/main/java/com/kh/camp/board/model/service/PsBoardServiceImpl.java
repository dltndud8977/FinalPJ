package com.kh.camp.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.board.model.dao.PsBoardDAO;
import com.kh.camp.board.model.vo.Attachment;
import com.kh.camp.board.model.vo.PsBoard;


@Service
public class PsBoardServiceImpl implements PsBoardService {
	
	@Autowired
	PsBoardDAO psboardDAO; 
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return psboardDAO.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		// TODO Auto-generated method stub
		return psboardDAO.selectBoardTotalContents();
	}

	@Override
	public int insertBoard(PsBoard psboard, List<Attachment> attachList) {
		// TODO Auto-generated method stub
		
		int PsBoardResult = psboardDAO.insertBoard(psboard);
		// dao로 가장 최근에 추가된 번호 가져오기 (첨부파일)
		
		if (attachList.size() > 0) {
			// 첨부파일 있을 때 실행한다
			for(Attachment a : attachList) {
				int attachResult = psboardDAO.insertAttachment(a);
				if (attachResult == 0) System.out.println("첨부파일 전송 실팬");
			}
		}
		 
		return PsBoardResult;
	}

	@Override
	public PsBoard selectOneBoard(int nNo) {
		
		
		PsBoard psboard = psboardDAO.selectOneBoard(nNo);
		
	
		
		return psboard;
	}

	@Override
	public List<Attachment> selectAttachmentList(int nNo) {
		
		return psboardDAO.selectAttachmentList(nNo);
	}

	@Override
	public PsBoard updateView(int nNo) {
		// TODO Auto-generated method stub
		return psboardDAO.selectOneBoard(nNo);
	}

	@Override
	public int updateBoard(PsBoard psboard, List<Attachment> attachList) {
		int totalResult = 0;
		
		List<Attachment> originList = psboardDAO.selectAttachmentList(psboard.getNNo());
		
		totalResult = psboardDAO.updateBoard(psboard); // DAO이동
		
		
				
				return totalResult;
	}

	@Override
	public int deleteBoard(int nNo) {
		// TODO Auto-generated method stub
		return psboardDAO.deleteBoard(nNo);
	}

	@Override
	public int deleteFile(int attNo) {
		// TODO Auto-generated method stub
		return psboardDAO.deleteFile(attNo);
	}

}
