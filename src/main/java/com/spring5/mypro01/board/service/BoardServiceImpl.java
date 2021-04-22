package com.spring5.mypro01.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring5.mypro01.board.dao.BoardDAO;
import com.spring5.mypro01.board.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> selectAllBoardList() throws DataAccessException {
		List<BoardVO> boardList = boardDAO.selectAllBoardList();
		return boardList;
	}

	@Override
	public BoardVO viewBoard(int boardNO) throws DataAccessException {
		return boardDAO.viewBoard(boardNO);
	}
	
	@Override
	public List<BoardVO> selectId(String id) throws DataAccessException {
		return boardDAO.selectId(id);
	}
	@Override
	public int addBoard(BoardVO boardVO) throws DataAccessException {
		return boardDAO.insertBoard(boardVO);
	}
	
	@Override
	public int modBoard(BoardVO boardVO) throws DataAccessException {
		System.out.println(boardVO);
		return boardDAO.updateBoard(boardVO);
	}
	
	@Override
	public int deleteRequest(int boardNO) throws DataAccessException {
		System.out.println(boardNO);
		return boardDAO.deleteRequest(boardNO);
	}
	
	@Override
	public int removeBoard(int boardNO) throws DataAccessException {
		return boardDAO.deleteBoard(boardNO);
	}
	
	//게시물 검색
	@Override
	public List<BoardVO> searchBoard(String title) throws DataAccessException {
		return boardDAO.searchBoard(title);
	}

}
