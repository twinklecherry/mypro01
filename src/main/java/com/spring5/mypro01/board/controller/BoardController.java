package com.spring5.mypro01.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring5.mypro01.board.vo.BoardVO;
import com.spring5.mypro01.board.vo.CommentVO;

public interface BoardController {
	
	//=================================board
	//관리자_게시물 전체 조회
	public ModelAndView adminListBoard();
	//게시글 조회
	public ModelAndView memberListBoard(@ModelAttribute("board") BoardVO boardVO,
			HttpServletRequest request) throws Exception;
	//게시글 상세
	public ModelAndView boardView(HttpServletRequest request,@RequestParam("boardNO")int boardNO) throws Exception;
	//게시글 작성폼
	public void addBoardForm(HttpServletRequest request) throws Exception;
	//게시글 작성
	public ModelAndView addBoard(@ModelAttribute("board") BoardVO boardVO, HttpServletRequest request) throws Exception;
	//게시글 수정
	public String modBoard(@ModelAttribute("board") BoardVO boardVO, HttpServletRequest request,Model model) throws Exception;
	//게시글 삭제요청
	public String removeBoardMember(@RequestParam("boardNO") int boardNO) throws Exception;
	//게시글 삭제
	public String removeBoard(@RequestParam("boardNO") int boardNO) throws Exception;
	//게시글 검색
	public ModelAndView searchBoard(@ModelAttribute("title") String title) throws Exception;
	
	
	//===================================comment
	//댓글 작성
	public ModelAndView addComment(@ModelAttribute("comment") CommentVO commentVO,HttpSession session) throws Exception;
	//댓글 삭제
	public String removeComment(@RequestParam("commentNO") int commentNO) throws Exception;
	
}
