package com.kh.honeypoint.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.honeypoint.board.model.exception.boardException;
import com.kh.honeypoint.board.model.service.boardService;
import com.kh.honeypoint.board.model.vo.Board;
import com.kh.honeypoint.board.model.vo.BoardFile;
import com.kh.honeypoint.board.model.vo.InsertBImg;
import com.kh.honeypoint.board.model.vo.PageInfo;
import com.kh.honeypoint.board.model.vo.Pagination;
import com.kh.honeypoint.restaurant.model.vo.ReviewImg;
import com.kh.honeypoint.board.controller.boardController;

@Controller
public class boardController {

	@Autowired
	private boardService bService;

	private Logger logger = LoggerFactory.getLogger(boardController.class);

	@RequestMapping("blist.do")
	public ModelAndView boardList(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page) {
		// 커맨드 객체 사용 시 해당 파라미터가 존재하지 않을 경우 null 값을 반환함
		// 자료형이 int인 경우 null 값을 저장할 수 없음
		int currentPage = page != null ? page : 1;

		// 1. 전체 게시글 개수 리턴 받기
		int listCount = bService.selectListCount();

		// 페이징 정보 만들기
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		// 2. 페이징 정보에 맞는 게시글 리스트 셀렉
		ArrayList<Board> list = bService.selectList(pi);
		System.out.println("보드확인 : " + list);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("board/boardList");
		} else {
			throw new boardException("게시글 목록 조회에 실패하였습니다");
		}
		return mv;
	}

	@RequestMapping("binsertView.do")
	public ModelAndView boardInsertView(ModelAndView mv, @RequestParam("bType") String bType) {
		mv.addObject("bType", bType);
		mv.setViewName("board/insertBoard");
		return mv;
	}

	@RequestMapping("bDetail.do")
	public ModelAndView boardDetail(ModelAndView mv, int bNo, @RequestParam("page") Integer page,
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam("bType") String bType) {

		int currentPage = page != null ? page : 1;

		Board board = null;
		ArrayList<BoardFile> boardFile = null;

		// 쿠키 값을 이용하여 게시글 읽음 여부 확인
		boolean flag = false;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("bNo" + bNo)) {
					// 해당 게시글에 대한 쿠키 존재(이미 게시글을 읽었음)
					flag = true;
				}
			}
			if (!flag) { // 게시글을 처음 읽을 경우 쿠키 저장하기
				Cookie c = new Cookie("bNo" + bNo, String.valueOf(bNo));
				c.setMaxAge(1 * 24 * 60 * 60); // 하루동안 저장
				response.addCookie(c);
			}
			board = bService.selectBoard(bNo, flag);
			boardFile = bService.selectBoardImgList(bNo);
			
		}

		if (board != null) {
			mv.addObject("bType", bType);
			mv.addObject("boardFile", boardFile);
			mv.addObject("board", board).addObject("currentPage", currentPage).setViewName("board/boardDetail");
		} else {
			throw new boardException("게시글 상세조회에 실패하였습니다");
		}

		return mv;
	}

	@RequestMapping("bTab.do")
	public ModelAndView boardListTab(ModelAndView mv, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam("bType") String bType) {
		int currentPage = page != null ? page : 1;

		int listCount = bService.selectTabListCount(bType);

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Board> list = bService.selectTabList(pi, bType);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("bType", bType);
			mv.setViewName("board/boardList");
		} else {
			throw new boardException("게시글 목록 조회에 실패하였습니다");
		}
		return mv;
	}

	@RequestMapping(value = "binsert.do", method = RequestMethod.POST)
	public String boardInsert(Board b, BoardFile f, HttpServletRequest request, MultipartHttpServletRequest multi) {
		int result = 0;
		int result2 = 0;

		result = bService.insertBoard(b);

		if (result > 0) {
			if (multi.getFileNames().hasNext()) {

				System.out.println("첫번째");

				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "//img//board";
				String fileName = "";
				ArrayList<String> originFileList = new ArrayList<String>();
				ArrayList<String> renameFileList = new ArrayList<String>();

				File folder = new File(savePath);

				if (folder.exists()) {
					folder.mkdirs();
				}

				Iterator<String> files = multi.getFileNames();

				System.out.println("두번째" + multi.getFileNames());
				System.out.println("세 번째" + files.hasNext());

				while (files.hasNext()) {
					String uploadFile = files.next();
					System.out.println("네 번째" + uploadFile);

					MultipartFile mFile = multi.getFile(uploadFile);
					System.out.println("원본 파일 이름 : " + mFile.getOriginalFilename());
					if (mFile.getOriginalFilename().equals("")) {
						continue;
					}

					// 파일 이름짓기
					int ranNum = (int) (Math.random() * 100000);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String originFileName = mFile.getOriginalFilename();
					fileName = sdf.format(new Date()) + "_" + ranNum
							+ originFileName.substring(originFileName.lastIndexOf("."));

					try {
						System.out.println(folder + "//" + fileName);
						mFile.transferTo(new File(folder + "//" + fileName));
						originFileList.add(originFileName);
						renameFileList.add(fileName);
					} catch (Exception e) {
						e.printStackTrace();
					}

				}
				InsertBImg value = new InsertBImg();

				//value.setbNo(b.getbNo());
				value.setOriginFileList(originFileList);
				value.setRenameFileList(renameFileList);

				//int bNo = b.getbNo();

				System.out.println("---------파일밸류값 확인 : " + value);
				for (int i = 0; i < originFileList.size(); i++) {
					System.out.println(originFileList.get(i));
					result2 = bService.insertBImg(originFileList.get(i), renameFileList.get(i));
				}

				if (result2 > 0) {
					System.out.println("게시글 이미지 디비 등록완료");
				} else {
					System.out.println("게시글 이미지 디비 등록안댐");
				}
			} // 만약에 사진파일이 있을때
			else { // 사진파일 첨부 안했을 때
				return "redirect:blist.do";
			}
		}
		return "redirect:blist.do";
	}

}
