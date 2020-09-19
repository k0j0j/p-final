package com.kh.honeypoint.restaurant.controller;

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
import javax.servlet.http.HttpSession;

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

import com.kh.honeypoint.member.model.vo.Member;
import com.kh.honeypoint.restaurant.model.exception.RestaurantException;
import com.kh.honeypoint.restaurant.model.service.RestaurantService;
import com.kh.honeypoint.restaurant.model.vo.Restaurant;
import com.kh.honeypoint.restaurant.model.vo.Review;
import com.kh.honeypoint.restaurant.model.vo.ReviewCount;
import com.kh.honeypoint.restaurant.model.vo.ReviewImg;
import com.kh.honeypoint.restaurant.model.vo.RstrntMenu;
import com.kh.honeypoint.restaurant.model.vo.UpdateReviewImg;
import com.kh.honeypoint.restaurant.model.vo.Favor;
import com.kh.honeypoint.restaurant.model.vo.InsertReviewImg;
import com.kh.honeypoint.restaurant.model.vo.Photofile;

@Controller
public class RestaurantController {
	@Autowired
	private RestaurantService rService;
	
	private Logger logger = LoggerFactory.getLogger(RestaurantController.class);
	
	@RequestMapping("detail.do")
	public ModelAndView restaurantDetail(ModelAndView mv, int rNo,
			HttpServletRequest request, HttpServletResponse response) {
		
			// 카운팅
			int imgListCount = 0;
			ReviewCount reviewCount = null;
			int favorCount = 0;
			Favor userFavor = null;
			
			// 찜했는지 안했는지 여부 확인
			HttpSession session = request.getSession();
			Member loginUser = (Member)session.getAttribute("loginUser");
			
			if(loginUser != null) {
				Favor inputFavor = new Favor();
				inputFavor.setMNo(loginUser.getmNo());
				inputFavor.setRNo(rNo);
				userFavor = rService.selectFavor(inputFavor);
			}
			
			// 맛집 정보
			Restaurant restaurant = null;
			
			// 리스트
			ArrayList<Photofile> imgList = null;
			ArrayList<RstrntMenu> menuList = null;
			ArrayList<Review> reviewList = null;
			
			
			// 쿠키 값을 이용하여 게시글 읽음 여부 확인
			boolean flag = false;
			Cookie[] cookies = request.getCookies();
			if(cookies != null) {
				for(Cookie c : cookies) {
					if(c.getName().equals("rNo"+rNo)) {
						// 해당 게시글에 대한 쿠키 존재(이미 게시글을 읽었음)
						flag = true;
					}
				}
				if(!flag) { // 게시글을 처음 읽을 경우 쿠키 저장하기
					Cookie c = new Cookie("rNo"+rNo, String.valueOf(rNo));
					c.setMaxAge(1 * 24 * 60 * 60); // 하루동안 저장
					response.addCookie(c);
					
				}
				
				imgListCount = rService.selectImgListCount(rNo);
				reviewCount = rService.selectReviewCount(rNo);
				favorCount = rService.selectFavorCount(rNo);
				
				restaurant = rService.selectRestaurant(rNo, flag);
				
				imgList =  rService.selectImgList(rNo);
				menuList = rService.selectMenuList(rNo);
				
				
				
			}
			
			if(restaurant != null) {
				mv.addObject("restaurant", restaurant)
				  .addObject("imgList", imgList)
				  .addObject("menuList", menuList)
				  .addObject("reviewCount", reviewCount)
				  .addObject("favorCount", favorCount)
				  .setViewName("restaurant/detailPage");
				
				if(userFavor != null) {
					mv.addObject("userFavor", userFavor);
				}
				
			}else {
				throw new RestaurantException("맛집 상세조회에 실패하였습니다.");

			}
			
		return mv;
	}
	
	@RequestMapping("moreReview.do")
	public ModelAndView selectReviewList(ModelAndView mv, int rNo, int startNum, int filterCheck, HttpServletResponse response) {
		
		HashMap<String, Integer> value = new HashMap<String, Integer>();
		value.put("rNo", rNo);
		value.put("startNum", startNum);
		value.put("filterCheck", filterCheck);
		
		ArrayList<Review> reviewList = null;
		
		if(filterCheck == 0) {
			reviewList = rService.selectReviewList(value);
		}else if(filterCheck == 1) {
			reviewList = rService.selectReviewFilterList(value);
		}else if(filterCheck == 2) {
			reviewList = rService.selectReviewFilterList(value);
		}else {
			reviewList = rService.selectReviewFilterList(value);
		}
		

		
		Map<String, ArrayList<Review>> map = new HashMap<String, ArrayList<Review>>();
		map.put("reviewList", reviewList);
		
		
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		
		response.setContentType("application/json; charset=utf-8");
		
		return mv;
		
	}
	
	@RequestMapping("moreReviewImg.do")
	public ModelAndView selectReviewImgList(ModelAndView mv, int rNo, int revNo, HttpServletResponse response) {
		
		HashMap<String, Integer> value = new HashMap<String, Integer>();
		value.put("rNo", rNo);
		value.put("revNo", revNo);
		
		ArrayList<ReviewImg> reviewImgList = rService.selectReviewImgList(value);
		
		Map<String, ArrayList<ReviewImg>> map = new HashMap<String, ArrayList<ReviewImg>>();
		map.put("reviewImgList", reviewImgList);
		
		
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		
		response.setContentType("application/json; charset=utf-8");
		
		return mv;
		
	}
	
	@RequestMapping(value="insertReview.do", method = RequestMethod.POST)
	public String boardInsert(Review rev, HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multi) {
		
		int result1 = rService.insertReview(rev);

		if(result1 > 0) {
			if(multi.getFileNames().hasNext()) {
				
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\img\\review";
				String fileName = "";
				ArrayList<String> originFileList = new ArrayList<String>();
				ArrayList<String> renameFileList = new ArrayList<String>();
				
				File folder = new File(savePath);

				if(!folder.exists()) {
					folder.mkdirs();
				}
				
				Iterator<String> files = multi.getFileNames();
				
				while(files.hasNext()) {
					String uploadFile = files.next();
					
					MultipartFile mFile = multi.getFile(uploadFile);
					System.out.println("원본 파일 이름 : " +  mFile.getOriginalFilename());
					if(mFile.getOriginalFilename().equals("")) {
						continue;
					}
					
					// 파일 이름짓기
					int ranNum = (int)(Math.random() * 100000);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String originFileName = mFile.getOriginalFilename();
					fileName = sdf.format(new Date()) + "_" + ranNum 
							+ originFileName.substring(originFileName.lastIndexOf("."));
					
					try {
						System.out.println(folder + "\\"  + fileName);
						mFile.transferTo(new File(folder + "\\"  + fileName));
						
						originFileList.add(originFileName);
						renameFileList.add(fileName);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				if(originFileList.isEmpty()) {
					return "redirect:detail.do?rNo=" + rev.getRNo();
				}
				
				InsertReviewImg value = new InsertReviewImg();
				
				value.setRNo(rev.getRNo());
				value.setOriginFileList(originFileList);
				value.setRenameFileList(renameFileList);

				int result2 = rService.insertReviewImg(value);
				
				if(result2 > 0) {
					if(logger.isDebugEnabled()) {
						logger.debug(rev.getRevNo() + "번째 리뷰가 생성되었습니다.");
					}
					
					return "redirect:detail.do?rNo=" + rev.getRNo();
					
				}else {
					
					throw new RestaurantException("리뷰 이미지 등록에 실패하였습니다.");
					
				}
				
			}else {
				
				return "redirect:detail.do?rNo=" + rev.getRNo();
				
			}
		}else {
			
			throw new RestaurantException("리뷰 등록에 실패하였습니다.");
			
		}
		
		
	}
	
	@RequestMapping("updateReviewView.do")
	public ModelAndView updateReviewView(ModelAndView mv, 
			@RequestParam("rNo") int rNo, @RequestParam("revNo") int revNo) {
		
		Review rev = rService.selectReview(rNo, revNo);
		
		HashMap<String, Integer> value = new HashMap<String, Integer>();
		value.put("rNo", rNo);
		value.put("revNo", revNo);
		
		ArrayList<ReviewImg> reviewImgList = rService.selectReviewImgList(value);
		
		
		if(rev != null) {
			mv.addObject("img", reviewImgList);
			mv.addObject("review", rev);
			mv.setViewName("restaurant/updateReviewPage");
		}else {
			throw new RestaurantException("리뷰 수정 페이지를 불러오는데 실패하였습니다.");
		}

		return mv;
	}
	
	@RequestMapping(value="updateReview.do", method = RequestMethod.POST)
	public String updateReview(Review rev, MultipartHttpServletRequest multi, HttpServletRequest request, @RequestParam("lastNumber") int lastNumber) {
		int result = 0;
		System.out.println(rev);
		String[] names = request.getParameterValues("deleteNames");
		
		//System.out.println(names.length);
		//System.out.println(names[0]);
		if(names != null) {
			// int result = rService.deleteReviewImg(rev, names);
			for(int i = 0; i < names.length; i++) {
				result = rService.deleteReviewImage(names[i]);
			}
			
			
			if(result == 0) {
				throw new RestaurantException("기존 리뷰 이미지 삭제 실패.");
			}else {
				int result1 = rService.updateReview(rev);
				
				if(result1 == 0) {
					throw new RestaurantException("리뷰 내용 수정 실패.");
				}
			}
		}
		
		// 새로운 리뷰 이미지 파일 첨부
		
		if(multi.getFileNames().hasNext()) {
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\img\\review";
			String fileName = "";
			ArrayList<String> originFileList = new ArrayList<String>();
			ArrayList<String> renameFileList = new ArrayList<String>();
			
			File folder = new File(savePath);

			if(folder.exists()) {
				folder.mkdirs();
			}
			
			Iterator<String> files = multi.getFileNames();
			
			while(files.hasNext()) {
				String uploadFile = files.next();
				
				MultipartFile mFile = multi.getFile(uploadFile);
				System.out.println("원본 파일 이름 : " +  mFile.getOriginalFilename());
				if(mFile.getOriginalFilename().equals("")) {
					continue;
				}
				
				// 파일 이름짓기
				int ranNum = (int)(Math.random() * 100000);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String originFileName = mFile.getOriginalFilename();
				fileName = sdf.format(new Date()) + "_" + ranNum 
						+ originFileName.substring(originFileName.lastIndexOf("."));
				
				try {
					System.out.println(folder + "\\"  + fileName);
					mFile.transferTo(new File(folder + "\\"  + fileName));
					originFileList.add(originFileName);
					renameFileList.add(fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			if(originFileList.isEmpty()) {
				return "redirect:detail.do?rNo=" + rev.getRNo();
			}
			
			UpdateReviewImg value = new UpdateReviewImg();
			
			value.setRNo(rev.getRNo());
			value.setRevNo(rev.getRevNo());
			value.setOriginFileList(originFileList);
			value.setRenameFileList(renameFileList);
			
			ArrayList<Integer> lastNumberCount = new ArrayList<Integer>();
			System.out.println("리네임파일크기 : " + renameFileList.size());
			if(lastNumber != 0) {
				for(int i = lastNumber + 1; i < lastNumber + renameFileList.size() + 1; i++) {
					lastNumberCount.add(i);
				}
			}else {
				lastNumberCount.add(1);
			}
			
			
			value.setLastNumberCount(lastNumberCount);
			
			int result2 = rService.updateReviewImg(value);
			
			if(result2 > 0) {
				if(logger.isDebugEnabled()) {
					logger.debug(rev.getRevNo() + "번째 리뷰가 생성되었습니다.");
				}
				
				return "redirect:detail.do?rNo=" + rev.getRNo();
				
			}else {
				
				throw new RestaurantException("리뷰 이미지 등록에 실패하였습니다.");
				
			}
			
		}else {
			
			return "redirect:detail.do?rNo=" + rev.getRNo();
			
		}
		
		
		
		
		
	
	}
	
	@RequestMapping("deleteReview.do")
	public ModelAndView deleteReview(ModelAndView mv, int rNo, int revNo, HttpServletResponse response, HttpServletRequest request) {
		System.out.println(revNo);
		
		int result = rService.deleteReview(revNo);
		
		if(result != 0) {
			
			ArrayList<String> names = new ArrayList<String>();
			
			names = rService.getRevImgNames(revNo);
			System.out.println("names : " + names);
			if(names != null) {
				// int result = rService.deleteReviewImg(rev, names);
				for(int i = 0; i < names.size(); i++) {
					result = rService.deleteReviewImage(names.get(i));
					
					if(result != 0) {
						String root = request.getSession().getServletContext().getRealPath("resources");
						String savePath = root + "\\img\\review";
						
						File deleteFile = new File(savePath + "\\" + names.get(i));
						
						if(deleteFile.exists()) {
							deleteFile.delete();
							System.out.println( i + "번째 파일 삭제 성공");
						}
					}
					
				}
				
				if(result != 0) {
					// 여기다 카운팅 메소드 넣을거임
					ReviewCount reviewCount = rService.selectReviewCount(rNo);
					
					mv.addObject("reviewCount", reviewCount);
					mv.setViewName("jsonView");
					
					response.setContentType("application/json; charset=utf-8");
					
					return mv;
					
				}
			}
			
			
			
			
		}else {
			throw new RestaurantException("리뷰  삭제에 실패하였습니다.");
		}
		ReviewCount reviewCount = rService.selectReviewCount(rNo);
		
		mv.addObject("reviewCount", reviewCount);
		
		mv.setViewName("jsonView");
		
		response.setContentType("application/json; charset=utf-8");
		
		return mv;

	}
	
	@RequestMapping("favor.do")
	public ModelAndView favorControl(ModelAndView mv, Favor favor, int favoriteCount, HttpServletResponse response) {
		
		int result;
		
		if(favoriteCount % 2 == 1) {
			result = rService.insertFavor(favor);
		}else {
			result = rService.deleteFavor(favor);
		}
		
		if(result != 0) {
			mv.setViewName("jsonView");
			
			response.setContentType("application/json; charset=utf-8");
			
			return mv;
		}else {
			throw new RestaurantException("찜하기 제어에 실패하였습니다.");
		}
		
	}
	
		
	// 리뷰지우기 기능 보류
	
	/*@RequestMapping("deleteImgFile.do")
	public ModelAndView deleteImgFile(ModelAndView mv, ReviewImg revImg, HttpServletRequest request, HttpServletResponse response) {
		
		String fileName = rService.deleteImgFile(revImg);
		System.out.println("db에서 삭제한 filename : " + fileName);
		
		if(!fileName.equals("")) {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\img\\review";
			
			File deleteFile = new File(savePath + "\\" + fileName);
			
			if(deleteFile.exists()) {
				deleteFile.delete();
				System.out.println("삭제 성공");
			}
			
		}
		mv.setViewName("jsonView");
		
		response.setContentType("application/json; charset=utf-8");
		
		return mv;
	}*/

}
