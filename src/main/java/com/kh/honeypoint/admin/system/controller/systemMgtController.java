package com.kh.honeypoint.admin.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class systemMgtController {
	/**************************************************/
	/* INQURY LIST */
	@RequestMapping("inquryList.do")
		public String inquryMgt() {
		return "admin/system/inquryMgt";
	}
	
	@RequestMapping("memInquryMgt.do")
		public String memInquryMgt() {
		return "admin/system/Mem_InquryMgt";
	}
	
	@RequestMapping("rstInquryMgt.do")
		public String rstInquryMgt() {
		return "admin/system/Rst_InqueryMgt";
	}
	
	
	
	
	/**************************************************/
	/*  ADVRTS LIST */
	@RequestMapping("advrtsList.do")
	public String advrtsMgt() {
		return "admin/system/advrts_List";
	}
	
	@RequestMapping("advrtsInsertMgt.do")
		public String advrtsInsertMgt() {
		return "admin/system/advrts_InsertMgt";
	}
	
	@RequestMapping("advrtsDeleteMgt.do")
	public String advrtsDeleteMgt() {
		return "admin/system/advrts_DeleteMgt";
	}
}
