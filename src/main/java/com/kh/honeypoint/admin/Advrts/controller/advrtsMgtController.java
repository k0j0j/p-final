package com.kh.honeypoint.admin.Advrts.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.honeypoint.admin.Advrts.model.exception.AdvrtsMgtException;
import com.kh.honeypoint.admin.Advrts.model.service.AdvrtsMgtService;
import com.kh.honeypoint.admin.Advrts.model.vo.AdvrtsMgt;
import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.Pagination;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.member.model.vo.Member;

@SessionAttributes({"loginUser", "msg", "mngPosition"})
@Controller
public class advrtsMgtController {
	@Autowired
	private AdvrtsMgtService adMService;
	
	private Logger logger = LoggerFactory.getLogger(advrtsMgtController.class);
	
	
	
	/*  ADVRTS LIST */
	@RequestMapping("advrtsList.do")
	public ModelAndView AdvrtsList(ModelAndView mv, 
			  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page,
			  @SessionAttribute String mngPosition) {
		
		/* ADMIN LEVEL */
		if(!mngPosition.contains("광고관리")) {
			throw new AdvrtsMgtException("광고 관리 권한이 없습니다.");
		}
		
		int currentPage = page != null ? page : 1;		
		int listCount = adMService.AdvrtsListCount();		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		System.out.println("Page: " + currentPage + ", " + listCount);
		
		ArrayList<AdvrtsMgt> list = adMService.AdvrtsList(pi);
		
		SearchPaging sp = new SearchPaging(pi.getCurrentPage(), pi.getListCount(),pi.getPageLimit() , 
				pi.getMaxPage(), pi.getStartPage(), pi.getEndPage(), pi.getBoardLimit());
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/AdvrtsMgt/advrts_List");
		} else {
			throw new AdvrtsMgtException("광고 목록 조회에 실패했습니다.");
		}		
		return mv;
	}
	
	/* ADVRTS INSERT */
	@RequestMapping("advrtsIn.do")
	public String advrtsIn(int bNo) {	
		
		int result = adMService.advrtsIn(bNo);

		if(result > 0) {
			
			return "redirect:advrtsIList.do";
		} else {			
			return "admin/Advrts/model/exceptiont/AdvrtsMgtException"; 
		}
	}
	
	/* ADVRTS DETAIL PAGE */
	@RequestMapping("adDetail.do")
	public ModelAndView selectAdvrts(ModelAndView mv, HttpServletRequest request, int bNo, HttpServletResponse response,
			@SessionAttribute String mngPosition) {
		
		/* ADMIN LEVEL */
		if(!mngPosition.contains("광고관리")) {
			throw new AdvrtsMgtException("광고 관리 권한이 없습니다.");
		}

		AdvrtsMgt ad = adMService.selectAdvrts(bNo);	
	
		if (ad != null) {
			mv.addObject("ad", ad);
			mv.setViewName("/admin/AdvrtsMgt/advrts_Detail");
			System.out.println("controller: " + ad.getBnrRFile());
			return mv;
		} else {
			throw new AdvrtsMgtException("광고 상세 페이지 조회에 실패했습니다.");
		}		
	}
	
	/* ADVRTS DELETE */
	@RequestMapping("advrtsDel.do")
	public String advrtsDel(int bNo){	
		
		int result = adMService.advrtsDel(bNo);

		if(result > 0) {
			return "redirect:/advrtsDList.do";
		} else {	
			return "admin/Advrts/model/exceptiont/AdvrtsMgtException";
		}
	}
	
	/* INSERT PAGE */
	@RequestMapping("advrtsInView.do")
	   public String advrtsInView() {		
		   return "admin/AdvrtsMgt/advrts_InView";
	   }
	
	
	
	
	@RequestMapping("advrtsIList.do")
	public ModelAndView AdvrtsIList(ModelAndView mv, 
				  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page,
				  @SessionAttribute String mngPosition) {
		
			/* ADMIN LEVEL */
			if(!mngPosition.contains("광고관리")) {
				throw new AdvrtsMgtException("광고 관리 권한이 없습니다.");
			}
			
			int currentPage = page != null ? page : 1;		
			int listCount = adMService.AdvrtsIListCount();		
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			System.out.println("Page: " + currentPage + ", " + listCount);
			
			ArrayList<AdvrtsMgt> list = adMService.AdvrtsIList(pi);
			
			SearchPaging sp = new SearchPaging(pi.getCurrentPage(), pi.getListCount(),pi.getPageLimit() , 
					pi.getMaxPage(), pi.getStartPage(), pi.getEndPage(), pi.getBoardLimit());
			
			if(list != null) {
				mv.addObject("list", list);
				mv.addObject("sp", sp);
				mv.setViewName("/admin/AdvrtsMgt/advrts_InsertMgt");
			} else {
				throw new AdvrtsMgtException("등록된 광고 조회에 실패했습니다.");
			}		
			return mv; 
	}
	
	/* ADVRTS DELETE */
	@RequestMapping("advrtsOff.do")
	public String advrtsOff(int bNo) {	
		
		int result = adMService.advrtsOff(bNo);

		if(result > 0) {
			
			return "redirect:advrtsIList.do";
		} else {			
			return "admin/Advrts/model/exceptiont/AdvrtsMgtException"; 
		}
	}
	
	
	
	
		
	@RequestMapping("advrtsDList.do")
	public ModelAndView advrtsDList(ModelAndView mv, 
			  @RequestParam(value="currentPage", required=false, defaultValue="1") Integer page,
			  @SessionAttribute String mngPosition) {
		
		/* ADMIN LEVEL */
		if(!mngPosition.contains("광고관리")) {
			throw new AdvrtsMgtException("광고 관리 권한이 없습니다.");
		}
		
		int currentPage = page != null ? page : 1;		
		int listCount = adMService.advrtsDListCount();		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		System.out.println("Page: " + currentPage + ", " + listCount);
		
		ArrayList<AdvrtsMgt> list = adMService.advrtsDList(pi);
		
		SearchPaging sp = new SearchPaging(pi.getCurrentPage(), pi.getListCount(),pi.getPageLimit() , 
				pi.getMaxPage(), pi.getStartPage(), pi.getEndPage(), pi.getBoardLimit());
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("sp", sp);
			mv.setViewName("/admin/AdvrtsMgt/advrts_DeleteMgt");
		} else {
			throw new AdvrtsMgtException("삭제된 광고 조회에 실패했습니다.");
		}		
		return mv;
	}
	
	
	
	
	
	@RequestMapping("adInsert.do")
	public String adInsert(AdvrtsMgt ad, HttpServletRequest request,
			@RequestParam(value="bnrFile", required = false) MultipartFile file){
		
		if (!file.getOriginalFilename().equals("")) {
			String bnrRFile = saveFile(file, request);
			if(bnrRFile != null) {
				ad.setBnrOFile(file.getOriginalFilename());
				ad.setBnrRFile(bnrRFile);
			}			
		}
		
		int result = adMService.adInsert(ad);
		
		if(result > 0) {
			if(logger.isDebugEnabled()) {
				logger.debug(ad.getBnrNm() + " 광고가 등록되었습니다.");
			}
			return "redirect:advrtsList.do";
		} else {
			throw new AdvrtsMgtException("광고를 등록할 수 없습니다.");
		}
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\img\\admin\\banner";
		
		File folder = new File(savePath);
		if(folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String bnrOFile = file.getOriginalFilename();
		String bnrRFile = sdf.format(new Date()) + bnrOFile.substring(bnrOFile.lastIndexOf("."));
		String renamePath = folder + "\\" + bnrRFile;
		
		try {
			file.transferTo(new File(renamePath));			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return bnrRFile;
	}
}
