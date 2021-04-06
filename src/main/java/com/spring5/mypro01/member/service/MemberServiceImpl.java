package com.spring5.mypro01.member.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.spring5.mypro01.member.dao.MemberDAO;
import com.spring5.mypro01.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List<MemberVO> listMembers() throws DataAccessException {
		List<MemberVO> membersList = memberDAO.selectMembersList();
		return membersList;
	}
	
	@Override
	public String memberIdCheck(String id) throws DataAccessException {
		return memberDAO.memberIdCheck(id);
	}
	
	@Override
	public List<MemberVO> findMember(String id) throws DataAccessException {
		return memberDAO.SearchMember(id);
	}
	
	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.insertMember(memberVO);
	}
	
	@Override
	public int idpasswordCheck(MemberVO memberVO) throws DataAccessException {
		return memberDAO.idpasswordCheck(memberVO);
	}
	
	@Override
	public int deleteRequest(MemberVO memberVO) throws DataAccessException {
		return memberDAO.deleteRequest(memberVO);
	}
	
	@Override
	public int removeMember(String id) throws DataAccessException {
		return memberDAO.deleteMember(id);
	}
	
	@Override
	public MemberVO memberInfo(String id) throws DataAccessException {
		return memberDAO.memberInfo(id);
	}
	
	@Override
	public int modMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.updateMember(memberVO);
	}
	
	@Override
	public int login(MemberVO memberVO, HttpSession session) throws DataAccessException {
//		int idCheckResult = -1;
//		try { 
//			idCheckResult = session.selectOne(memberDAO + "login", memberVO);
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//			return -1;
//		}
//		 if(idCheckResult != 1) return idCheckResult;
//	        
//	        try {
//	        	MemberVO m_info = session.selectOne(memberDAO + "Login_Info", memberVO);
//	        	session.setAttribute("m", m_info);
//	            return 1;
//	        }
//	        catch (Exception e) {
//	            e.printStackTrace();
//	            return -2;
//	        }
		return 1;
	}
	
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
}
