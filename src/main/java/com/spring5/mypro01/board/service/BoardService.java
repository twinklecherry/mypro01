package com.spring5.mypro01.board.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring5.mypro01.board.vo.BoardVO;

public interface BoardService {

	public List<BoardVO> selectAllBoardList() throws DataAccessException;
	public BoardVO viewBoard(int boardNO) throws DataAccessException;
	
	public List<BoardVO> selectId(String id) throws DataAccessException;
	public int addBoard(BoardVO boardVO) throws DataAccessException;
	
	public int modBoard(BoardVO boardVO) throws DataAccessException;
	
	public int deleteRequest(int boardNO) throws DataAccessException;
	public int removeBoard(int boardNO) throws DataAccessException;
}
