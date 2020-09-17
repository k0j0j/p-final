package com.kh.honeypoint.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.honeypoint.board.model.exception.boardException;
import com.kh.honeypoint.board.model.service.boardService;
import com.kh.honeypoint.board.model.vo.Board;
import com.kh.honeypoint.board.model.vo.PageInfo;
import com.kh.honeypoint.board.model.vo.Pagination;
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

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("board/boardListView");
		} else {
			throw new boardException("게시글 목록 조회에 실패하였습니다");
		}
		return mv;
	}

	@RequestMapping("binsertView.do")
	public String boardInsertView() {
		return "board/boardInsertForm";
	}

	// 파일 저장을 위한 별도 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장 될 경로 설정
		// 해당 resources는 webapp 하위의 resources
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\buploadFiles";

		File folder = new File(savePath); // savePath 폴더를 불러와서
		// 해당 폴더 경로가 존재하는지 확인하고
		if (!folder.exists()) { // 존재하지 않는다면
			folder.mkdirs(); // 해당 경로를 먼저 생성한다
		}

		// 파일 rename 규칙 -> 년월일시분초.확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + originFileName.substring(originFileName.lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return renameFileName;
	}

	@RequestMapping("bdetail.do")
	public ModelAndView boardDetail(ModelAndView mv, int bNo, @RequestParam("page") Integer page,
			HttpServletRequest request, HttpServletResponse response) {

		int currentPage = page != null ? page : 1;

		Board board = null;

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
		}

		if (board != null) {
			mv.addObject("board", board).addObject("currentPage", currentPage).setViewName("board/boardDetailView");
		} else {
			throw new boardException("게시글 상세조회에 실패하였습니다");
		}

		return mv;
	}

}
