package com.spring5.mypro01.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring5.mypro01.board.dao.CommentDAO;
import com.spring5.mypro01.board.vo.CommentVO;

@Service("commentService")
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDAO commentDAO;
	
	@Override
	public List<CommentVO> selectAllCommentList(int boardNO) throws DataAccessException {
		List<CommentVO> commentList = commentDAO.selectAllCommentList(boardNO);
		return commentList;
	}

	@Override
	public int addComment(CommentVO commentVO) throws DataAccessException {
		return commentDAO.insertComment(commentVO);
	}
	
	@Override
	public int removeComment(int commentNO) throws DataAccessException {
		return commentDAO.deleteComment(commentNO);
	}

}
