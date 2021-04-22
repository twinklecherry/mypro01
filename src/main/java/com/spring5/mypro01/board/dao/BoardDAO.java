package com.spring5.mypro01.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring5.mypro01.board.vo.BoardVO;
import com.spring5.mypro01.board.vo.CommentVO;

public interface BoardDAO {

	//게시물 전체조회
	public List<BoardVO> selectAllBoardList() throws DataAccessException;
	
	//게시물 상세
	public BoardVO viewBoard(int boardNO) throws DataAccessException;
	
	//아이디 조회
	public List<BoardVO> selectId(String id) throws DataAccessException;

	//게시물 삽입
	public int insertBoard(BoardVO boardVO) throws DataAccessException;
	
	//게시물 수정
	public int updateBoard(BoardVO boardVO) throws DataAccessException;
	
	//게시물 삭제 요청
	public int deleteRequest(int boardNO) throws DataAccessException;
	
	//게시물 삭제
	public int deleteBoard(int boardNO) throws DataAccessException;

	//게시물 검색
	public List<BoardVO> searchBoard(String title) throws DataAccessException;
}
