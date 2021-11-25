package com.kh.camp.qnaboard.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.camp.board.model.vo.Attachment;
import com.kh.camp.board.model.vo.PsBoard;
import com.kh.camp.qnaboard.model.vo.qnaBoard;

public interface qnaBoardDAO {
	
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(qnaBoard qnaboard);

	int insertAttachment(Attachment a);

	qnaBoard selectOneBoard(int askNo);

	List<Attachment> selectAttachmentList(int askNo);
	
	
	int updateBoard(qnaBoard qnaboard);

	int updateAttachment(Attachment a);

	int deleteBoard(int askNo);

	int deleteAttachment(int askNo);

	int deleteFile(int askNo);

}
