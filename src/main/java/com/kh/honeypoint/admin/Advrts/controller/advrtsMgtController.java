package com.kh.honeypoint.admin.Advrts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class advrtsMgtController {
	
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
