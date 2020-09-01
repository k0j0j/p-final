package com.kh.honeypoint.restaurant.controller;

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


@Controller
public class RestaurantController {
	@Autowired
	
	private RestaurantService rService;
	
	private Logger logger = LoggerFactory.getLogger(RestaurantController.class);
	
	@RequestMapping("detail.do")
	public ModelAndView restaurantDetail(ModelAndView mv, int rNo,
			HttpServletRequest request, HttpServletResponse response) {
		
			Restaurant restaurant = null;
			
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
				restaurant = rService.selectRestaurant(rNo, flag);
				
			}
		
		
		
		return mv;
	}
}
