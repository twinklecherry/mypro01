package com.spring5.mypro01.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring5.mypro01.board.vo.CommentVO;

@Repository("commentDAO")
public class CommentDAOImpl implements CommentDAO{

	@Autowired
	private SqlSession sqlSession;

	public CommentDAOImpl() {
	}

	public CommentDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<CommentVO> selectAllCommentList(int boardNO) throws DataAccessException {
		return sqlSession.selectList("CommentMapper.selectAllCommentList",boardNO);
	}

	@Override
	public int insertComment(CommentVO commentVO) throws DataAccessException {
		return sqlSession.insert("CommentMapper.insertComment",commentVO);
	}

	@Override
	public int deleteComment(int commentNO) throws DataAccessException {
		return sqlSession.delete("CommentMapper.deleteComment", commentNO);
	}

}
