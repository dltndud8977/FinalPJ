package com.kh.camp.qnaboard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.camp.board.model.vo.Attachment;
import com.kh.camp.exception.BoardException;
import com.kh.camp.qnaboard.model.dao.qnaBoardDAO;
import com.kh.camp.qnaboard.model.vo.qnaBoard;

@Service
public class qnaBoardServiceImpl implements qnaBoardService {

	@Autowired
	qnaBoardDAO qnaboardDAO;
	
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return qnaboardDAO.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		// TODO Auto-generated method stub
		return qnaboardDAO.selectBoardTotalContents();
	}

	@Override
	public int insertBoard(qnaBoard qnaboard, List<Attachment> attachList) {
		// TODO Auto-generated method stub
		int QnaBoardResult = qnaboardDAO.insertBoard(qnaboard);
		// dao로 가장 최근에 추가된 번호 가져오기 (첨부파일)
		
		if (attachList.size() > 0) {
			// 첨부파일 있을 때 실행한다
			for(Attachment a : attachList) {
				int attachResult = qnaboardDAO.insertAttachment(a);
				if (attachResult == 0) System.out.println("첨부파일 전송 실팬");
			}
		}
		 
		return QnaBoardResult;
	}

	@Override
	public qnaBoard selectOneBoard(int askNo) {

		qnaBoard qnaboard = qnaboardDAO.selectOneBoard(askNo);
		
		return qnaboard;
	}

	@Override
	public List<Attachment> selectAttachmentList(int askNo) {
		// TODO Auto-generated method stub
		return qnaboardDAO.selectAttachmentList(askNo);
	}

	@Override
	public qnaBoard updateView(int askNo) {
		// TODO Auto-generated method stub
		return qnaboardDAO.selectOneBoard(askNo);
	}

	@Override
	public int updateBoard(qnaBoard qnaboard, List<Attachment> attachList) {
int totalResult = 0;
		
		List<Attachment> originList = qnaboardDAO.selectAttachmentList(qnaboard.getAskno());
		
		totalResult = qnaboardDAO.updateBoard(qnaboard); // DAO이동
		
		if(totalResult == 0 ) throw new BoardException("수정이 불가능합니다");
		
		if(originList.size() > 0) {		
			// 기존의 파일이 DB에 있다면
	       totalResult = qnaboardDAO.deleteAttachment(qnaboard.getAskno());
	       if(totalResult == 0 ) throw new BoardException("첨부파일 삭제가 불가능합니다");
		}
		
		if( attachList.size() > 0) {
			for(Attachment a : attachList) {
				totalResult = qnaboardDAO.updateAttachment(a);
				
				if(totalResult == 0) throw new BoardException("게시글 첨부파일 수정 실패");
			}
		}
				
				return totalResult;
	}

	@Override
	public int deleteBoard(int askNo) {
		// TODO Auto-generated method stub
		return qnaboardDAO.deleteBoard(askNo);
	}

	@Override
	public int deleteFile(int askboardfile) {
		// TODO Auto-generated method stub
		return qnaboardDAO.deleteFile(askboardfile);
	}

}
