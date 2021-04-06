package com.spring5.mypro01.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;

import com.spring5.mypro01.member.vo.MemberVO;

public interface MemberService {

	public List<MemberVO> listMembers() throws DataAccessException;
	public List<MemberVO> findMember(String id) throws DataAccessException;
	public MemberVO memberInfo(String id) throws DataAccessException;
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public String memberIdCheck(String id) throws DataAccessException;
	public int idpasswordCheck(MemberVO memberVO) throws DataAccessException;
	public int deleteRequest(MemberVO memberVO) throws DataAccessException;
	public int removeMember(String id) throws DataAccessException;
	public int modMember(MemberVO memberVO) throws DataAccessException; 
	public int login(MemberVO memberVO, HttpSession session) throws DataAccessException ;
	public void logout(HttpSession session);
	
}
