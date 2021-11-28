package com.kh.camp.qnaboard.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.camp.board.model.vo.Attachment;
import com.kh.camp.qnaboard.model.vo.qnaBoard;


@Repository
public class qnaBoardDAOImpl implements qnaBoardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		
		
		RowBounds rows = new RowBounds((cPage -1) * numPerPage,  numPerPage);
		
		return sqlSession.selectList("qnaboardSQL.selectBoardList", null, rows);
	
	}

	@Override
	public int selectBoardTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qnaboardSQL.selectBoardTotalContents");
	}

	@Override
	public int insertBoard(qnaBoard qnaboard) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qnaboardSQL.insertBoard", qnaboard);
	}

	@Override
	public int insertAttachment(Attachment a) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public qnaBoard selectOneBoard(int askNo) {


		return sqlSession.selectOne("qnaboardSQL.selectOneBoard",askNo);
	}

	@Override
	public List<Attachment> selectAttachmentList(int askNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("qnaboardSQL.selectAttachmentList", askNo);
	}

	@Override
	public int updateBoard(qnaBoard qnaboard) {
		// TODO Auto-generated method stub
		return sqlSession.update("qnaboardSQL.updateBoard", qnaboard);
	}

	@Override
	public int updateAttachment(Attachment a) {
		// TODO Auto-generated method stub
		return sqlSession.insert("qnaboardSQL.updateAttachment", a);
	}

	@Override
	public int deleteBoard(int askNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("qnaboardSQL.deleteBoard", askNo);
	}

	@Override
	public int deleteAttachment(int askNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("qnaboardSQL.deleteAttachment", askNo);
	}

	@Override
	public int deleteFile(int askNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("qnaboardSQL.deleteFile", askNo);
	}

}
