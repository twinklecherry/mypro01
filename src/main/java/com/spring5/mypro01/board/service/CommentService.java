package com.spring5.mypro01.board.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring5.mypro01.board.vo.CommentVO;

public interface CommentService {

	public List<CommentVO> selectAllCommentList(int boardNO) throws DataAccessException;
	public int addComment(CommentVO commentVO) throws DataAccessException;
	public int removeComment(int commentNO) throws DataAccessException;
}
