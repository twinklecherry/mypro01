package com.spring5.mypro01.member.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring5.mypro01.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSession sqlSession;

	public MemberDAOImpl() {
	}

	public MemberDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<MemberVO> selectMembersList() throws DataAccessException {
		List<MemberVO> membersList = sqlSession.selectList("MemberMapper.selectMembersList");
		return membersList;
	}
	
	@Override
	public String memberIdCheck(String id) throws DataAccessException {
		return sqlSession.selectOne("MemberMapper.memberIdCheck", id);
	}
	
	@Override
	public List<MemberVO> SearchMember(String id) throws DataAccessException {
		return sqlSession.selectList("MemberMapper.SearchMember", id);
	}

	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		return sqlSession.insert("MemberMapper.insertMember",memberVO);
	}
	
	@Override
	public int idpasswordCheck(MemberVO memberVO) throws DataAccessException {
		return sqlSession.selectOne("MemberMapper.idpasswordCheck", memberVO);
	}
	
	@Override
	public int deleteRequest(MemberVO memberVO) throws DataAccessException {
		return sqlSession.update("MemberMapper.deleteRequest", memberVO);
	}
	
	@Override
	public int deleteMember(String id) throws DataAccessException {
		return sqlSession.delete("MemberMapper.deleteMember", id);
	}
	
	@Override
	public MemberVO memberInfo(String id) throws DataAccessException {
		return sqlSession.selectOne("MemberMapper.myInfo", id);
	}
	
	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		return sqlSession.update("MemberMapper.updateMember", memberVO);
	}
	
	@Override
	public void logout(HttpSession session) {
	}
}
