package com.spring5.mypro01.member.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring5.mypro01.member.service.MemberService;
import com.spring5.mypro01.member.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController{
	
	@Autowired
	private MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	
	//메인페이지 이동
	@RequestMapping(value="/main", method= {RequestMethod.POST, RequestMethod.GET})
	public String main() {
		logger.info("메인페이지");
		return "main";
	}
	
	//관리자페이지 이동
	@RequestMapping(value="/admin/admin", method= {RequestMethod.POST, RequestMethod.GET})
	public String adminPage() {
		logger.info("관리자페이지");
		return "admin/admin";
	}
	
	//회원가입페이지
	@Override
	@RequestMapping(value="/signUp.do", method={RequestMethod.GET, RequestMethod.POST})
	public String signUp() throws Exception {
		return "signUp";
	}
	
	//로그인페이지get
	@Override
	@RequestMapping(value="/login.do", method={RequestMethod.GET, RequestMethod.POST})
	public String loginGet() throws Exception {
		return "login";
	}
	
	//id중복체크
	@Override
	@PostMapping("/member/isIdcheck.do")
	public void memberIdCheck(@RequestParam("id") String id,HttpServletResponse response) throws Exception {
		String idCheck = memberService.memberIdCheck(id);
		PrintWriter pw = response.getWriter();
		pw.print(idCheck);
	}
	
	//id와 password 중복체크
	@PostMapping("/member/idPassCheck")
	@ResponseBody
	public int idPassCheck(MemberVO memberVO, HttpSession session) throws Exception {
		logger.info("memberController idpasscheck" + memberVO);
		System.out.println(memberService.idpasswordCheck(memberVO));

		int check = memberService.idpasswordCheck(memberVO);
		
		if(check == 1) {
			session.setAttribute("id", memberVO.getId());
			session.setAttribute("password", memberVO.getPassword());
		}
		
		return check;
		//return (memberService.idpasswordCheck(memberVO)==0? "0" : "1");
	}
	
	//회원전체목록
	@Override
	@RequestMapping(value="/admin/membersList.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView listMembers() {
		ModelAndView mav = new ModelAndView("admin/membersList");
		List<MemberVO> membersList = memberService.listMembers();
		mav.addObject("membersList", membersList);
		return mav;
	}
	
	//회원등록
	@Override
	@PostMapping("/member/addMember.do")
	public ModelAndView addMember(@ModelAttribute("member") MemberVO memberVO, HttpServletResponse response) throws Exception {
		memberService.addMember(memberVO);
		ModelAndView mav = new ModelAndView("redirect:/login.do");
		mav.addObject("msg","signUp");
//        PrintWriter out = response.getWriter();
//        response.setContentType("text/html; charset=utf-8");
//        out.println("<script type='text/javascript'>alert('회원가입이 정상적으로 되었습니다. 로그인해주세요.');</script>");
		return mav;
	}
	
	//회원수정페이지
	@Override
	@RequestMapping(value="/member/myInfo.do", method={RequestMethod.GET, RequestMethod.POST})
	public String infoForm(@RequestParam("id") String id, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("memberVO", memberService.memberInfo(id));
		id = (String)request.getSession().getAttribute("id");
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		logger.info("클릭한 아이디 : "+id);
		return "member/myInfo";
	}	
	
	//회원수정
	@Override
	@RequestMapping(value = "/member/modMember.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String modMember(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws Exception {
		memberService.modMember(memberVO);
		logger.info("회원정보수정" + memberVO);
//      PrintWriter out = response.getWriter();
//      response.setContentType("text/html; charset=utf-8");
//      out.println("<script type='text/javascript'>alert('회원수정이 정상적으로 되었습니다.');</script>");
//		return "redirect:/admin/membersList.do";
		return "redirect:/member/myInfo.do?id="+memberVO.getId();
	}
	
	//회원탈퇴 비밀번호확인
//	@Override
//	@RequestMapping(value="/member/passwordCheck.do", method=RequestMethod.POST)
//	public ModelAndView passwordCheck(MemberVO memberVO) throws Exception {
//		ModelAndView mav = new ModelAndView("redirect:/member/removeRequest.do");
//		memberService.idpasswordCheck(memberVO);
//		System.out.println("비밀번호체크" + memberVO);
//		return mav;
//	}
	
	//회원탈퇴요청Form
	@Override
	@RequestMapping(value="/member/removeRequestForm.do", method= RequestMethod.GET)
	public String removeRequestForm(@ModelAttribute MemberVO memberVO, Model model, HttpServletRequest request) throws Exception {
		//model.addAttribute("memberVO", memberService.deleteRequest(memberVO));
		String id = (String)request.getSession().getAttribute("id");
		memberVO.setId(id);
		logger.info("removeRequestForm 탈퇴요청 form 아이디 : "+id);
		return "member/memberDelForm";
	}

	//회원탈퇴요청
	@Override
	@RequestMapping(value="/member/removeRequest.do", method= RequestMethod.POST)
	public ModelAndView removeRequest(@ModelAttribute MemberVO memberVO, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/login.do");
		String id = (String) session.getAttribute("id");
		memberVO.setId(id);
		memberService.deleteRequest(memberVO);
		System.out.println("탈퇴 : "+memberVO);
		session.invalidate();
		mav.addObject("msg","delete");
		return mav;
	}
	
	
	//회원탈퇴요청
//	@Override
//	@RequestMapping(value="/member/removeRequest.do", method= RequestMethod.GET)
//	public ModelAndView removeRequestPost(@ModelAttribute MemberVO memberVO, HttpServletRequest request, HttpSession session) throws Exception {
//		ModelAndView mav = new ModelAndView("redirect:/login.do");
//		String id = (String) session.getAttribute("id");
//		memberVO.setId(id);
//		memberService.deleteRequest(memberVO);
//		System.out.println("탈퇴2"+memberVO);
//		session.invalidate();
//		mav.addObject("msg","delete");
//		return mav;
//	}
	
	//회원탈퇴
	@Override
	@RequestMapping(value="/admin/removeMember.do", method= RequestMethod.GET)
	//	public ModelAndView removeMember(@RequestParam("id") String id) throws Exception {
	public ModelAndView removeMember(@RequestParam("id") String id,
									HttpServletRequest request,HttpServletResponse response) throws Exception {
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/admin/membersList.do");
		return mav;
	}
	
	private String getViewName(HttpServletRequest request) throws Exception {
		
		String contextPath = request.getContextPath();
	    String uri = (String)request.getAttribute("javax.servlet.include.request_uri");
	    if(uri==null || uri.trim().equals("")) {
	    	uri=request.getRequestURI();
	    }
	    
	    int begin=0;
	    if(!((contextPath==null || uri.trim().equals(contextPath)))) {
	    	begin = contextPath.length();
	    }
	    
	    int end;
	    if(uri.indexOf(";")!=-1) {
	    	end=uri.indexOf(";");
	    } else if(uri.indexOf("?")!=-1) {
	    	end= uri.indexOf("?");
	    } else {
	    	end=uri.length();
	    }
	    
	    String fileName=uri.substring(begin,end);
	    if(fileName.indexOf(".")!=-1) {
	    	fileName=fileName.substring(0,fileName.lastIndexOf("."));
	    }
	    if(fileName.lastIndexOf("/")!=-1) {
	    	fileName=fileName.substring(fileName.lastIndexOf("/"), fileName.length());
	    }
	    System.out.println("getViewName처리 결과 : " + fileName);
	    return fileName;
	}

	//id검색
	@Override
	@PostMapping("/admin/isIdFind.do")
	//public ModelAndView memberIdFind(@RequestParam("id") String id) throws Exception {
	public ModelAndView memberIdFind(@RequestParam("id") String id) throws Exception {
		ModelAndView mav = new ModelAndView("admin/membersList");
		List<MemberVO> membersList = memberService.findMember(id);
		mav.addObject("membersList", membersList);
		logger.info("member id로 검색해서 찾기 : " + membersList);
		return mav;
	}

	//로그아웃
	@RequestMapping(value="/logout.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView logout(HttpSession session) {
		memberService.logout(session);
		ModelAndView mav=new ModelAndView("redirect:/login.do");
		mav.addObject("msg","logout");
		return mav;
	}
	
}