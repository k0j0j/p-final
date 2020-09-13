package com.kh.honeypoint.admin.Inqry.model.dao;

import java.sql.Date;
import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.admin.Inqry.model.vo.InqryMgt;
import com.kh.honeypoint.admin.common.PageInfo;
import com.kh.honeypoint.admin.common.SearchPaging;
import com.kh.honeypoint.admin.reportMgt.model.vo.Report;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Repository("inqMDao")
public class InqryMgtDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectListCount() {
		return Integer.parseInt((String) sqlSession.selectOne("InqryMgtMapper.selectListCount"));
	}

	public ArrayList<InqryMgt> InqryMgtList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<InqryMgt> list = (ArrayList)sqlSession.selectList("InqryMgtMapper.InqryMgtList", null, rowBounds);
		return list;
	}
	
	
	
	

	public int InqryMgtMCount() {
		return Integer.parseInt((String) sqlSession.selectOne("InqryMgtMapper.InqryMgtMCount"));
	}

	public ArrayList<InqryMgt> InqryMgtM(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<InqryMgt> list = (ArrayList)sqlSession.selectList("InqryMgtMapper.InqryMgtM", null, rowBounds);
		return list;
	}
	
	
	
	
	
	public int InqryMgtRCount() {
		return Integer.parseInt((String) sqlSession.selectOne("InqryMgtMapper.InqryMgtRCount"));
	}

	public ArrayList<InqryMgt> InqryMgtR(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<InqryMgt> list = (ArrayList)sqlSession.selectList("InqryMgtMapper.InqryMgtR", null, rowBounds);
		return list;
	}

	
	
	
	
	public int InqryMgtListSearchCount(SearchPaging sp) {
		return Integer.parseInt((String) sqlSession.selectOne("InqryMgtMapper.InqryMgtListSearchCount", sp));
	}

	public ArrayList<InqryMgt> InqryMgtListSearch(SearchPaging sp) {
		System.out.println("Dao: " + sp);
		int offset = (sp.getCurrentPage() -1) * sp.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset, sp.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("InqryMgtMapper.InqryMgtListSearch", sp, rowbounds);
	}

}
