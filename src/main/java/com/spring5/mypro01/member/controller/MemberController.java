package com.spring5.mypro01.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring5.mypro01.member.vo.MemberVO;

public interface MemberController {

	//회원가입
	public String signUp() throws Exception;
	//로그인
	public String loginGet() throws Exception;
	//마이페이지
	public String infoForm(String id, Model model, HttpServletRequest request) throws Exception;
	//회원목록
	public ModelAndView listMembers();
	//회원등록
	public ModelAndView addMember(@ModelAttribute("member") MemberVO memberVO, HttpServletResponse response) throws Exception;
	//비밀번호체크
	//public ModelAndView passwordCheck(MemberVO memberVO) throws Exception;
	//회원탈퇴요청 폼
	public String removeRequestForm(@ModelAttribute MemberVO memberVO, Model model, HttpServletRequest request) throws Exception;
	//회원탈퇴요청
	public ModelAndView removeRequest(@ModelAttribute MemberVO memberVO, HttpServletRequest request, HttpSession session) throws Exception;
	//회원삭제
	public ModelAndView removeMember(@RequestParam("id") String id,
						HttpServletRequest request, HttpServletResponse response) throws Exception;
	//회원수정
	public String modMember(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws Exception;
	//회원가입 아이디중복확인
	public void memberIdCheck(@RequestParam("id") String id,HttpServletResponse response) throws Exception;
	//아이디 검색
	public ModelAndView memberIdFind(@RequestParam("id") String id) throws Exception;
	//로그아웃
	public ModelAndView logout(HttpSession session);
}
