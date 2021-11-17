package com.kh.camp.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.board.model.vo.Attachment;
import com.kh.camp.board.model.vo.PsBoard;

@Repository
public class PsBoardDAOImpl implements PsBoardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		
		// db에서 특정 갯수의 행만 가져오는 객체
		RowBounds rows = new RowBounds((cPage -1 )* numPerPage, numPerPage);
		return sqlSession.selectList("psboardSQL.selectBoardList", null, rows);
	}

	@Override
	public int selectBoardTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("psboardSQL.selectBoardTotalContents");
	}

	@Override
	public int insertBoard(PsBoard psboard) {
		// TODO Auto-generated method stub
		return sqlSession.insert("psboardSQL.insertBoard", psboard);
	}

	@Override
	public int insertAttachment(Attachment a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("psboardSQL.insertAttachment", a);
	}

	@Override
	public PsBoard selectOneBoard(int nNo) {
		
		return sqlSession.selectOne("psboardSQL.selectOneBoard", nNo);
	}

	@Override
	public List<Attachment> selectAttachmentList(int nNo) {
		
		return sqlSession.selectList("psboardSQL.selectAttachmentList", nNo);
	}

	@Override
	public int updateReadCount(int nNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("psboardSQL.updateReadCount", nNo);
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
