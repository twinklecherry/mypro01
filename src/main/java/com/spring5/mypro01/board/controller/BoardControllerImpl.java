package com.spring5.mypro01.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring5.mypro01.board.service.BoardService;
import com.spring5.mypro01.board.service.CommentService;
import com.spring5.mypro01.board.vo.BoardVO;
import com.spring5.mypro01.board.vo.CommentVO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController{

	@Autowired
	private BoardService boardService;
	@Autowired
	private CommentService commentService;
	
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	private static final Logger logger = LoggerFactory.getLogger(BoardControllerImpl.class);

//=======================board
	//관리자게시물리스트
	@Override
	@RequestMapping(value="/admin/boardList.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView adminListBoard() {
		ModelAndView mav = new ModelAndView("/admin/boardList");
		List<BoardVO> boardList = boardService.selectAllBoardList();
		mav.addObject("boardList", boardList);
		return mav;
	}
	
	//회원게시물리스트
	@Override
	@RequestMapping(value="/board/boardList.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberListBoard(@ModelAttribute("board") BoardVO boardVO,
			HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("/board/boardList");
		String id = (String)request.getSession().getAttribute("id");
		boardVO.setId(id);
		List<BoardVO> boardList = boardService.selectAllBoardList();
		mav.addObject("boardList", boardList);
		return mav;
	}

	//게시물상세폼
	@Override
	@RequestMapping(value="/board/boardView.do")
	public ModelAndView boardView(HttpServletRequest request,@RequestParam("boardNO")int boardNO) throws Exception {
		ModelAndView mav = new ModelAndView("/board/boardView");
		HttpSession session = request.getSession();
		session.isNew();
		session.getAttribute("id");
		mav.addObject("board", boardService.viewBoard(boardNO));
		List<CommentVO> commentList = commentService.selectAllCommentList(boardNO);
		mav.addObject("commentList", commentList);
		logger.info("게시물넘버 : "+boardNO);
		return mav;
	}
	
	//게시물등록폼
	@Override
	@RequestMapping(value="/board/addBoardForm.do")
	public void addBoardForm(HttpServletRequest request) throws Exception {
//	public void addBoardForm() throws Exception { 수정
		logger.info("게시물등록폼");
	}
	
	//게시물등록
	@Override
	@RequestMapping(value="/board/addBoard.do")
	public ModelAndView addBoard(@ModelAttribute("board") BoardVO boardVO, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("redirect:/board/boardList.do");
		String id = (String)request.getSession().getAttribute("id");
		boardVO.setId(id);
		boardService.addBoard(boardVO);
		logger.info("게시물등록"+boardVO);
		return mav;
	}

	//게시글 수정
	@Override
	@RequestMapping("/board/modBoard.do")
	public String modBoard(@ModelAttribute BoardVO boardVO, HttpServletRequest request,Model model) throws Exception {
		String id = (String)request.getSession().getAttribute("id");
		boardVO.setId(id);
		BoardVO board = new BoardVO();
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		boardService.modBoard(boardVO);

		System.out.println("게시글수정완료");
		return "redirect:/board/boardList.do";
	}
	
	//회원 게시물 삭제
	@Override
	@RequestMapping(value="/board/removeBoardMember.do", method=RequestMethod.GET)
	public String removeBoardMember(@RequestParam("boardNO") int boardNO) throws Exception {
		boardService.deleteRequest(boardNO);
		System.out.println("게시물삭제NO : "+boardNO);
		return "redirect:/board/boardList.do";
	}
	
	//admin 게시물삭제
	@Override
	@GetMapping(value="/board/removeBoard.do")
	public String removeBoard(@RequestParam("boardNO") int boardNO) throws Exception {
		boardService.removeBoard(boardNO);
		System.out.println("게시물삭제NO : "+boardNO);
		return "redirect:/admin/boardList.do";
	}
	
	//게시글 검색
	@Override
	@PostMapping("/admin/isTitleFind")
	public ModelAndView searchBoard(BoardVO boardVO, String title) throws Exception {
		ModelAndView mav = new ModelAndView("admin/boardList");
		List<BoardVO> boardList = boardService.searchBoard(title);
		System.out.println("searchBoard : " + title);
		mav.addObject("boardList", boardList);
		return mav;
	}
	
	//파일업로드
	private Map<String, String> upload(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		Map<String, String> articleMap = new HashMap<String, String>();
		File currentDirPath = new File(ARTICLE_IMAGE_REPO);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024 * 1024);
		ServletFileUpload upload = new ServletFileUpload(factory); 
		
		try {
			List items = upload.parseRequest(request);
			for(int i=0; i<items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);
				if(fileItem.isFormField()) {
					System.out.println(fileItem.getFieldName() + "=" + fileItem.getString("utf-8"));
					articleMap.put(fileItem.getFieldName(), fileItem.getString("utf-8"));
				} else {
					System.out.println("파라미터 명 : " +  fileItem.getFieldName());
					System.out.println("파일명:" + fileItem.getName());
					System.out.println("파일크기:" + fileItem.getSize() + "bytes");
					articleMap.put(fileItem.getFieldName(), fileItem.getName());
					
					if(fileItem.getSize()>0) { 
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx==-1) {			
							idx = fileItem.getName().lastIndexOf("/"); 
						}
						
						String fileName = fileItem.getName().substring(idx+ 1); 
						System.out.println("파일명: " + fileName);
						File uploadFile = new File(currentDirPath + "\\temp\\" + fileName);
						fileItem.write(uploadFile); 
					}
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return articleMap;
	}
	
//===============================댓글
	
	//답변등록
	@Override
	@GetMapping(value="/board/addComment.do")
	public ModelAndView addComment(CommentVO commentVO,HttpSession session) throws Exception {
		System.out.println("addComment");
		ModelAndView mav = new ModelAndView("redirect:/board/boardList.do");
		String id = (String) session.getAttribute("id");
		commentVO.setId(id);
		commentService.addComment(commentVO);
		System.out.println("답변등록");
		return mav;
	}

	//답변삭제
	@Override
	@RequestMapping(value="/board/removeComment.do", method=RequestMethod.GET)
	public String removeComment(@RequestParam("commentNO") int commentNO) throws Exception {
		commentService.removeComment(commentNO);
		System.out.println("게시물삭제NO : "+commentNO);
		return "redirect:/board/boardList.do";
	}
	
}