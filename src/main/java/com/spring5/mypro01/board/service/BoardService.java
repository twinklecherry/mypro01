package com.spring5.mypro01.board.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring5.mypro01.board.vo.BoardVO;

public interface BoardService {

	//게시물 전체 조회
	public List<BoardVO> selectAllBoardList() throws DataAccessException;
	//게시물 상세
	public BoardVO viewBoard(int boardNO) throws DataAccessException;
	//아이디 조회
	public List<BoardVO> selectId(String id) throws DataAccessException;
	//게시물 작성
	public int addBoard(BoardVO boardVO) throws DataAccessException;
	//게시물 수정
	public int modBoard(BoardVO boardVO) throws DataAccessException;
	//게시물 삭제요청
	public int deleteRequest(int boardNO) throws DataAccessException;
	//게시물 삭제
	public int removeBoard(int boardNO) throws DataAccessException;
	//게시물 검색
	public List<BoardVO> searchBoard(String title) throws DataAccessException;

}
