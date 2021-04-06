package com.spring5.mypro01.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring5.mypro01.board.vo.BoardVO;
import com.spring5.mypro01.board.vo.CommentVO;

public interface BoardDAO {

	public List<BoardVO> selectAllBoardList() throws DataAccessException;
	public BoardVO viewBoard(int boardNO) throws DataAccessException;
	
	public List<BoardVO> selectId(String id) throws DataAccessException;
	public int insertBoard(BoardVO boardVO) throws DataAccessException;
	
	public int updateBoard(BoardVO boardVO) throws DataAccessException;
	
	public int deleteRequest(int boardNO) throws DataAccessException;
	public int deleteBoard(int boardNO) throws DataAccessException;

}
