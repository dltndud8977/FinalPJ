package com.kh.camp.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.camp.board.model.vo.Attachment;
import com.kh.camp.board.model.vo.PsBoard;



public interface PsBoardService {
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();

	int insertBoard(PsBoard psboard, List<Attachment> attachList);

	PsBoard selectOneBoard(int nNo);

	List<Attachment> selectAttachmentList(int nNo);

	PsBoard updateView(int nNo);
	
	int updateBoard(PsBoard psboard, List<Attachment> attachList);
	
	int deleteBoard(int nNo);

	int deleteFile(int afNo);
}
