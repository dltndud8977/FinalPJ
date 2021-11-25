 package com.kh.camp.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.camp.board.model.vo.Attachment;
import com.kh.camp.board.model.vo.PsBoard;



public interface PsBoardDAO {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(PsBoard psboard);

	int insertAttachment(Attachment a);

	PsBoard selectOneBoard(int nNo);

	List<Attachment> selectAttachmentList(int nNo);
	
	
	int updateBoard(PsBoard psboard);

	int updateAttachment(Attachment a);

	int deleteBoard(int nNo);

	int deleteAttachment(int nNo);

	int deleteFile(int afNo);
}
