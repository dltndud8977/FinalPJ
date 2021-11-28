package com.kh.camp.qnaboard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.camp.board.model.vo.Attachment;
import com.kh.camp.qnaboard.model.vo.qnaBoard;


public interface qnaBoardService {
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(qnaBoard qnaboard, List<Attachment> attachList);

	qnaBoard selectOneBoard(int askNo);

	List<Attachment> selectAttachmentList(int askNo);

	qnaBoard updateView(int askNo);
	
	int updateBoard(qnaBoard qnaboard, List<Attachment> attachList);
	
	int deleteBoard(int askNo);

	int deleteFile(int askNo);
	
	
	
}
