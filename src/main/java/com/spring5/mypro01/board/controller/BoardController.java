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
	public ModelAndView adminListBoard();
	public ModelAndView memberListBoard(@ModelAttribute("board") BoardVO boardVO,
			HttpServletRequest request) throws Exception;
	public ModelAndView boardView(HttpServletRequest request,@RequestParam("boardNO")int boardNO) throws Exception;
	public void addBoardForm(HttpServletRequest request) throws Exception;
	public ModelAndView addBoard(@ModelAttribute("board") BoardVO boardVO, HttpServletRequest request) throws Exception;
	public String modBoard(@ModelAttribute("board") BoardVO boardVO, HttpServletRequest request,Model model) throws Exception;
	
	public String removeBoardMember(@RequestParam("boardNO") int boardNO) throws Exception;
	public String removeBoard(@RequestParam("boardNO") int boardNO) throws Exception;
	
	//===================================
	public ModelAndView addComment(@ModelAttribute("comment") CommentVO commentVO,HttpSession session) throws Exception;
	public String removeComment(@RequestParam("commentNO") int commentNO) throws Exception;
	
}
