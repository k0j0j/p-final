package com.kh.honeypoint.mypage.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.honeypoint.mypage.common.PageInfo;
import com.kh.honeypoint.mypage.member.model.vo.PaidPoint;
import com.kh.honeypoint.mypage.member.model.vo.ReservePay;
import com.kh.honeypoint.member.model.vo.Member;
import com.kh.honeypoint.mypage.member.model.vo.gnrlMember;
import com.kh.honeypoint.mypage.member.model.vo.mPassWord;

@Repository("mmpDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	
	// 일반회원 정보수정
	public int updateMember(Member m) {
		return sqlSession.update("membermpMapper.updateMember", m);				
	}
	
	public int updategnrlMember(gnrlMember gm) {
		return sqlSession.update("membermpMapper.updategnrlMember", gm);
	}

	public int updatemPassWord(mPassWord upw) {
		return sqlSession.update("membermpMapper.updatemPassWord",upw);
	}

	// 일반회원 탈퇴
	public int deleteMember(String mId) {
		System.out.println(mId);
		int result = sqlSession.delete("membermpMapper.deletempMember", mId);
		if(result != 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		return result;
	}

	
	// 예약 결제내역
	public int selectReservePayListCount() {
		return Integer.parseInt((String) sqlSession.selectOne("membermpMapper.selectReservePayListCount"));
	}

	public ArrayList<ReservePay> selectReservePayList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		ArrayList<ReservePay> list = (ArrayList)sqlSession.selectList("membermpMapper.selectReservePayList", null, rowBounds);
		return list;
	}

	// 회원구분
	public Member selectMember(Member m) {
		return sqlSession.selectOne("memberMapper.memSort",m);		
	}

	// 포인트 지급내역
	public int selectPaidPointListCount() {		
		return sqlSession.selectOne("membermpMapper.selectPaidPointListCount");
	}

	public ArrayList<PaidPoint> selectPaidPointList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		
/*		ArrayList<PaidPoint> list = (ArrayList)sqlSession.selectList("membermpMapper.selectPaidPointList", null, rowBounds);*/
		/*System.out.println("list" + list);*/

		return (ArrayList)sqlSession.selectList("membermpMapper.selectPaidPointList", null, rowBounds);
	}
	
	

	


}
