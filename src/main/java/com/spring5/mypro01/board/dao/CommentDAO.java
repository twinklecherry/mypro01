package com.spring5.mypro01.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring5.mypro01.board.vo.CommentVO;

public interface CommentDAO {
	
	public List<CommentVO> selectAllCommentList(int boardNO) throws DataAccessException;
	public int insertComment(CommentVO commentVO) throws DataAccessException;
	public int deleteComment(int commentNO) throws DataAccessException;
}
