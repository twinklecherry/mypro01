package com.spring5.mypro01.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring5.mypro01.board.vo.BoardVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSession sqlSession;

	public BoardDAOImpl() {
	}

	public BoardDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//게시물 전체조회
	@Override
	public List<BoardVO> selectAllBoardList() throws DataAccessException {
		return sqlSession.selectList("BoardMapper.selectAllBoardList");
	}
	
	//게시물 상세
	@Override
	public BoardVO viewBoard(int boardNO) throws DataAccessException {
		return sqlSession.selectOne("BoardMapper.viewBoard", boardNO);
	}
	
	//아이디 조회
	@Override
	public List<BoardVO> selectId(String id) throws DataAccessException {
		return sqlSession.selectOne("BoardMapper.selectId", id);
	}
	
	//게시물 작성
	@Override
	public int insertBoard(BoardVO boardVO) throws DataAccessException {
		return sqlSession.insert("BoardMapper.insertBoard",boardVO);
	}
	
	//게시물 수정
	@Override
	public int updateBoard(BoardVO boardVO) throws DataAccessException {
		System.out.println(boardVO);
		return sqlSession.update("BoardMapper.updateBoard", boardVO);
	}
	
	//게시물 삭제 요청
	@Override
	public int deleteRequest(int boardNO) throws DataAccessException {
		System.out.println(boardNO);
		return sqlSession.update("BoardMapper.deleteRequest",boardNO);
	}
	
	//게시물 삭제
	@Override
	public int deleteBoard(int boardNO) throws DataAccessException {
		return sqlSession.delete("BoardMapper.deleteBoard", boardNO);
	}
	
	//게시물 검색
	@Override
	public List<BoardVO> searchBoard(String title) throws DataAccessException {
		return sqlSession.selectList("BoardMapper.searchBoard");
	}

}
