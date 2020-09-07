package com.kh.honeypoint.restaurant.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.honeypoint.restaurant.model.service.RestaurantService;
import com.kh.honeypoint.restaurant.model.vo.Restaurant;
import com.kh.honeypoint.restaurant.model.vo.Review;
import com.kh.honeypoint.restaurant.model.vo.RstrntMenu;
import com.kh.honeypoint.restaurant.model.vo.Photofile;

@Controller
public class RestaurantController {
	@Autowired
	private RestaurantService rService;
	
	private Logger logger = LoggerFactory.getLogger(RestaurantController.class);
	
	@RequestMapping("detail.do")
	public ModelAndView restaurantDetail(ModelAndView mv, int rNo,
			HttpServletRequest request, HttpServletResponse response) {
		
			Restaurant restaurant = null;
			ArrayList<Photofile> imgList = null;
			int imgListCount = 0;
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
				// System.out.println("controller flag : " + flag );
				restaurant = rService.selectRestaurant(rNo, flag);
				imgListCount = rService.selectImgListCount(rNo);
				imgList =  rService.selectImgList(rNo);
				menuList = rService.selectMenuList(rNo);
				//reviewList = rService.selectReviewList(rNo);
				
				
			}
			
			if(restaurant != null) {
				mv.addObject("restaurant", restaurant)
				  .addObject("imgList", imgList)
				  .addObject("menuList", menuList)
				  .setViewName("restaurant/detailPage");
			}else {
/*				throw new BoardException("게시글 상세조회에 실패하였습니다."); */
				System.out.println("실패");
			}
			
		return mv;
	}
	
	@RequestMapping("moreReview.do")
	public ModelAndView selectReviewList(ModelAndView mv, int rNo, int startNum, HttpServletResponse response) {
		
		
		HashMap<String, Integer> value = new HashMap<String, Integer>();
		value.put("rNo", rNo);
		value.put("startNum", startNum);
		
		ArrayList<Review> reviewList = rService.selectReviewList(value);
		
		System.out.println(reviewList);
		
		Map<String, ArrayList<Review>> map = new HashMap<String, ArrayList<Review>>();
		map.put("reviewList", reviewList);
		
		
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		
		response.setContentType("application/json; charset=utf-8");
		
		return mv;
		
	}
}
