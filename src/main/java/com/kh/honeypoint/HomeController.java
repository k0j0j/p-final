
package com.kh.honeypoint;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	 * @RequestMapping(value = "/home.do", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) {
	 * logger.info("Welcome home! The client locale is {}.", locale);
	 * 
	 * Date date = new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate );
	 * 
	 * return "home"; }
	 */
	@RequestMapping("main.do")
	public String mainPage() {
		return "main/main";
	}

	/*@RequestMapping("detail.do")
	public String detailPage() {
		return "restaurant/detailPage";
	}*/

	@RequestMapping("contact.do")
	public String contactPage() {
		return "main/contact";
	}

	@RequestMapping("reviewWrite.do")
	public String reviewWritePage(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String attempted = (String)session.getAttribute("attempt");
		
		System.out.println(attempted);
		
		if(StringUtils.isNotEmpty(attempted)) {
			try {
				response.sendRedirect(attempted);
			} catch (IOException e) {
				e.printStackTrace();
			}
			session.removeAttribute("attempt");
		}
		
		return "restaurant/writeReviewPage";
	}

	@RequestMapping("searchlocation.do")
	public String searchLocation() {
		return "restaurant/searchLocation";
	}

	@RequestMapping("more.do")
	public String morePage() {
		return "main/more";
	}
	
	@RequestMapping("notice.do")
	public String noticePage() {
		return "main/notice";
	}
}
