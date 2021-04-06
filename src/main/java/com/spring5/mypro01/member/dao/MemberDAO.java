package com.spring5.mypro01.member.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;

import com.spring5.mypro01.member.vo.MemberVO;

public interface MemberDAO {

	public List<MemberVO> selectMembersList() throws DataAccessException;
	public String memberIdCheck(String id) throws DataAccessException;
	public List<MemberVO> SearchMember(String id) throws DataAccessException;
	public MemberVO memberInfo(String id) throws DataAccessException;
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	public int idpasswordCheck(MemberVO memberVO) throws DataAccessException;
	public int deleteRequest(MemberVO memberVO) throws DataAccessException;
	public int deleteMember(String id) throws DataAccessException;
	public int updateMember(MemberVO memberVO) throws DataAccessException;
	public void logout(HttpSession session);
}